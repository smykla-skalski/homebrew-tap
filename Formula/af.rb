# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.75"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.75/af_0.11.75_darwin_amd64.tar.gz"
      sha256 "fd6ac4a3043d5e7b347d32add17f96f72dc73336983399ba2a50c3e6d90ce5e2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.75/af_0.11.75_darwin_arm64.tar.gz"
      sha256 "eefcf38122109974e242e67c258cc7047bbb9d6f8e5ea09d90e72e82150b299b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.75/af_0.11.75_linux_amd64.tar.gz"
      sha256 "3c239a3f1165955d46eb414a502847b731357df88f453f7b8890fe2d80734538"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.75/af_0.11.75_linux_arm64.tar.gz"
      sha256 "de970fa5335285ec72e037cd3633135dec7d2175e1ead69b121e13f560a64ad0"
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
