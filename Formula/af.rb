# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.30/af_0.11.30_darwin_amd64.tar.gz"
      sha256 "6db4b4c731fbcba03dfc16c991c091bc4c4e6ffe1ef1891e2c843d22bb533bdc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.30/af_0.11.30_darwin_arm64.tar.gz"
      sha256 "20c73792cabae93b30aa34d3f8daee9a1267fb9e20c5e9392143805aa70e9788"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.30/af_0.11.30_linux_amd64.tar.gz"
      sha256 "e7fdb261e9648fe807b2129dbcc01c09c6a94424e79b138dfc34666eacb7c108"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.30/af_0.11.30_linux_arm64.tar.gz"
      sha256 "d312f475b67e56943c894635593b4810d4e7cb64346c3ad2307ad6d0f0602be8"
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
