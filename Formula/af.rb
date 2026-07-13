# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.122"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.122/af_0.11.122_darwin_amd64.tar.gz"
      sha256 "fbd2b1ac536bc472fc00c3698c1d427bfd1e54cf353d4ff86ab3e6eccc827627"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.122/af_0.11.122_darwin_arm64.tar.gz"
      sha256 "d43c89a9149e56238b7b0806febf2cf6ebfdd6c966803bcf327fec50af0e658c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.122/af_0.11.122_linux_amd64.tar.gz"
      sha256 "9c5f4d142b8cbbe36ef4a2a20aafd6fc38e8c4270cb31c9087980c81ccc1c3b8"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.122/af_0.11.122_linux_arm64.tar.gz"
      sha256 "a6f56977e49f38870e1d31efcb3e32d60e75fc4007cfb8bfb6e6a360c8b7656a"
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
