# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.8/reef-macos-arm64.tar.gz"
      sha256 "65d4990a1426767a761f1d8fd2111295bd136e135f29b99908bfeb1964da515e"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.8/reef-macos-x86_64.tar.gz"
      sha256 "866a1c54785375004255b97c5c372714afd58cbab10a71f7431b3aa93065d63c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.8/reef-linux-x86_64.tar.gz"
      sha256 "e5a9e50afead41e908b8e53d5a29e62e778ad5e3bac402914809734b7bd601be"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.8", shell_output("#{bin}/reef --version")
  end
end
