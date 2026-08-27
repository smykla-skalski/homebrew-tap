# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.167"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.167/af_0.11.167_darwin_amd64.tar.gz"
      sha256 "6bdc338307ba5bd44a35030a20d8d0214552eab1a331d30b4d72eaf2cae2ab7f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.167/af_0.11.167_darwin_arm64.tar.gz"
      sha256 "4948d6898a2168e993eddf543a17d3c13a541fc7de8e02c7115b165dc359aca2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.167/af_0.11.167_linux_amd64.tar.gz"
      sha256 "bbeb9b84f7e01dbd5efa5a903adf21d9d6eb73aea0704cb28a52233c7cf142a6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.167/af_0.11.167_linux_arm64.tar.gz"
      sha256 "c55afadfa4d52fb1b603a9f31319e1b19b871f42f9342d735229af3d31dcb21e"
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
