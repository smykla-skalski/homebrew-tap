# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.71"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.71/af_0.11.71_darwin_amd64.tar.gz"
      sha256 "7f7ef04db9613fdd072c0aefe98bcce67663d7a835bd70a7cc651f51fe318f6b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.71/af_0.11.71_darwin_arm64.tar.gz"
      sha256 "31c805ffe7f783726283f9e1151b049fa61158bfb60fc43bca90fb3fe408f160"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.71/af_0.11.71_linux_amd64.tar.gz"
      sha256 "82fd470886d3374e95cd4074da07c5cf2ea2fae18a125e3d0460b2b3e096d0b9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.71/af_0.11.71_linux_arm64.tar.gz"
      sha256 "24d31c41ec083029e79767a7c6fcbcdb566100a73aad831a49afa43dc2713755"
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
