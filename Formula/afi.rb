# typed: false
# frozen_string_literal: true

# Rewritten in full by .github/workflows/update-afi-formula.yml on every afi
# release. Edit the template in that workflow, not this file, or the next
# release will quietly undo you.
#
# There is deliberately no `version` stanza. Homebrew reads the version out of
# the `v0.22.0` segment of the URLs, and `brew audit --strict` rejects an explicit
# one as redundant, so the tag in the URLs is the only place a version appears.
class Afi < Formula
  desc "Deliberately tiny coding agent for self-hosted or remote models"
  homepage "https://github.com/smykla-skalski/afi"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.22.0/afi-x86_64-apple-darwin.tar.gz"
      sha256 "7f08e5583ae4ea3721577b6a53f88f42127f1846d749c8aebf40ce8b57c449dd"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.22.0/afi-aarch64-apple-darwin.tar.gz"
      sha256 "11283772463479290db58abc76d37764866c19ad420778136f9da54eb4053fe2"
    end
  end

  # The musl builds on both architectures, not the glibc one afi also publishes.
  # They are static and declare no dependencies, so they run whatever the host's
  # glibc turns out to be, which is the same reason afi's own install.sh serves
  # musl to every Linux.
  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.22.0/afi-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2db6014d851dfda32f666795778856e0b94b7748a6f6339e5332ee20944453c7"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.22.0/afi-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ec2d34943996a5c1f1ddfd8c12e10209e73014486c01705ed6f8cf308170516e"
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
