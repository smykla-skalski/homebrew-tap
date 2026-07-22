# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.131"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.131/af_0.11.131_darwin_amd64.tar.gz"
      sha256 "9612df2603fd0fc27a70796c8085c17e211223d9992cbc278cf14297dc0f7b98"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.131/af_0.11.131_darwin_arm64.tar.gz"
      sha256 "8a2b47ebef55694e59cb0dbde295a5f3223efd92db1f2291f56d4154e7711b43"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.131/af_0.11.131_linux_amd64.tar.gz"
      sha256 "af792edd6f861daf3f6b7d5327113bdb80f069d0b2a7c43222a21c4a2e2a3e3b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.131/af_0.11.131_linux_arm64.tar.gz"
      sha256 "9337774ebc53796005b0b6b669325e78ac563c30abc89b4a2ac3f781526a15d8"
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
