# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.82"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.82/af_0.11.82_darwin_amd64.tar.gz"
      sha256 "bb832c21759e067a6f10aabba789e3250d8b901a385ef65d4fb6d4634579eb84"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.82/af_0.11.82_darwin_arm64.tar.gz"
      sha256 "9784d68302484f40fad408acbc13e8112be3ee6b4a7a9e3258c9d0d1f78a9879"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.82/af_0.11.82_linux_amd64.tar.gz"
      sha256 "93cb2f841482028285615a78d5c0bf356a5d61f84a9f31ba84ffa6ac80ef213b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.82/af_0.11.82_linux_arm64.tar.gz"
      sha256 "d90f938f08a223878a53c0f9e5c286b25df90b433e78d2a7d0b2db20c5cea350"
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
