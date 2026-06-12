# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.91"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.91/af_0.11.91_darwin_amd64.tar.gz"
      sha256 "e1cbf709e7eba517b0271b0cfd3bfe239bfccfa22c683cc6a14d05079dc4a9bc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.91/af_0.11.91_darwin_arm64.tar.gz"
      sha256 "960693ad3f0ccbf6f5e213dfa7b33bc9749b700f1eaeb6ae5534d87c33e5e9e8"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.91/af_0.11.91_linux_amd64.tar.gz"
      sha256 "2228285deba3f9615b2d8b10a919cadcbdf611a171664e4ff51dc02fed92ace9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.91/af_0.11.91_linux_arm64.tar.gz"
      sha256 "f0acaf0c2c603f09578b1cf9585faa9e477a7058f184a0b1a2418671859b41b5"
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
