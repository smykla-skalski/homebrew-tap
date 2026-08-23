# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.163"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.163/af_0.11.163_darwin_amd64.tar.gz"
      sha256 "cd0ba4470e5a26a3b8ac8a533bd3989911638cfb1ef54bff05ab1a759fc0ee85"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.163/af_0.11.163_darwin_arm64.tar.gz"
      sha256 "fb67959d5dcabce4e5a0a40931203f1f8b618702c612ca8d2ff39d53cae63aa5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.163/af_0.11.163_linux_amd64.tar.gz"
      sha256 "9a44d7d243a2df82793edf6919c84eac598f0f561d2dac72dd97615f9883d9a0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.163/af_0.11.163_linux_arm64.tar.gz"
      sha256 "abd67ff2d7a7498b4d9a03b90a4b8439e60abc84cf031ef75cf7451b0d6898ac"
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
