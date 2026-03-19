# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.6/af_0.11.6_darwin_amd64.tar.gz"
      sha256 "9514f20df7a03e2b975337a07424ccd2fc102c7d8adc4c300689b3bed1026158"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.6/af_0.11.6_darwin_arm64.tar.gz"
      sha256 "1993f6a4572b6e4d9decee12dda3d6d4c3d84891afc040a3b53e8d0e02f133de"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.6/af_0.11.6_linux_amd64.tar.gz"
      sha256 "d6234f177580de085f77ddc85e23a4554fb5be2855e4db55c3f29cec3fc85e79"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.6/af_0.11.6_linux_arm64.tar.gz"
      sha256 "392572604e2fc9ac28cda16b73aab705fe89982e5b9209acb243b8234585fefc"
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
