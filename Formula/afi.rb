# typed: false
# frozen_string_literal: true

# Rewritten in full by .github/workflows/update-afi-formula.yml on every afi
# release. Edit the template in that workflow, not this file, or the next
# release will quietly undo you.
#
# There is deliberately no `version` stanza. Homebrew reads the version out of
# the `v0.24.2` segment of the URLs, and `brew audit --strict` rejects an explicit
# one as redundant, so the tag in the URLs is the only place a version appears.
class Afi < Formula
  desc "Deliberately tiny coding agent for self-hosted or remote models"
  homepage "https://github.com/smykla-skalski/afi"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.24.2/afi-x86_64-apple-darwin.tar.gz"
      sha256 "0a6cd973c69c905a5f3d17d4f5f1f1673e8b3696b83b7ac44429921c0dbba77e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.24.2/afi-aarch64-apple-darwin.tar.gz"
      sha256 "437f08c75d4a3a70ebf4042bfabbf42e18fd66f5919adc98bd433c6557c5c25b"
    end
  end

  # The musl builds on both architectures, not the glibc one afi also publishes.
  # They are static and declare no dependencies, so they run whatever the host's
  # glibc turns out to be, which is the same reason afi's own install.sh serves
  # musl to every Linux.
  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.24.2/afi-x86_64-unknown-linux-musl.tar.gz"
      sha256 "69f560cd7b2a0c8cffc5cede614b8c727215d43192da62f733f8f6b7e826ab56"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.24.2/afi-aarch64-unknown-linux-musl.tar.gz"
      sha256 "187d77715f379c909cc27697425c3e23218d85833a97df7a00258d0117ad2523"
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
