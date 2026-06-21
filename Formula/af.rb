# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.100"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.100/af_0.11.100_darwin_amd64.tar.gz"
      sha256 "8598e08746996afed94ceb533c33c8c3d82609babe3190e5d7efa576b052e52a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.100/af_0.11.100_darwin_arm64.tar.gz"
      sha256 "40e8bf21b7c0ee35d5c08e69f09f011a8e48acf5076d321c3c3083ec951820ba"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.100/af_0.11.100_linux_amd64.tar.gz"
      sha256 "76b93d2230ba92d7b39f0dc82a0d5afb8e9dc215e972930a2fe1a13afbbae172"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.100/af_0.11.100_linux_arm64.tar.gz"
      sha256 "fa697d2393fcebaf1d4362143e9c231b832aa969a7e27e4170878b30b61568f5"
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
