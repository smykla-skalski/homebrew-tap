# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.10/reef-macos-arm64.tar.gz"
      sha256 "b540ba9ac568e4d3f619e054e9490b5251e7c8f0d3e035e20b91219b0fb3ccad"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.10/reef-macos-x86_64.tar.gz"
      sha256 "129f6dc4fd1582fde40b28679cebca4a5ddd0da0d358bc9540052a9f7f8015f2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.10/reef-linux-x86_64.tar.gz"
      sha256 "83614925fc9810dc27cfe1b2f137faea87eed1fb66fac7bb212c78d736f2529b"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.10", shell_output("#{bin}/reef --version")
  end
end
