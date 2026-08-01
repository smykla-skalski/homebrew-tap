# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.141"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.141/af_0.11.141_darwin_amd64.tar.gz"
      sha256 "9d8dad47d2295c5c10e2ed5f0cbb9101b41dce9a235bbe2a37cf99bd878a194b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.141/af_0.11.141_darwin_arm64.tar.gz"
      sha256 "fcdd6e43b5a5bbe61e7127844ae6e0ddfe6faf94349a8dfd20eb800d7264aa8c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.141/af_0.11.141_linux_amd64.tar.gz"
      sha256 "27f190875c6d16706bfcc5aee5480a6e140ea9c5435114b67e77e94220800518"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.141/af_0.11.141_linux_arm64.tar.gz"
      sha256 "5aabbc1ffb01447f10f0651efce11bf240da19628a5179b2bd9a136d29127f96"
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
