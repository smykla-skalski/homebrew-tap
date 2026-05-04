# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.52"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.52/af_0.11.52_darwin_amd64.tar.gz"
      sha256 "411e00c65ef84aa72e7c1093e30b02699e338933268ada6c094d2c417826e321"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.52/af_0.11.52_darwin_arm64.tar.gz"
      sha256 "350d5192ea7f1dde556f4e382b43bd45c1536284e7cc7816a887c6537adb6a1f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.52/af_0.11.52_linux_amd64.tar.gz"
      sha256 "d31256f0570314562358e20e739b087eaa74b99280affa198552c94d83633d20"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.52/af_0.11.52_linux_arm64.tar.gz"
      sha256 "ff235bec1ce3ea646b5f60671e1fd68e17413b00ea60a70607faa765fd41f8bf"
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
