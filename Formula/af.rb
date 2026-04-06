# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.24/af_0.11.24_darwin_amd64.tar.gz"
      sha256 "d6346f37f6521749742bab89215a1fd1a70a73ced0951e93399a190bf90e32cc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.24/af_0.11.24_darwin_arm64.tar.gz"
      sha256 "eb629b889f0b3c3088d64681d4781590b440c6e66596d07cdf376bb92a5c3def"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.24/af_0.11.24_linux_amd64.tar.gz"
      sha256 "56fac176fe3d7bdb78b38b129231c5ebac0b1854219590d1939422dc0dcc76d0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.24/af_0.11.24_linux_arm64.tar.gz"
      sha256 "b7b402c236c3d68db8542af100763393aab5db54077ad46a0044660f5f773fff"
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
