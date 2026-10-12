# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.13/reef-macos-arm64.tar.gz"
      sha256 "91507adc4397cce7e85813d72024d751bd3bf08cfba2049148f0287ca33529f3"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.13/reef-macos-x86_64.tar.gz"
      sha256 "28d19f5fe70cfe635bf8bf2613546245f8759ff86001631868cdf960a1ada84d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.13/reef-linux-x86_64.tar.gz"
      sha256 "8592bea6ed80386dd179f234694d585b1502b8ce60c5b7b47e365451cb5fc834"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.13", shell_output("#{bin}/reef --version")
  end
end
