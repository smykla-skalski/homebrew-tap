# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.124"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.124/af_0.11.124_darwin_amd64.tar.gz"
      sha256 "c0aaa4d70a92cc5398f45e86964fd031e1042bfac8e626b42686ca5111346946"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.124/af_0.11.124_darwin_arm64.tar.gz"
      sha256 "e5a44f12de903fde858c02769cb78b112643c9d7b96a9f47bc9af27307facaac"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.124/af_0.11.124_linux_amd64.tar.gz"
      sha256 "ad268d247c7dffed79a819511ecd6f550348ec3158d888ce621dfe13133399b5"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.124/af_0.11.124_linux_arm64.tar.gz"
      sha256 "a7667fcdb6aadce80f106f1c61bf85d8229e96292983fe8fca2351bcc3dcc808"
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
