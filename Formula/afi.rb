# typed: false
# frozen_string_literal: true

# Rewritten in full by .github/workflows/update-afi-formula.yml on every afi
# release. Edit the template in that workflow, not this file, or the next
# release will quietly undo you.
#
# There is deliberately no `version` stanza. Homebrew reads the version out of
# the `v0.19.0` segment of the URLs, and `brew audit --strict` rejects an explicit
# one as redundant, so the tag in the URLs is the only place a version appears.
class Afi < Formula
  desc "Deliberately tiny coding agent for self-hosted or remote models"
  homepage "https://github.com/smykla-skalski/afi"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.19.0/afi-x86_64-apple-darwin.tar.gz"
      sha256 "59e4247024d11f2b73a5e82fb114dd592b2ade2f8d4d7c3b0e180507e2727290"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.19.0/afi-aarch64-apple-darwin.tar.gz"
      sha256 "7cf651b88b509dd65f7e44ec27de93296bb4fddb7300cc97626877fe02d5a73a"
    end
  end

  # The musl builds on both architectures, not the glibc one afi also publishes.
  # They are static and declare no dependencies, so they run whatever the host's
  # glibc turns out to be, which is the same reason afi's own install.sh serves
  # musl to every Linux.
  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.19.0/afi-x86_64-unknown-linux-musl.tar.gz"
      sha256 "53365ddba782b015db20ae68ec853ca2981819083e902cbd660de2fc257b8334"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.19.0/afi-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a67a37f759a5f70b3191ad373860175611e7fb8695132ff1844acc358fa3adb6"
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
