# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.59"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.59/af_0.11.59_darwin_amd64.tar.gz"
      sha256 "69ede212431c579735c03eb9cd58257c8042041ba58b33db9cc27223d3673ab7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.59/af_0.11.59_darwin_arm64.tar.gz"
      sha256 "703c6d92705a1c9fae4c28c56dc8c8d45cf51e764fc230ddc5ba2b7494f8c806"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.59/af_0.11.59_linux_amd64.tar.gz"
      sha256 "d10e4f55cc798f35f2aab451d6889033f3de8b897cdbad27f71d7c2e41ad54f7"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.59/af_0.11.59_linux_arm64.tar.gz"
      sha256 "89319285fd2f7d78e7a7760cb0265ce23ee2a36421ad53c3b8fc2096af4058d3"
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
