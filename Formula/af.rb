# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.20/af_0.11.20_darwin_amd64.tar.gz"
      sha256 "721d7c5143011dc7ab7bcf7390b2c9ddd2f9917c4011fefd1d7b979706e7954e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.20/af_0.11.20_darwin_arm64.tar.gz"
      sha256 "a89ffe86b15f1a498ab9b9da2b01074ef38e191aab695d1a22348575f9cf2910"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.20/af_0.11.20_linux_amd64.tar.gz"
      sha256 "74efd4a4ba34030189d6b382a8f5d1438f1420688ba10bddbb3da2cba3afacad"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.20/af_0.11.20_linux_arm64.tar.gz"
      sha256 "8fb6db4fa139a2b00ecdf6c8655d836c8fa4ff1630773170882e9428ac3e21e2"
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
