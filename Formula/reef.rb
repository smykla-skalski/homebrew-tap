# typed: false
# frozen_string_literal: true

class Reef < Formula
  desc "Observe and schedule resource-heavy coding-agent work"
  homepage "https://github.com/smykla-skalski/reef"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.12/reef-macos-arm64.tar.gz"
      sha256 "c5e3576cab5def0972775848bee116e8ffcdc9c87cb9d76a5b4d8afabde24aa6"
    end

    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.12/reef-macos-x86_64.tar.gz"
      sha256 "31f609cff1370ddad9a8f00211d71d53f6745d9074e124f8a438052fb1d5e8b8"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/reef/releases/download/v0.0.12/reef-linux-x86_64.tar.gz"
      sha256 "87d2d0bffb198a344c00e729cd33810c0acbac1a6eb8b4fc3aef4bb4116dec69"
    end
  end

  def install
    bin.install "reef"
  end

  test do
    assert_match "reef 0.0.12", shell_output("#{bin}/reef --version")
  end
end
