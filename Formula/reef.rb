# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.20/reef-macos-arm64.tar.gz"
      sha256 "133a53f2534e8980a23bc75b9d6830a75f3a64cbce3397411f1a0d8c34f7685a"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.20/reef-macos-x86_64.tar.gz"
      sha256 "02f785c8393d01aeb4409464c0f497697f702fff34dd756428557b31bb087eb3"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.20/reef-linux-x86_64.tar.gz"
      sha256 "ae99ac1e3996b1d3e514c46d23ff071fb76259e59630aaa68639f1a790043944"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.20", shell_output("#{bin}/reef --version")
  end
end
