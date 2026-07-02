# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.111"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.111/af_0.11.111_darwin_amd64.tar.gz"
      sha256 "ed1cc0f8f229b54daca37eaa19f181fb72db518cdaf4f76a1551884513abf897"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.111/af_0.11.111_darwin_arm64.tar.gz"
      sha256 "d505ac64ce9e93cda01733dbf90ad9f4e88d58208f47ed9fbe24995d3f56476d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.111/af_0.11.111_linux_amd64.tar.gz"
      sha256 "238b74bd8e994964e0d0a693e69b944f643be2c1fd1b491af0c4bf053a2ce814"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.111/af_0.11.111_linux_arm64.tar.gz"
      sha256 "ac5c3494d4fd2990d240835ee46ecc5db5d0f04b1988ad411254e426a0db8d10"
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
