# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.134"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.134/af_0.11.134_darwin_amd64.tar.gz"
      sha256 "94336af27293fe90429afed82a0761a2d3efa29f584fea89229f8397a41b074f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.134/af_0.11.134_darwin_arm64.tar.gz"
      sha256 "7dcf7e58ab64a0c459b5376922f741be958f389d417f159093ec7e68125d84fd"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.134/af_0.11.134_linux_amd64.tar.gz"
      sha256 "5c7a6ef69518e9ac938f5a2024cac9adeb07b99327da17320c8e0f3ed0b8df91"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.134/af_0.11.134_linux_arm64.tar.gz"
      sha256 "fff58a2ee57a87819a7b5a55a208e876b00eb513577240717509a10eebc718f7"
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
