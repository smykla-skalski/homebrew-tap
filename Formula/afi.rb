# typed: false
# frozen_string_literal: true

# Rewritten in full by .github/workflows/update-afi-formula.yml on every afi
# release. Edit the template in that workflow, not this file, or the next
# release will quietly undo you.
#
# There is deliberately no `version` stanza. Homebrew reads the version out of
# the `v0.18.0` segment of the URLs, and `brew audit --strict` rejects an explicit
# one as redundant, so the tag in the URLs is the only place a version appears.
class Afi < Formula
  desc "Deliberately tiny coding agent for self-hosted or remote models"
  homepage "https://github.com/smykla-skalski/afi"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.18.0/afi-x86_64-apple-darwin.tar.gz"
      sha256 "e5d1609a2cb2d16112758b93f40cc68939e47fbd4e2bb779a783b9a8927dd712"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.18.0/afi-aarch64-apple-darwin.tar.gz"
      sha256 "9903958f2147b4150f972739023f570314fd8123f9d3448bb4a42e2f29dae642"
    end
  end

  # The musl builds on both architectures, not the glibc one afi also publishes.
  # They are static and declare no dependencies, so they run whatever the host's
  # glibc turns out to be, which is the same reason afi's own install.sh serves
  # musl to every Linux.
  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.18.0/afi-x86_64-unknown-linux-musl.tar.gz"
      sha256 "080a474a5bb58dbc6abff66a3b98ea5fc0c08871e866f5ebdc5ff0c7d64b5b3b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.18.0/afi-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1a8182da47e9fa5198e8cca7c23c28f42f0f6989213522a9f224fec8ac05222c"
    end
  end

  def install
    bin.install "afi"
    doc.install "README.md", "CHANGELOG.md"

    # Guarded, unlike the same block in the af formula, because this workflow
    # runs in the *last* job of an afi release - after the crate is published,
    # which is the one publication a release cannot undo. An archive built
    # before afi learned to generate these carries only the binary and the
    # docs, and the tap must not be the thing that fails such a release.
    return unless (buildpath/"afi.1").exist?

    bash_completion.install "completions/afi.bash" => "afi"
    fish_completion.install "completions/afi.fish"
    zsh_completion.install "completions/_afi"
    man1.install "afi.1"
  end

  def caveats
    <<~CAVEATS
      afi needs an endpoint and a model before it will start:

        export AFI_BASE_URL=http://localhost:8080/v1
        export AFI_MODEL=your-model-name
        export AFI_API_KEY=sk-noop

      Configuration reference: https://github.com/smykla-skalski/afi#configuration
    CAVEATS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afi --version")
  end
end
