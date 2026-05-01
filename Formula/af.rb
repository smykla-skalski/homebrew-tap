# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.49"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.49/af_0.11.49_darwin_amd64.tar.gz"
      sha256 "52d2525cd2833ae9655f523ec2113da0967d1c623589302d59e6bdec39d2eb92"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.49/af_0.11.49_darwin_arm64.tar.gz"
      sha256 "bd3c8a8a18097a8b4dbf15348e6ae84cccbf7a1069ffdbfb45807b940b3f0819"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.49/af_0.11.49_linux_amd64.tar.gz"
      sha256 "6aa8669f4baae04ce2148e5354621920b0271fe535213256071d0536ce7ae029"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.49/af_0.11.49_linux_arm64.tar.gz"
      sha256 "90af67ce478ab20a1f901e5aea4cb8699ca9bd48c6d08f9c60617ae67706c6bc"
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
