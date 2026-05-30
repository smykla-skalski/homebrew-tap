# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.78"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.78/af_0.11.78_darwin_amd64.tar.gz"
      sha256 "fcc5406c1ef7542293ba3b18376ebb3eb363a165fb095567b5f8ac79f4e366bd"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.78/af_0.11.78_darwin_arm64.tar.gz"
      sha256 "027000bb7162e3e6070f50d658d6fdf69f7fce42d82370dfec06c1b1af26d928"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.78/af_0.11.78_linux_amd64.tar.gz"
      sha256 "19e0eb38482e576813ecc561b992f80941e09509a812130782ac8fb0edb29911"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.78/af_0.11.78_linux_arm64.tar.gz"
      sha256 "3c5c6629cd74caf02454d65c27dd27ce72ab04f73a01f4ab2da38040168d557c"
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
