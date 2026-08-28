# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.168"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.168/af_0.11.168_darwin_amd64.tar.gz"
      sha256 "794bf0583f7d5c2add57562bfe6956e21f4ae9d8b71ce369706e6202354b85bd"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.168/af_0.11.168_darwin_arm64.tar.gz"
      sha256 "3c1a6c3af2142773a80a9a39407d51611305306ab80db9c48f6db54c02fb7c97"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.168/af_0.11.168_linux_amd64.tar.gz"
      sha256 "53ef389317f9e9c774f6137325430c5e0c29a95f5401c462920911ab198e5f03"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.168/af_0.11.168_linux_arm64.tar.gz"
      sha256 "87e7a5fe4e2f652716e65954628823701636e3edb2e2c75488ea4ddc067e80fa"
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
