# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.125"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.125/af_0.11.125_darwin_amd64.tar.gz"
      sha256 "076b341293c32633948d4f4130bf9cd9cd3838484f5c9617f11ac1d43da298d4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.125/af_0.11.125_darwin_arm64.tar.gz"
      sha256 "82cbf3350658cdaea358e265d210423168c2f16c3700161a38a24d9670a92bf9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.125/af_0.11.125_linux_amd64.tar.gz"
      sha256 "a2c648b244215118e5f0219eb52f5c969c0650294cfb07e6dd2b555804795e78"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.125/af_0.11.125_linux_arm64.tar.gz"
      sha256 "823df4a42e9533cd10e9882fc97f430cd42e3f20b98cc85273bb0e46a06b175b"
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
