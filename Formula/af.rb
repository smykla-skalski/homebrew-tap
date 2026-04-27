# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.45/af_0.11.45_darwin_amd64.tar.gz"
      sha256 "80b00bdcd7dd8e59f8a59c2fea2d05e613675609bfc8bf289af565243196dac1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.45/af_0.11.45_darwin_arm64.tar.gz"
      sha256 "b86e80244033e099acc32bdc2861190cb36d9856826840adcdb674ebdeaa7171"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.45/af_0.11.45_linux_amd64.tar.gz"
      sha256 "4067bb9869069deccb3bf0a7f4631007b8e2c36619ec77ee2eff49c1d993c3f1"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.45/af_0.11.45_linux_arm64.tar.gz"
      sha256 "e2e32e66e8b3227cf0e13e9d5c45c2305baab99550bacaead38f1bf341da4820"
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
