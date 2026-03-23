# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.10/af_0.11.10_darwin_amd64.tar.gz"
      sha256 "cd6d3e4f66004c875f01d4a3d1f611e8216385aaa4c74e47dd67651f17c7072f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.10/af_0.11.10_darwin_arm64.tar.gz"
      sha256 "d37ebe403e0d28c5342df2b5a60f24e90b026c913ff2c2231299ef6890de5230"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.10/af_0.11.10_linux_amd64.tar.gz"
      sha256 "7dc3a2d7d88d1fa11174534bb8f20caae36b8ee206203e6c8f67340cafd83ef8"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.10/af_0.11.10_linux_arm64.tar.gz"
      sha256 "12b0a4d61a5b936a680f498d6ad1e77cc1b25efe4cd7b4f0bbdbdfe8692de179"
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
