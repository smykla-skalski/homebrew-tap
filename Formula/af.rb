# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.83"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.83/af_0.11.83_darwin_amd64.tar.gz"
      sha256 "ab238958fe175e054d4550c078d031b96b5f624619988b07ebc09805114dde8a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.83/af_0.11.83_darwin_arm64.tar.gz"
      sha256 "52fcfcb7bd6598bee265f998b634eb7332a0e9c2beb3901a183eb5aea09ea89c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.83/af_0.11.83_linux_amd64.tar.gz"
      sha256 "80ea741344e5cf732002b787bf078b29ee8bd7ebb610247dbf9d49f2781da5aa"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.83/af_0.11.83_linux_arm64.tar.gz"
      sha256 "ce0d2762d6a35b2180dd6e28045cc659c931373fb40bedc3bb37ec85e0e8ec5e"
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
