# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.64"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.64/af_0.11.64_darwin_amd64.tar.gz"
      sha256 "0133c7e3d0b937bef96ebaa0cd8c5b576ff945d251e3703f267b19c7afd121be"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.64/af_0.11.64_darwin_arm64.tar.gz"
      sha256 "810ab0a8613af6bea99f245fcc6a822c50f89228c0d2a240c204b3c00717b27c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.64/af_0.11.64_linux_amd64.tar.gz"
      sha256 "2a13f87a1d724a7458617f91b09a51933e0629f3d3c25a150be9136e3863624b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.64/af_0.11.64_linux_arm64.tar.gz"
      sha256 "a09c846e914aa7fb73e112cda8b947699923d0856830f6a72d7ee98a98ed6883"
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
