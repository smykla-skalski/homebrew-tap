# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.138"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.138/af_0.11.138_darwin_amd64.tar.gz"
      sha256 "7204a008c0910ba363abcd4a2252a70be5f41d3b898a5369e4fb591a3a31e8c0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.138/af_0.11.138_darwin_arm64.tar.gz"
      sha256 "3eb1fedbc3a6598023090cf3a7f49951c7e63b85a50031bddb1e2a927ec5f527"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.138/af_0.11.138_linux_amd64.tar.gz"
      sha256 "7abd201a5ee3d1c57e8d350045a826e2c7e2eddca81cbbb86446180a7bc02dbd"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.138/af_0.11.138_linux_arm64.tar.gz"
      sha256 "06b1d017349067cfd2cf654b372662dc1425327175b12ad80f39674882e4d0e0"
    end
  end

  def install
    bin.install "af"
    bash_completion.install "completions/af.bash" => "af"
    fish_completion.install "completions/af.fish"
    zsh_completion.install "completions/_af"
    man1.install "af.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/af --version")
  end
end
