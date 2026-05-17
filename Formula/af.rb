# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.65"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.65/af_0.11.65_darwin_amd64.tar.gz"
      sha256 "a6b44702c0241b5ad9b5e3ed2b91cb872d071a445e2e07233314578d49af15ea"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.65/af_0.11.65_darwin_arm64.tar.gz"
      sha256 "4729f358a1f463c0ef4c5c3872accda1a5b51d355dc980ac11fbe27db5ec7778"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.65/af_0.11.65_linux_amd64.tar.gz"
      sha256 "d321cf59e80bc4d13c1bae674986279e1284e5a28da6f23d7c362fbfec37396a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.65/af_0.11.65_linux_arm64.tar.gz"
      sha256 "240d277e70598074d5d91358b40f7ca86d11b4f61f4d59eff13d17286f5f7da1"
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
