# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.102"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.102/af_0.11.102_darwin_amd64.tar.gz"
      sha256 "f314dd35ac85d1ebea1aad383e3b7660bf89f2de079269182e273a2d5eba65e2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.102/af_0.11.102_darwin_arm64.tar.gz"
      sha256 "bde7a4a81e9611aabb49cc557838266b9b8df5d28e560c6f6a567d425937f0bc"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.102/af_0.11.102_linux_amd64.tar.gz"
      sha256 "68c26e7ed718fae5a6c7dd17acf5734dcf7b3092d7cf9f6886ee9475fec9624e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.102/af_0.11.102_linux_arm64.tar.gz"
      sha256 "1fa1927bc0de413265b3a823542f0355564f9afc656117ab9d951ddeb4b50ae8"
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
