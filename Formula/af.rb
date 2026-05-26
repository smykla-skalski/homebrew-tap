# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.74"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.74/af_0.11.74_darwin_amd64.tar.gz"
      sha256 "41ba9ff780def6d346f7192c8cb00ee0ae87c841608acd2b4621886f1d9d5063"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.74/af_0.11.74_darwin_arm64.tar.gz"
      sha256 "079ccab474677525a7de4d442dcaa3bb9045a6ec15cce1746fed22a705eccc71"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.74/af_0.11.74_linux_amd64.tar.gz"
      sha256 "5ee45ab5eaeccc43c78b30e9680937e9408a9c2e2b9c3683c4959aeb0dcd0161"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.74/af_0.11.74_linux_arm64.tar.gz"
      sha256 "bba5b1b606a821e9aba027fc1b83afc1ea376924e26c84d5df572e5104a42831"
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
