# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.146"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.146/af_0.11.146_darwin_amd64.tar.gz"
      sha256 "8dddd6d6ca53c0926d4f92da1bfb46563296b7a77c07b3a604e7382fc750abc1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.146/af_0.11.146_darwin_arm64.tar.gz"
      sha256 "5a50606195e0488849a9aa3a7ffc402a12260f09b2413e75cadd66d86c6b872b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.146/af_0.11.146_linux_amd64.tar.gz"
      sha256 "fd1b57ee249e200b2685bfd5fea2655b4af1ea942e22f531849adf57a2807aed"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.146/af_0.11.146_linux_arm64.tar.gz"
      sha256 "b7a4e1bfee7b81963abdbcf36b565f5ddb84450f8fcb90e8bc92fdfee65a7ca9"
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
