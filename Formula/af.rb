# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.170"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.170/af_0.11.170_darwin_amd64.tar.gz"
      sha256 "e62e87966695fb219d84adb621b8beb412d33b395aaad35dbb06349875268359"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.170/af_0.11.170_darwin_arm64.tar.gz"
      sha256 "5bd1882fb5f714688942b54b456078f161f860b1de150e9e1c8cb3ace05b0394"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.170/af_0.11.170_linux_amd64.tar.gz"
      sha256 "1bc19be31898d179cc1b2eb9d36695a68ebb8ad3123ed99ace2cf399868c9dd8"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.170/af_0.11.170_linux_arm64.tar.gz"
      sha256 "9c947534181c7bf1cb737536172dca6c496ad75990c764ce1abdc4f06f812f6f"
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
