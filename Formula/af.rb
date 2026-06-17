# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.96"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.96/af_0.11.96_darwin_amd64.tar.gz"
      sha256 "6a8d6ea1fa83b74012d9830cf89d07e9be1f3c70e13a64e580870836f5ec793d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.96/af_0.11.96_darwin_arm64.tar.gz"
      sha256 "d0095c7cdb353c5b3190dbf5175ef2239b5457eb313b883e5d0c1eb73f653034"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.96/af_0.11.96_linux_amd64.tar.gz"
      sha256 "e7b81e3598d24892001145eb12a81ffb9ca0ac4d3a346eb9b2b1ebf5c7db229d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.96/af_0.11.96_linux_arm64.tar.gz"
      sha256 "06808afc881cc1e855a194921bf515577eecb224d8d11f0d7e582f179ab8a9b2"
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
