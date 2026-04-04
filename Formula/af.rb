# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.22/af_0.11.22_darwin_amd64.tar.gz"
      sha256 "affbbde21db4c86e62e8ce4cf0ccbf2d41d8735dd7ad166a8776f26b3c87c259"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.22/af_0.11.22_darwin_arm64.tar.gz"
      sha256 "59d0cf13bc5a85fdf856947fbc8178468fa92109d3b103752167ed5290dac82c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.22/af_0.11.22_linux_amd64.tar.gz"
      sha256 "2e359329224d49b150fa3e0cb7469aca9bc1deddb97ccde212874828341a9de1"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.22/af_0.11.22_linux_arm64.tar.gz"
      sha256 "08298d0938b5b29a3146b220655de941f3c43eb0744a3f061149b46add98a297"
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
