# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.2/af_0.11.2_darwin_amd64.tar.gz"
      sha256 "3e4124cbb7d198ccb376ebe7f2a25b70b8ca62abb02a6e6c8d50156041e9b3ad"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.2/af_0.11.2_darwin_arm64.tar.gz"
      sha256 "279cf4576375b10f9a4efcb42d7bd976d8b09ea4b20a1681b86160902fd74786"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.2/af_0.11.2_linux_amd64.tar.gz"
      sha256 "e1ea7cf9e87b7e504b3b8818d2c1f2c5470d2b1dc349cc0350d77564d6845850"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.2/af_0.11.2_linux_arm64.tar.gz"
      sha256 "a63722b03ae3eb43b4eb8b4e5280166effab296333ffa377c9eb7a05d2690b89"
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
