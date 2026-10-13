# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.16/reef-macos-arm64.tar.gz"
      sha256 "bc38fdba387c7f604d51105397c90929e49b4f5c87aca433a7505423fbfa7b71"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.16/reef-macos-x86_64.tar.gz"
      sha256 "b32bf2928beb161f0186e2c5377af55718eb54948bc3e819c5da63f581df5f53"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.16/reef-linux-x86_64.tar.gz"
      sha256 "a0109125b748fa49da1171ea0c933556f7fde022e40a6c4b955d6a52c774ca61"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.16", shell_output("#{bin}/reef --version")
  end
end
