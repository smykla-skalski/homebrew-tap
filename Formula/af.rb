# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.33/af_0.11.33_darwin_amd64.tar.gz"
      sha256 "5df075af62dc8636fb31d5bb5004775840f2f60983bd621c5955f4797bc68ca5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.33/af_0.11.33_darwin_arm64.tar.gz"
      sha256 "fc7ec22cb2c3d396ae2bc9a40b1e5cce181c6be6ad1af3bcfc31747475a80921"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.33/af_0.11.33_linux_amd64.tar.gz"
      sha256 "c97e65c99d3fde42ebc78c98f2bcf7fc7371604e618c51be145ae3f5c3cc9eb2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.33/af_0.11.33_linux_arm64.tar.gz"
      sha256 "53b6c36bd82e09604ddc4b3f3efaa25f31e5619021a79c230778cf04533623dd"
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
