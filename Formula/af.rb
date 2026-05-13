# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.61"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.61/af_0.11.61_darwin_amd64.tar.gz"
      sha256 "559f333afb810a109d5d397669ba902161ddd6f39fd764027f9f3cd98acee6ad"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.61/af_0.11.61_darwin_arm64.tar.gz"
      sha256 "39efe2d99d4c606a3aafffbfa823f0e0f0b3b29af61878c9cd461ab81d76dd08"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.61/af_0.11.61_linux_amd64.tar.gz"
      sha256 "0f3d3d5ae3a0c69f8617ab324c0720253def7c864073ac7046d2a3ca4c0a0d1f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.61/af_0.11.61_linux_arm64.tar.gz"
      sha256 "7ece6e4e138a63fb4b3767facb1555ad332d18c5e3a9e0cf7368675ec26e169f"
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
