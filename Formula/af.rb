# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.142"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.142/af_0.11.142_darwin_amd64.tar.gz"
      sha256 "bea3723f3cbeb12842d408c4a2ed589f668f1e44ef509d09119c31baea3c2abb"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.142/af_0.11.142_darwin_arm64.tar.gz"
      sha256 "cec0d86df266740db21119af25c78f1a69361bbb0034c53381f1638a2a600c87"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.142/af_0.11.142_linux_amd64.tar.gz"
      sha256 "0d337d809f0104700e4ed30e19c6b7e3ad734cf23764bb9893f190a7d226565c"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.142/af_0.11.142_linux_arm64.tar.gz"
      sha256 "d51e324631c1236b8d06e5250a3051b77c83874db9268a8ca8a1cca13b3ea90a"
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
