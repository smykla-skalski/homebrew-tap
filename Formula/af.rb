# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.118"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.118/af_0.11.118_darwin_amd64.tar.gz"
      sha256 "9aefd4dde0b19ecf5c5b080557d6e56ba78e275c620c9e0c8127d725e933e6cf"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.118/af_0.11.118_darwin_arm64.tar.gz"
      sha256 "2ee1a1d2ad40109192163825e1341ee9db0e9501ea19d02260cc85825780bb6e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.118/af_0.11.118_linux_amd64.tar.gz"
      sha256 "82fe6f507d72cbb9f312fd1ae6b7be807ba57f03882f0eaba7a71bed4b5183cb"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.118/af_0.11.118_linux_arm64.tar.gz"
      sha256 "fe940800c50bc174bac44f0364c0e03eafd905697943a5320a66219fd26d67e3"
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
