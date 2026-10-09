# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.3/reef-macos-arm64.tar.gz"
      sha256 "0d82e2fd09915efcfda473123380baef93886a07f18b1ff25fb111c0230a9772"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.3/reef-macos-x86_64.tar.gz"
      sha256 "1532730c59146d70ebeef47138ca65af1a183d200cb2297d68485ff95d312609"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.3/reef-linux-x86_64.tar.gz"
      sha256 "9a2cbfba5d5d506da1c4bb01c726ed84e3d3e19fef0f1299022a20bf018228f9"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.3", shell_output("#{bin}/reef --version")
  end
end
