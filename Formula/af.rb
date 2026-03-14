# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.1/af_0.11.1_darwin_amd64.tar.gz"
      sha256 "c33c5ae6b97601958510e4cb04435dd5f053fa51099f32d4815ae55239c2ac95"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.1/af_0.11.1_darwin_arm64.tar.gz"
      sha256 "430e93e6612d49969ee1880c0b65da25f25eee4592b4195964f53f80ecfdb79d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.1/af_0.11.1_linux_amd64.tar.gz"
      sha256 "5674c0e309b11280f60d3b19f69163037bdf730653e96410f287de420a6a018b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.1/af_0.11.1_linux_arm64.tar.gz"
      sha256 "7f38b44c703079c5875420ac9bc71bc36da191957de12fefb7d68babdd717ac4"
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
