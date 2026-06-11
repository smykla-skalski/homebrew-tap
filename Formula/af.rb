# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.90"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.90/af_0.11.90_darwin_amd64.tar.gz"
      sha256 "ec1e39e446d63a61c74186c211325586ff37ad03d9cf77fac2b8eb7e9d1fe654"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.90/af_0.11.90_darwin_arm64.tar.gz"
      sha256 "e14a422355e67b7eecab8243c463c3f095501fa2ae89eab68d59dde09e9e4171"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.90/af_0.11.90_linux_amd64.tar.gz"
      sha256 "048f86d6dadcbdb7f57660b533129a1582748b21fbaa302c7ae186560d656e91"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.90/af_0.11.90_linux_arm64.tar.gz"
      sha256 "30442755e7e7b871d0d032d0eb36527e330cb026d57dc312cf106e586b1d2397"
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
