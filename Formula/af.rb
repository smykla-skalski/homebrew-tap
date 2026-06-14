# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.93"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.93/af_0.11.93_darwin_amd64.tar.gz"
      sha256 "f66b83892648367ea5718af781595fd935e4e2be653a5d10f594658cd6e912ec"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.93/af_0.11.93_darwin_arm64.tar.gz"
      sha256 "560670d09d6ae47167eeaba2669c970e8e9090c78d2b5bff081b8b7931143db9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.93/af_0.11.93_linux_amd64.tar.gz"
      sha256 "949c234f04b6aa67a508486b7e8881717c522a194eb934fbced6fd2269bcbacb"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.93/af_0.11.93_linux_arm64.tar.gz"
      sha256 "76a5033ee78c74867f382ae7cf5f71853069bd25621d990843bb3217bdbab42c"
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
