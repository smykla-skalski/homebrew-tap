# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.1/reef-macos-arm64.tar.gz"
      sha256 "535ac63c81744ff4d58538356b0a1579dd33301610659f27c68640f8a6140a38"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.1/reef-macos-x86_64.tar.gz"
      sha256 "28cb78435ef2e713f3c2552a5fb9be2dafe36db4849e8512c565b994c2b88a59"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.1/reef-linux-x86_64.tar.gz"
      sha256 "b50aac9b9a85016798e27ede671cc17a45bd0954e93cec70de301eb35d00af6a"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.1", shell_output("#{bin}/reef --version")
  end
end
