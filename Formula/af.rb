# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.31/af_0.11.31_darwin_amd64.tar.gz"
      sha256 "8a976513d14c3e95b812ae21d904b8585e34d11c59afcc2d03ef39894e9ce61e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.31/af_0.11.31_darwin_arm64.tar.gz"
      sha256 "ce5fd3431ee9570b2d7c8e42657343e9906e8817c103f05d70811b25f2e4b1a9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.31/af_0.11.31_linux_amd64.tar.gz"
      sha256 "a247e5e5ead4fba088fb695a43a7bae834d4c1eda94828fd452ac0e205b8973d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.31/af_0.11.31_linux_arm64.tar.gz"
      sha256 "b072531e60ecec7e13d571ae78d85ceb81ad494c9322461f32e5140644dc1c47"
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
