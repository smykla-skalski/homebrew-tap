# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.157"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.157/af_0.11.157_darwin_amd64.tar.gz"
      sha256 "4923097fee6ab7bb24053cc6f9b852c60ad2bf45b8fca6bf24f137eee26a51e1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.157/af_0.11.157_darwin_arm64.tar.gz"
      sha256 "d5941e55a4a716f84b6adb385fde5606c6885a63f4604376bc01105064f11e13"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.157/af_0.11.157_linux_amd64.tar.gz"
      sha256 "77c3dc5ac6d85b87c01a1283fb4d09abdcec3fc6076eed47c585ea35c6778c6f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.157/af_0.11.157_linux_arm64.tar.gz"
      sha256 "9ad9858347f3dc01d3caac4fe5a6a1de32581bb7bb97d2eb5177f1681364b817"
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
