# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.15/af_0.11.15_darwin_amd64.tar.gz"
      sha256 "a3adcdaff4f5a70abe08c494469afba76decb66f2a2244105d0e659811cdb4a4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.15/af_0.11.15_darwin_arm64.tar.gz"
      sha256 "fecf996aff370762756ede4deb74822230b9d19925d93941b44d2e671502c92d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.15/af_0.11.15_linux_amd64.tar.gz"
      sha256 "ca1f675aa0d8f7bce5eb2dae2f8af27efcdc05afe9abbf54720ac40cf7f0fa00"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.15/af_0.11.15_linux_arm64.tar.gz"
      sha256 "fb1aec926581dfe3d2b3f9ff04736c79e66382f551fb675ad7cf6a6ed95f1269"
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
