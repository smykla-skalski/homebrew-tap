# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.35"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.35/af_0.11.35_darwin_amd64.tar.gz"
      sha256 "2ea49677fa93d7251f3088b7a5b6dd1bcbf03b26741d93d37921bb6160d01949"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.35/af_0.11.35_darwin_arm64.tar.gz"
      sha256 "110cf1c4d0b92ba9a1d6c88b66f97c90f246700d6a2001e14c1690c08c8b2a2e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.35/af_0.11.35_linux_amd64.tar.gz"
      sha256 "1d059c96afe6902c8aceee627bd62b16976d8a47c8c1f11197a6fe9d09c1dc2d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.35/af_0.11.35_linux_arm64.tar.gz"
      sha256 "7d48dc0f3203a8c5d0c442b7502424183add19690e5fcf3f09cdc7ba629077ae"
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
