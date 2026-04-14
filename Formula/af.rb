# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.32/af_0.11.32_darwin_amd64.tar.gz"
      sha256 "b2577b3eb4f79f44686dccb5e8a7392f5dd4f2342a6a0c3efce51ffc21811ccb"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.32/af_0.11.32_darwin_arm64.tar.gz"
      sha256 "f2356ca02af7ae9bf920622ab87ba9263c8b333dc3525e72be8e39bd4211e38d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.32/af_0.11.32_linux_amd64.tar.gz"
      sha256 "96ecb2fde5f53f55852536c9469acedbc77346e038b1849d8e4f5f497bb3da0b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.32/af_0.11.32_linux_arm64.tar.gz"
      sha256 "19cc2b635e3b48ebf243f97c7428a916e589b1884bc41983c972ca0e988b02a1"
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
