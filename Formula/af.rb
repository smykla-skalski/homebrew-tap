# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.67"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.67/af_0.11.67_darwin_amd64.tar.gz"
      sha256 "6c5304786c57750408663948b06b48a3ac42cd89a3b6cf774ed82e381fec677c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.67/af_0.11.67_darwin_arm64.tar.gz"
      sha256 "62a2a016d95da289192bd7badaaf05d9afb8e8023ea5da22e2f6744b9bbc2d91"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.67/af_0.11.67_linux_amd64.tar.gz"
      sha256 "17bc78ae3b8a3354f6e276e625e2056934d99a992b4135d6f5ee2df9e429de64"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.67/af_0.11.67_linux_arm64.tar.gz"
      sha256 "5ebf69ac993499fe5b91a13d9d915d20b8d2c089dbfea1379a76498da4e65ec4"
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
