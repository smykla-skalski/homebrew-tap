# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.84"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.84/af_0.11.84_darwin_amd64.tar.gz"
      sha256 "5721d9c4b8cf81a097f31f154f28837ac17c299e8773fe00284b5c6e122f61ea"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.84/af_0.11.84_darwin_arm64.tar.gz"
      sha256 "a22c5ba790f8636309e32d0cd4384bee8af8c0ceecfb823ebe8e502bd3de543f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.84/af_0.11.84_linux_amd64.tar.gz"
      sha256 "53a589a8844e4286217b71836101e5d754f12d92eef1fcead5574098cad17def"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.84/af_0.11.84_linux_arm64.tar.gz"
      sha256 "689c31f30a7f9358d61d35e885ab462868c1f4be5ee05212d29716720351c2e2"
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
