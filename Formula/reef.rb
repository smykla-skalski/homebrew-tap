# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.19/reef-macos-arm64.tar.gz"
      sha256 "5a2e2c514ebdcf4a18080feaca2e468c02bddf21dfd1705c732eca0c50f537a3"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.19/reef-macos-x86_64.tar.gz"
      sha256 "41db4ee0993416cfa8872605dfb8662101b0a254fea544eea5a58de1eb1c8d1d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.19/reef-linux-x86_64.tar.gz"
      sha256 "bace372a156eb23a9b1d32bd55a443a530154685f65abbaceb5911ad65734562"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.19", shell_output("#{bin}/reef --version")
  end
end
