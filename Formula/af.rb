# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.112"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.112/af_0.11.112_darwin_amd64.tar.gz"
      sha256 "c8b7adb38306ea9a1767e014e93adc991a78738f1fc4dd4aaa99b91794b8918c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.112/af_0.11.112_darwin_arm64.tar.gz"
      sha256 "7d74d811afd0f435fb9f86bc818b75bf903f0feb14179e392de939e16d9fad0e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.112/af_0.11.112_linux_amd64.tar.gz"
      sha256 "5c07858f2ca9f32f5c8f09ce7aa0422351e40623a39ec25e9770f3758f1d759a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.112/af_0.11.112_linux_arm64.tar.gz"
      sha256 "7418a5bc3f75397ecbe39928d9f54bc01b76d8694bfa2085da40b47782413e24"
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
