# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.123"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.123/af_0.11.123_darwin_amd64.tar.gz"
      sha256 "98ae65098d6faf1a58daad1f4949d2d8f15741030b4c73415f7a13bf02947ea2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.123/af_0.11.123_darwin_arm64.tar.gz"
      sha256 "01aaf6436afd5070b0e87ce2bb8f0d0fc80b46fd3fba61926d4d3eca56a38ee0"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.123/af_0.11.123_linux_amd64.tar.gz"
      sha256 "947e158902d2ebcfa37727bcccc0b6f81e0904a40fbc7bf8be8c99def742bea9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.123/af_0.11.123_linux_arm64.tar.gz"
      sha256 "1180968e434a67e87d19081d44585ddad0ef59059c29481936ce67e1ff801642"
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
