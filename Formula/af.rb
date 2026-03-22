# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.9/af_0.11.9_darwin_amd64.tar.gz"
      sha256 "13827e4673afd20719ee5017b830b0da5787e2489fafbcdb0a66e964031f2cfd"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.9/af_0.11.9_darwin_arm64.tar.gz"
      sha256 "b6a756d118a7d565c46ea735e0a03c33c0309169143e678cdbb4290949c15de1"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.9/af_0.11.9_linux_amd64.tar.gz"
      sha256 "f406c8d1c7e565d2f643fc1b4c37293a7b3257a70fb14bb3187f300e756c9ed9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.9/af_0.11.9_linux_arm64.tar.gz"
      sha256 "36b8d6e039a1adc8827903bded15b2dc2a34960b462a1643a5ebce96c2e87095"
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
