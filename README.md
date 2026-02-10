# Homebrew Tap

Official Homebrew tap for smykla-skalski projects.

## Projects

- **[klab](https://github.com/smykla-skalski/klab)** - Kubernetes networking troubleshooting lab framework (private repository)
- **[klaudiush](https://github.com/smykla-skalski/klaudiush)** - Claude Code hooks validator (public repository)

## Installation

### klab (Private Repository)

Requires GitHub authentication token:

```bash
# Set your GitHub token (required for private repository access)
export HOMEBREW_GITHUB_API_TOKEN=$(gh auth token)

# Install klab
brew install smykla-skalski/tap/klab

# Verify installation
klab version
```

### klaudiush (Public Repository)

```bash
# Install klaudiush
brew install smykla-skalski/tap/klaudiush

# Verify installation
klaudiush --version
```

## Updating

```bash
brew upgrade klab
brew upgrade klaudiush
```

## Uninstalling

```bash
brew uninstall klab
brew uninstall klaudiush
```

## Automated Updates

Both formulas are automatically updated when new releases are published:

- **klab**: Updated via GitHub Actions workflow triggered by repository dispatch events
- **klaudiush**: Updated via GoReleaser on tag push

## Issues

If you encounter any issues with the formulas:

- **klab issues**: [smykla-skalski/klab/issues](https://github.com/smykla-skalski/klab/issues)
- **klaudiush issues**: [smykla-skalski/klaudiush/issues](https://github.com/smykla-skalski/klaudiush/issues)
