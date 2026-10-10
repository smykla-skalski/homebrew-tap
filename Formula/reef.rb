# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.5/reef-macos-arm64.tar.gz"
      sha256 "761b12f90501eb45680cc7929167f67cb647eba76e21d67ad404e25970529c88"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.5/reef-macos-x86_64.tar.gz"
      sha256 "206b2285f7b78d4aa93b3b77d1f36e2a4c14c5f5563c16d6a785d36cb8aa1f17"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.5/reef-linux-x86_64.tar.gz"
      sha256 "95522c76e220a181bf172fc473231a8d6c7415efc035818feff4ac712bcea235"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.5", shell_output("#{bin}/reef --version")
  end
end
