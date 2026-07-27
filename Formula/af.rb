# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.136"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.136/af_0.11.136_darwin_amd64.tar.gz"
      sha256 "a483c09bfa1be9a02f585e8c38843b76f5ba5e41e2d538c9c8d6f5ec3cdf896b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.136/af_0.11.136_darwin_arm64.tar.gz"
      sha256 "5157e29994f46d7e663abf1b4234cbe5be0ac835460d8a2961c0fdaa14c7d8c4"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.136/af_0.11.136_linux_amd64.tar.gz"
      sha256 "492fc65528aa4463597d60b743f5c15f6f738873bb0c191c24121dede9e0ebc9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.136/af_0.11.136_linux_arm64.tar.gz"
      sha256 "af79c12e9c59261122fb3729b6d9c276beaec7c6a7e34f239a6f2945161cc8b1"
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
