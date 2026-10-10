# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.4/reef-macos-arm64.tar.gz"
      sha256 "af2b7e3071ddff6aca05bf0e24abcdb6943dcd87b94a8a8512b7ae9b7e86945d"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.4/reef-macos-x86_64.tar.gz"
      sha256 "89b49119eb9c6655c405deb0c863d1d3a5b6b1b129d32da990e4da65a763d9dc"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.4/reef-linux-x86_64.tar.gz"
      sha256 "3ee6e1c2f313a62c43dc7f7a70db5fe7b07f77f1b0afa6de2f463c3a8f0f5597"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.4", shell_output("#{bin}/reef --version")
  end
end
