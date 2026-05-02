# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.50"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.50/af_0.11.50_darwin_amd64.tar.gz"
      sha256 "eb75bc2e8d8fbaf3d7cb9ce25e99071052ac7ab0acd65725898f7b303fbc7ed6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.50/af_0.11.50_darwin_arm64.tar.gz"
      sha256 "b21f4646fc069b8acc5fe947554b1b78ef06e8bc2d54b8d040cb3502111e4ad1"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.50/af_0.11.50_linux_amd64.tar.gz"
      sha256 "29804f66f9406f89cf9b5eb49f1f321434690c3067d5b282a41da3f05e808fe9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.50/af_0.11.50_linux_arm64.tar.gz"
      sha256 "8551c13fbf53f801748cb378ae53b3b5a1b2c3860203e39e863af911dd676aa1"
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
