# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.29/af_0.11.29_darwin_amd64.tar.gz"
      sha256 "b5ad3f0572d7a76179a42a1ba3cb5e4dd578f82116d26f6875c2b6ed8931f1b6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.29/af_0.11.29_darwin_arm64.tar.gz"
      sha256 "f4d7f7515e855ec3d9e18a7c7e4f7fe02bcbb1f0648c7285ab95cccdee99b7b8"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.29/af_0.11.29_linux_amd64.tar.gz"
      sha256 "bf4e53b61db76592048914e41b5e5ed993f1226274912f7cdf9e0f94197cf961"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.29/af_0.11.29_linux_arm64.tar.gz"
      sha256 "400d44ec35a4efb80144a2ab712ebaa6cad9ed8cde2426f52e445e5ef81f0a86"
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
