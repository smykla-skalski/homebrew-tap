# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.11/reef-macos-arm64.tar.gz"
      sha256 "1b84ca45fbcd6ebdfbf356d1603decfa98a2f6b35e60fe1f3d875fac8d300234"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.11/reef-macos-x86_64.tar.gz"
      sha256 "8900234f8a5f02b64aea8162eaac327d185bbfa57e498aa081972db097807905"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.11/reef-linux-x86_64.tar.gz"
      sha256 "036a8560194644de2cb1989f6c03c642b40b0506682f9eb45034c6340b5bd59a"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.11", shell_output("#{bin}/reef --version")
  end
end
