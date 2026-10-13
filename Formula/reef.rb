# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.17/reef-macos-arm64.tar.gz"
      sha256 "d0cdf381d9f987e526d36dcc78eb3b803f0663ce07433d1c08af31e42e04724a"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.17/reef-macos-x86_64.tar.gz"
      sha256 "0d0a65478b51feb5ebb286e6b4068dde6bbb57005873551d3c49a2a325fbbe94"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.17/reef-linux-x86_64.tar.gz"
      sha256 "b7c575d075a47bb557b7b21a973f7e2fbe6d2ba482654c91c7b90e6096292887"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.17", shell_output("#{bin}/reef --version")
  end
end
