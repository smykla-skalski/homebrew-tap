# typed: false
# frozen_string_literal: true

# Rewritten in full by .github/workflows/update-afi-formula.yml on every afi
# release. Edit the template in that workflow, not this file, or the next
# release will quietly undo you.
#
# There is deliberately no `version` stanza. Homebrew reads the version out of
# the `v0.16.0` segment of the URLs, and `brew audit --strict` rejects an explicit
# one as redundant, so the tag in the URLs is the only place a version appears.
class Afi < Formula
  desc "Deliberately tiny coding agent for self-hosted or remote models"
  homepage "https://github.com/smykla-skalski/afi"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.16.0/afi-x86_64-apple-darwin.tar.gz"
      sha256 "37546efe9474eb03f9bd61462d2a4ee44dfae04a1f326de010ab1a5c00ffa396"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.16.0/afi-aarch64-apple-darwin.tar.gz"
      sha256 "01bd1aadf00cacc520ff1f64fa05d66e8ac6b0bdbb8f76e9e353f3b0b6b3c904"
    end
  end

  # The musl builds on both architectures, not the glibc one afi also publishes.
  # They are static and declare no dependencies, so they run whatever the host's
  # glibc turns out to be, which is the same reason afi's own install.sh serves
  # musl to every Linux.
  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.16.0/afi-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2cc343eca17c81e49267d72adbea34e00362750e48559801c42e6b75a6beab4b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.16.0/afi-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8d07143c0a6cf6674128ea06aae298e00fe0f8b5117bcac48975570b4069f938"
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
