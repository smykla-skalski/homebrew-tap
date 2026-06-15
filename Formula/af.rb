# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.94"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.94/af_0.11.94_darwin_amd64.tar.gz"
      sha256 "c32a43b4bd8032081e12b9eb10b727ee65d4d9631db6bbc21dbb8a3ea2336244"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.94/af_0.11.94_darwin_arm64.tar.gz"
      sha256 "838d5c1432b4452ba9f551368f400898db071cf808c9519de0b6646c20dd6ed0"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.94/af_0.11.94_linux_amd64.tar.gz"
      sha256 "3e42e7b7e4c3ba0e528bb12204a80dbc57e4227d8833a013618e4f54cb0fe98b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.94/af_0.11.94_linux_arm64.tar.gz"
      sha256 "63a566d92d223daa327a15977c74a50e906052be113204ef6bef81946d585ce0"
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
