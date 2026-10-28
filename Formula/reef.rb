# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.23/reef-macos-arm64.tar.gz"
      sha256 "b8c00bfceed97e7a4cbbbd590f48f13a020c4ac74bc134c4e4fc9708b6108a43"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.23/reef-macos-x86_64.tar.gz"
      sha256 "c627a28aca2ced6a60f02ecbac2b7f289224efab7a28262da34ea9ce9987d42e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.23/reef-linux-x86_64.tar.gz"
      sha256 "c7a39fccc73d90510a6d35a2ef8f037fbd6f05b0a0f7bfc936ebc2cea3118fd4"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.23/reef-linux-arm64.tar.gz"
      sha256 "9bef32b2078adff498129495a161d368af64fc7baa968a85eafbd04e87676008"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.23", shell_output("#{bin}/reef --version")
  end
end
