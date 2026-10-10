# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.9/reef-macos-arm64.tar.gz"
      sha256 "5748ae714673e23bc0aad91f9b468d52fe7618138eff4fe6e20e56f61cdaadbc"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.9/reef-macos-x86_64.tar.gz"
      sha256 "2c12edb76b7a6a44fde3b841adf184ec058083f837ff55d85d7fe6bb1ba3b89a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.9/reef-linux-x86_64.tar.gz"
      sha256 "dc4064d159eb5356f84672cb60c092e491b6593d13bd4e11f826ba8e249fc2a7"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.9", shell_output("#{bin}/reef --version")
  end
end
