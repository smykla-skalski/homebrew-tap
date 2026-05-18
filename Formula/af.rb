# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.66"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.66/af_0.11.66_darwin_amd64.tar.gz"
      sha256 "c927aa1ddef07513554b17331c8070fe1106be096a0e1a0770cc4f79eceb994b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.66/af_0.11.66_darwin_arm64.tar.gz"
      sha256 "453d09051db8a8e8ce81529c8658dfecc88631e7fe374313c331d4da3151c1d1"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.66/af_0.11.66_linux_amd64.tar.gz"
      sha256 "86a8485a4c620cfb1db7841b5fedb0f1d467b065641079b8dc1fbad23c1c7d1a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.66/af_0.11.66_linux_arm64.tar.gz"
      sha256 "d8373c07bd196025f38c3612757f6a5c44b688c2d0cc2298a5ecf576f0492bc0"
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
