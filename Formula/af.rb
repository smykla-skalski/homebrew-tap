# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.57"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.57/af_0.11.57_darwin_amd64.tar.gz"
      sha256 "f85b8f230fa7c175afed790c162f7e342717fdd52d819eb2ef82ff2d9199fc93"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.57/af_0.11.57_darwin_arm64.tar.gz"
      sha256 "ee3c0c4928692e63e33ae68969edfb8cda38a27f7673a711a196ebe88eb5ec52"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.57/af_0.11.57_linux_amd64.tar.gz"
      sha256 "e2ba9ffbb9e5d31b6da7a038be0d0569dcf2d7311bc479879ba2e75a0bbba504"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.57/af_0.11.57_linux_arm64.tar.gz"
      sha256 "982e45732929b10ac8a5ebba7c62d6a7f96825f0fac5ea1d1a0ed114f4ffae6a"
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
