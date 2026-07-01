# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.110"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.110/af_0.11.110_darwin_amd64.tar.gz"
      sha256 "069b5cedc2f514f1469bc073555f25559919df100d292f021f6274ce23b60ef4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.110/af_0.11.110_darwin_arm64.tar.gz"
      sha256 "15be96da9f8a1ccd5042e225b4891859b3c63808831709d0e80e5dd234144884"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.110/af_0.11.110_linux_amd64.tar.gz"
      sha256 "dc3c9caf167a2624e88cc71d44a980734599177f5fa77849a8c741d36816d9f4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.110/af_0.11.110_linux_arm64.tar.gz"
      sha256 "1fa8d7d9c3103ed26082b4d26165e6ae0e48fe9e1669b6f27f5912602cb67a40"
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
