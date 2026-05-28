# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.76"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.76/af_0.11.76_darwin_amd64.tar.gz"
      sha256 "2589f5219b5010d5b7ed3d9085a1be38c9b551ceff31d52daf94a84f9ec578cc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.76/af_0.11.76_darwin_arm64.tar.gz"
      sha256 "c85dcab98d32cdb4643c615463d94a45324b5f66c83c2ac41a297c6814d34ee1"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.76/af_0.11.76_linux_amd64.tar.gz"
      sha256 "d72fa034a970dec4241cb7d55b1681e0d15927eefb99efd545c0a07fb8038e99"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.76/af_0.11.76_linux_arm64.tar.gz"
      sha256 "683a23da0b0e20f65b88422548154120ab6bbac1859288930a0b704103cd3309"
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
