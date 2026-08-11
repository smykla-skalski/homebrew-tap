# typed: false
# frozen_string_literal: true

# Rewritten in full by .github/workflows/update-afi-formula.yml on every afi
# release. Edit the template in that workflow, not this file, or the next
# release will quietly undo you.
#
# There is deliberately no `version` stanza. Homebrew reads the version out of
# the `v0.12.0` segment of the URLs, and `brew audit --strict` rejects an explicit
# one as redundant, so the tag in the URLs is the only place a version appears.
class Afi < Formula
  desc "Deliberately tiny coding agent for self-hosted or remote models"
  homepage "https://github.com/smykla-skalski/afi"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.12.0/afi-x86_64-apple-darwin.tar.gz"
      sha256 "876a4ddbf77d9dc26ead39a7f4c021911f2190bf7f4215872baa1177facb7fd6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.12.0/afi-aarch64-apple-darwin.tar.gz"
      sha256 "164955c2a8487e90873948f91bfa27c3f98d638172fd8a2ddf79965f412a4bde"
    end
  end

  # The musl builds on both architectures, not the glibc one afi also publishes.
  # They are static and declare no dependencies, so they run whatever the host's
  # glibc turns out to be, which is the same reason afi's own install.sh serves
  # musl to every Linux.
  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.12.0/afi-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1313657da58cb7f02d02196c9556b63996fe589ad0c99179b4b6aa08076eee29"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.12.0/afi-aarch64-unknown-linux-musl.tar.gz"
      sha256 "94853ccc5733ded0789c260aebb9db84d0cb9f7cb317874011dda79c049b3b7c"
    end
  end

  def install
    bin.install "afi"
    doc.install "README.md", "CHANGELOG.md"
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
