# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.18/reef-macos-arm64.tar.gz"
      sha256 "99f215d441ec525b96f4d74ca22caf135591028b3d691e9286e7fe8a43cab461"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.18/reef-macos-x86_64.tar.gz"
      sha256 "5c3af8c69623e4269992dbda840677455b0518a56a6c80636ee379e46808540d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.18/reef-linux-x86_64.tar.gz"
      sha256 "f4fdb18dd0426a42cde1caa5cf535375c955b2fb41c7583e7a81493f8adb9c97"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.18", shell_output("#{bin}/reef --version")
  end
end
