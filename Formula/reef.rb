# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.6/reef-macos-arm64.tar.gz"
      sha256 "3f1b1f15d2247ac1bf436eb0f72a2b68dc8f0bb26ebebe85e84dbdfac893066c"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.6/reef-macos-x86_64.tar.gz"
      sha256 "f428d68e3b5ceaf42609d1c895887a0e1aff10637f2d1f8496090d72a2561cb6"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.6/reef-linux-x86_64.tar.gz"
      sha256 "e789c7b0545efc2dced73e5bc24315fd6efef53f393d56d50c37cf08baea51e9"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.6", shell_output("#{bin}/reef --version")
  end
end
