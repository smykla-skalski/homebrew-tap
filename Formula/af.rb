# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.26/af_0.11.26_darwin_amd64.tar.gz"
      sha256 "6257f68821382717827b37c7c06bfab30d57fb3772f019d62ec27c32e3145d5d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.26/af_0.11.26_darwin_arm64.tar.gz"
      sha256 "209b237187cbf62cefbe059c6724f66c8cd75875394fb7e3eb0d373e42a64c84"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.26/af_0.11.26_linux_amd64.tar.gz"
      sha256 "e6fb39c1791e850d3b078f591a73e0ade6d7a48d08b1d0f38fb7bd195d38e42c"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.26/af_0.11.26_linux_arm64.tar.gz"
      sha256 "fc325a0aa2e463584607cee6d55f92fd2032e54dbfaa6c542fe3f2beed252a7c"
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
