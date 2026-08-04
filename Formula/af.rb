# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.144"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.144/af_0.11.144_darwin_amd64.tar.gz"
      sha256 "6fb0f1df04b402807b8ae1313efbb7ef3dad26243884a56a47381e3f8a3374a0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.144/af_0.11.144_darwin_arm64.tar.gz"
      sha256 "e2999e9b1b039872ca4d48b230225469e975a6232b0b7a3d0756e2d723e64fd6"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.144/af_0.11.144_linux_amd64.tar.gz"
      sha256 "16f766cbae5ec5b8e96ef85e53640a487cc4c528f8a5e5ce24c9240970a85ca1"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.144/af_0.11.144_linux_arm64.tar.gz"
      sha256 "858942f26e51c74d7468952f67c52c0504a1e3b54fca204dbdee7a701afa70d0"
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
