# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.7/reef-macos-arm64.tar.gz"
      sha256 "2251297f9885503d4d85141b957afdfc454b9ccec42005e7070a1a60e82c77f1"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.7/reef-macos-x86_64.tar.gz"
      sha256 "b14e5b36186ed825bcc3cb868cc49bc845fccb275f24a0aa026e7c50c6c29764"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.7/reef-linux-x86_64.tar.gz"
      sha256 "d36ddf1a4299e9362389a4a1a7ab09507ab3432779ab4ccda574e8f31b54032d"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.7", shell_output("#{bin}/reef --version")
  end
end
