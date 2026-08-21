# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.161"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.161/af_0.11.161_darwin_amd64.tar.gz"
      sha256 "351cc4a3d6a8c8da8cb6f2bb6b7cf208ad120eaa8c9b0ad10469f05a31fdc3a8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.161/af_0.11.161_darwin_arm64.tar.gz"
      sha256 "7cd631797189930ae33e0eb958e0f1dc458fd9044e6aee98e602b41852b2dcea"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.161/af_0.11.161_linux_amd64.tar.gz"
      sha256 "7cd98c543e2b74973bb4d2a0a8eda1b289e4df3e5d3dcf86f24fce9abbf17a9a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.161/af_0.11.161_linux_arm64.tar.gz"
      sha256 "d6a0cb7b772bcef0c295cff723ecbd249d562d05dac74d663872b1be893339dc"
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
