# typed: false
# frozen_string_literal: true

# Rewritten in full by .github/workflows/update-afi-formula.yml on every afi
# release. Edit the template in that workflow, not this file, or the next
# release will quietly undo you.
#
# There is deliberately no `version` stanza. Homebrew reads the version out of
# the `v0.9.0` segment of the URLs, and `brew audit --strict` rejects an explicit
# one as redundant, so the tag in the URLs is the only place a version appears.
class Afi < Formula
  desc "Deliberately tiny coding agent for self-hosted or remote models"
  homepage "https://github.com/smykla-skalski/afi"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.9.0/afi-x86_64-apple-darwin.tar.gz"
      sha256 "1ba098433c8cfacbdd1f54a1605522766928d4e0314065bd1f67bfc2decead28"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.9.0/afi-aarch64-apple-darwin.tar.gz"
      sha256 "c6f84eab99c8730c13abc5a582af433889c19e76fbb8a220e13d91ba4af28142"
    end
  end

  # The musl builds on both architectures, not the glibc one afi also publishes.
  # They are static and declare no dependencies, so they run whatever the host's
  # glibc turns out to be, which is the same reason afi's own install.sh serves
  # musl to every Linux.
  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.9.0/afi-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7820c826174f1e299df33175f2a94103906868502fab913bd0885f1eeae1485c"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.9.0/afi-aarch64-unknown-linux-musl.tar.gz"
      sha256 "83a2733747a7bc6cbbb0770e93c3a0e66a5035c90137bc82e21f50f1efe88793"
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
