# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.21/reef-macos-arm64.tar.gz"
      sha256 "cb5271dd2c98753c142b2ff72e81c7b7e75205e6be3a17e66aa98182188b5e9e"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.21/reef-macos-x86_64.tar.gz"
      sha256 "54dd910da8f24f6ee5c2c536b99b8152526b985d98d12fe2e87ab553cf1442c7"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.21/reef-linux-x86_64.tar.gz"
      sha256 "5d68daac123191c99feef809e749cf9dc3c050b85e7555527ebbba3d4f59ce02"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.21", shell_output("#{bin}/reef --version")
  end
end
