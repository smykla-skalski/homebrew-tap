# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.56"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.56/af_0.11.56_darwin_amd64.tar.gz"
      sha256 "f94c408c85111407b91151c3ecba8feef5dab380831e4296cecdcba0aee53157"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.56/af_0.11.56_darwin_arm64.tar.gz"
      sha256 "79be0892b2bbb90843a8bb4d0c3fee1901b831c38e2a10e71c2e8523fa1547ea"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.56/af_0.11.56_linux_amd64.tar.gz"
      sha256 "5e5af2b0342fd84c3d40792c73609dfe6b06428969eab65e7a2a4b055ba2c252"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.56/af_0.11.56_linux_arm64.tar.gz"
      sha256 "53e78be9dd989f55b8d7c14178777b7981f0e0a0d06678feda8dd34c0b32b548"
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
