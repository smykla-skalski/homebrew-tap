# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.126"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.126/af_0.11.126_darwin_amd64.tar.gz"
      sha256 "30f81e30fbdf229e008c74147a7d11a004058343ad7a837efec5a54ac8b286ee"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.126/af_0.11.126_darwin_arm64.tar.gz"
      sha256 "6a4c83b1ef3a0d46b4729d3c1ac88def78000e7512ad12d02b21439bdd4763a6"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.126/af_0.11.126_linux_amd64.tar.gz"
      sha256 "bd3219081db7423060c3c9a2fb2fb29688ad144a5d8adcf3dd54199bfee44ed9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.126/af_0.11.126_linux_arm64.tar.gz"
      sha256 "03f65780743631bd4450dbb8a07308f72f7acac719b83476fb98692d00d9e093"
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
