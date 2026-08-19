# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.159"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.159/af_0.11.159_darwin_amd64.tar.gz"
      sha256 "c1b80bec96a9cb3ec86f43d3fc6531940bb4ccc05e6d5d754505ab41dbe80fd9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.159/af_0.11.159_darwin_arm64.tar.gz"
      sha256 "a48216d97b62419ea6c46333f64f30f92881312892735f57f5e09bc51caed87f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.159/af_0.11.159_linux_amd64.tar.gz"
      sha256 "f1a6b933cafc8071254f2efe565556e2797fe9c7d2ef810d7cc8ee6ff8d2419d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.159/af_0.11.159_linux_arm64.tar.gz"
      sha256 "03e7f13b73c62cb5d600e9c56ca416345d7e75c0f5e73c1bd10fb8e77d29a233"
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
