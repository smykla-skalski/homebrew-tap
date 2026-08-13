# typed: false
# frozen_string_literal: true

# Rewritten in full by .github/workflows/update-afi-formula.yml on every afi
# release. Edit the template in that workflow, not this file, or the next
# release will quietly undo you.
#
# There is deliberately no `version` stanza. Homebrew reads the version out of
# the `v0.16.1` segment of the URLs, and `brew audit --strict` rejects an explicit
# one as redundant, so the tag in the URLs is the only place a version appears.
class Afi < Formula
  desc "Deliberately tiny coding agent for self-hosted or remote models"
  homepage "https://github.com/smykla-skalski/afi"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.16.1/afi-x86_64-apple-darwin.tar.gz"
      sha256 "37f1249b7a8c03485f246eb4178aa4a4dcddc1cab862ae4d8ffb1b15b5a8adb8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.16.1/afi-aarch64-apple-darwin.tar.gz"
      sha256 "24031a0d6a72325397150e7fc489b9c1a6bfcb75e9706c1b30d1aa99b32227e3"
    end
  end

  # The musl builds on both architectures, not the glibc one afi also publishes.
  # They are static and declare no dependencies, so they run whatever the host's
  # glibc turns out to be, which is the same reason afi's own install.sh serves
  # musl to every Linux.
  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.16.1/afi-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4bd028c2efb52ccc3fc7b0c1808be7f51d7ae9ac59d973fc6d49302e345baa43"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.16.1/afi-aarch64-unknown-linux-musl.tar.gz"
      sha256 "85fa8c99195f973b25d6ffacb51f1e13397d5769a24710595813b27645674bf6"
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
