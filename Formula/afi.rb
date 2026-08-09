# typed: false
# frozen_string_literal: true

# Rewritten in full by .github/workflows/update-afi-formula.yml on every afi
# release. Edit the template in that workflow, not this file, or the next
# release will quietly undo you.
#
# There is deliberately no `version` stanza. Homebrew reads the version out of
# the `v0.10.0` segment of the URLs, and `brew audit --strict` rejects an explicit
# one as redundant, so the tag in the URLs is the only place a version appears.
class Afi < Formula
  desc "Deliberately tiny coding agent for self-hosted or remote models"
  homepage "https://github.com/smykla-skalski/afi"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.10.0/afi-x86_64-apple-darwin.tar.gz"
      sha256 "7a655d12dfaa61af8a02e54c52578354ddbd3cd31adcf0f45422ce848d2a0480"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.10.0/afi-aarch64-apple-darwin.tar.gz"
      sha256 "4ae63cf54bc605525aab295bb4285fd20d93ee735caa982f70b81cff5cf2cf95"
    end
  end

  # The musl builds on both architectures, not the glibc one afi also publishes.
  # They are static and declare no dependencies, so they run whatever the host's
  # glibc turns out to be, which is the same reason afi's own install.sh serves
  # musl to every Linux.
  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.10.0/afi-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c9e3725082afa7ab4320159479333577370fb4ce18d75772bb67f0c62fc01aed"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/afi/releases/download/v0.10.0/afi-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a0abb25b6eec9bd7b8e821f2d3f07070853cdec66a6a8ca2ba6f9c91d0a2f90d"
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
