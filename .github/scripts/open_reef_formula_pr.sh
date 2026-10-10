#!/usr/bin/env bash
set -euo pipefail

: "${GH_TOKEN:?missing tap GitHub App token}"
: "${VERSION:?missing Reef version}"

branch="formula/reef-v$VERSION"
base_sha="$GITHUB_SHA"
branch_error="${RUNNER_TEMP}/reef-branch-error.txt"
if branch_sha=$(gh api "repos/$GITHUB_REPOSITORY/git/ref/heads/$branch" \
  --jq .object.sha 2> "$branch_error"); then
  :
elif grep -q '(HTTP 404)' "$branch_error"; then
  gh api "repos/$GITHUB_REPOSITORY/git/refs" --method POST \
    -f ref="refs/heads/$branch" -f sha="$base_sha" >/dev/null
  branch_sha="$base_sha"
else
  cat "$branch_error" >&2
  exit 1
fi

if [[ "$branch_sha" == "$base_sha" ]]; then
  commit_sha=$(gh api graphql \
    -f query="$(< .github/queries/create_reef_formula_commit.graphql)" \
    -f repo="$GITHUB_REPOSITORY" -f branch="$branch" \
    -f head="$base_sha" \
    -f headline="chore(formula): update Reef to v$VERSION" \
    -f contents="$(base64 < Formula/reef.rb | tr -d '\n')" \
    --jq .data.createCommitOnBranch.commit.oid)
else
  commit_sha="$branch_sha"
  gh api "repos/$GITHUB_REPOSITORY/contents/Formula/reef.rb?ref=$branch" \
    --jq .content | base64 -d | cmp - Formula/reef.rb
  parent_sha=$(gh api "repos/$GITHUB_REPOSITORY/commits/$commit_sha" \
    --jq '.parents[0].sha')
  changed_files=$(gh api \
    "repos/$GITHUB_REPOSITORY/compare/$parent_sha...$commit_sha" \
    --jq '[.files[].filename] | sort | join(" ")')
  test "$changed_files" = Formula/reef.rb
  base_status=$(gh api \
    "repos/$GITHUB_REPOSITORY/compare/$parent_sha...$base_sha" \
    --jq .status)
  [[ "$base_status" == ahead || "$base_status" == identical ]]
fi

verified=$(gh api "repos/$GITHUB_REPOSITORY/commits/$commit_sha" \
  --jq .commit.verification.verified)
test "$verified" = true

pr=$(gh pr list --repo "$GITHUB_REPOSITORY" --head "$branch" \
  --state open --json url --jq '.[0].url // empty')
if [[ -z "$pr" ]]; then
  body=$(printf '# Summary\n\n- Update the Reef formula to v%s\n\n## Motivation\n\n> Changelog: skip\n\nReef v%s is published, but the tap still installs the previous version.\n\n## Implementation information\n\n- Update all supported platform URLs and verified SHA-256 checksums\n- Pass the updater tests, strict Homebrew audit, install, and formula test\n' "$VERSION" "$VERSION")
  pr=$(gh pr create --repo "$GITHUB_REPOSITORY" --base main \
    --head "$branch" --title "chore(formula): update Reef to v$VERSION" \
    --body "$body")
fi
echo "Formula update PR: $pr"
