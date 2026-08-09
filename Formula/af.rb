# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.149"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.149/af_0.11.149_darwin_amd64.tar.gz"
      sha256 "1aca47085e8c7231bc5bfd2da14792dd44f8784d6292ee72874c4da6d1e27ba0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.149/af_0.11.149_darwin_arm64.tar.gz"
      sha256 "04a14d2e553e45461db3322bc7b4b4d184d205558c0b6378d1b67c77a60a84c9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.149/af_0.11.149_linux_amd64.tar.gz"
      sha256 "3ee07d12ca71cf4b2f0443087aef8ae9d852a06c57364c0f927a310cefe2bcb8"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.149/af_0.11.149_linux_arm64.tar.gz"
      sha256 "6e6aff3f6511cc1109a4a78dfff54db59bc70c9b7dd9727a45e6cec09359053b"
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
