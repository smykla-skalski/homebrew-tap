# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.160"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.160/af_0.11.160_darwin_amd64.tar.gz"
      sha256 "957ffe07b53e6fc30359640d78a856a30782e284b216484c77b96abc9565e0f7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.160/af_0.11.160_darwin_arm64.tar.gz"
      sha256 "a84b8628e09ba253cfbe0b8bb1189fa10bef186308397786dbc3e62cff3813e0"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.160/af_0.11.160_linux_amd64.tar.gz"
      sha256 "f8ac2860456a90fc7d0190e9b4386bfb4af2f8814df015ad94e81520b7a88847"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.160/af_0.11.160_linux_arm64.tar.gz"
      sha256 "58f53599f025df21e18e77eda13d553a6e74e102502897de476984a71e13256b"
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
