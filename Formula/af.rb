# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.86"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.86/af_0.11.86_darwin_amd64.tar.gz"
      sha256 "38df59838fbfb9c02d64482770789d7d993af518bc8dcd1961ead4c1a200c8ce"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.86/af_0.11.86_darwin_arm64.tar.gz"
      sha256 "2e7a053da53832e1c8805ff5e73a00f60d1473b20eb38dc8e05c43cc9e8ae30e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.86/af_0.11.86_linux_amd64.tar.gz"
      sha256 "461018c861632299be49ca7da6daf78b56661aca804397cda7af072549216e26"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.86/af_0.11.86_linux_arm64.tar.gz"
      sha256 "b52a5c04f0253ca87fc873d4d62079030f9553d59f5b18b7c29507586ecbfa6f"
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
