# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.108"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.108/af_0.11.108_darwin_amd64.tar.gz"
      sha256 "25a086421cdce5e7162966c1075533bbe1909d2aebeaa439294552aa54e8e15f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.108/af_0.11.108_darwin_arm64.tar.gz"
      sha256 "f2edd990c95cef05d0b9389f3297399c0b415a9bffb3ac469bba26415022c147"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.108/af_0.11.108_linux_amd64.tar.gz"
      sha256 "a85388181c7f91e5c1583a95d5c41b696fcfd56856083f6090f6f43261266071"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.108/af_0.11.108_linux_arm64.tar.gz"
      sha256 "33c6fd5653cb68be862a59f7598054a4e848518d6cfce82a101eb2224959df23"
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
