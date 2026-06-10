# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.89"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.89/af_0.11.89_darwin_amd64.tar.gz"
      sha256 "b98bdd6b2f75441e24fbf74713599c41b3c77214ae939685624c6f20c9622964"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.89/af_0.11.89_darwin_arm64.tar.gz"
      sha256 "7c95342b5e6f5c10b4854278ba8f4549efcf31406181a34ad1b77996802dc9eb"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.89/af_0.11.89_linux_amd64.tar.gz"
      sha256 "70bd7009c49817268172262ebe6bed9501691a0e2fdfc0c94eae775d04df1394"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.89/af_0.11.89_linux_arm64.tar.gz"
      sha256 "0290251df3aaa9592177ba496fd177c3f827e71ada71668852acc5b21958799a"
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
