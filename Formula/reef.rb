# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.15/reef-macos-arm64.tar.gz"
      sha256 "372287773f38d6a2fe30b38ec2b647e5ed485df6532abd97f367ddf98e0283ce"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.15/reef-macos-x86_64.tar.gz"
      sha256 "d240c332ce3bef37d41ab744e7c1f8348eaeab08d4349047c4178995dfabb615"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.15/reef-linux-x86_64.tar.gz"
      sha256 "bd41d0a1bb5c682f753008081125b4a8aed182e1d4d1d1b478dc742231c2d437"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.15", shell_output("#{bin}/reef --version")
  end
end
