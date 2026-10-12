# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.14/reef-macos-arm64.tar.gz"
      sha256 "b6693a30147dea1b92da4a4e00ccd34c8d0c722a94d180bbbd75800c2a978174"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.14/reef-macos-x86_64.tar.gz"
      sha256 "76153c4f6d1f7414d72c7bb1e807d8b1960113a0effad02e9d692c0e035ecef8"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.14/reef-linux-x86_64.tar.gz"
      sha256 "18c88719904c482a683fb7121fe2319419a653457cbfc94662bda2823c638984"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.14", shell_output("#{bin}/reef --version")
  end
end
