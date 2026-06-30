# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.109"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.109/af_0.11.109_darwin_amd64.tar.gz"
      sha256 "3e7fd7791ca114b1be9bf64c0b5d5e035e277603e53c218ba9eae3d33330ed4e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.109/af_0.11.109_darwin_arm64.tar.gz"
      sha256 "eb2f454af254d02df806c246e7ef0dc7714e8ee8cf60170d7a98de1e0f3e44fc"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.109/af_0.11.109_linux_amd64.tar.gz"
      sha256 "72c14587257366d847226d1f718c15ec930b3103c4913e49a4ccbfe44564ec36"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.109/af_0.11.109_linux_arm64.tar.gz"
      sha256 "d011a97021d57260be5b20d8b71da805ff2f85b049e954baa4cdb7b91b119787"
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
