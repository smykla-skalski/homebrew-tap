# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.41/af_0.11.41_darwin_amd64.tar.gz"
      sha256 "6b65c91e54a634598865e98168611659f5710f356f2bef1ce661a4d79e63c5ca"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.41/af_0.11.41_darwin_arm64.tar.gz"
      sha256 "9a3fa98d707e7432ff232a2e363e75dbae352eaa98f3fe5cacbb46d183c2079f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.41/af_0.11.41_linux_amd64.tar.gz"
      sha256 "d881951fb3886069f6182082ea552b3172d22c444a0ee7755b4d1e99fa7ec622"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.41/af_0.11.41_linux_arm64.tar.gz"
      sha256 "181967d62c0608bb571c4737454e2ca20dd22e76489d95508a96b30230097398"
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
