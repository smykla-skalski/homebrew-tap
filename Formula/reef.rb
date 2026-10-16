# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.22/reef-macos-arm64.tar.gz"
      sha256 "3e1e37758de0f89f7e49fa5631bc61ce64de9e853df019ee31f7a033eec50e03"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.22/reef-macos-x86_64.tar.gz"
      sha256 "52c34a0da0c1d5bf995c956e73115e47e91f79b8f9cbcb2b03ee3fa6dc8e1858"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.22/reef-linux-x86_64.tar.gz"
      sha256 "3833aa1b148560ad3286a569eec2365333f41e75dbaf6a0672ca1e5fd37383a7"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.22", shell_output("#{bin}/reef --version")
  end
end
