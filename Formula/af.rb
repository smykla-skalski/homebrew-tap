# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.16/af_0.11.16_darwin_amd64.tar.gz"
      sha256 "21fa79a29d413292dc7ada6002b540d1fb2ba1137244d9d691d9f73f55d71850"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.16/af_0.11.16_darwin_arm64.tar.gz"
      sha256 "b090f043ba26b18a0b68a8cf77eb33b16c475651a51c045664494dce1812fad0"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.16/af_0.11.16_linux_amd64.tar.gz"
      sha256 "093b330f57087f3caa4b17470f11d31a5419250c0ed0ace7090dcfaa7193850e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.16/af_0.11.16_linux_arm64.tar.gz"
      sha256 "fcf0ad10209308fb96042996e000edc6be5b2f339b80ef43bd9010cf6475e3a0"
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
