# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.105"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.105/af_0.11.105_darwin_amd64.tar.gz"
      sha256 "f56706078bbaddc03162c99da62440ef330fbcc35bca4b76de6769f18fc7dcf5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.105/af_0.11.105_darwin_arm64.tar.gz"
      sha256 "a1ec89ee5c37134ad1e51ec50a04242f76a9ec1ff12638d0cf05767467e9b9fa"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.105/af_0.11.105_linux_amd64.tar.gz"
      sha256 "933bd874d0381506a492820f554e9e00f0754fa2a130e6f11b9936b08248e442"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.105/af_0.11.105_linux_arm64.tar.gz"
      sha256 "c1bcfb2304d1e66dd88ddd078ea1245f1555c162c1bdb1e1ae79342db96fbdc1"
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
