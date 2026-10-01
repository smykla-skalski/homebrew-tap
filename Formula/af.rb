# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.178/af_0.11.178_darwin_amd64.tar.gz"
      sha256 "488ebef646bb259c9b9660993aefbd193af760bf0d2f410f3fb794e0ae17b58f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.178/af_0.11.178_darwin_arm64.tar.gz"
      sha256 "6816bedacf75796bff89cba22b0450bc29c32ea9b1cbc255e31f9d09799137fd"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.178/af_0.11.178_linux_amd64.tar.gz"
      sha256 "6ab803e06273c7055618edf58c22801ad4862bb25e1ed0036c28d541576d7740"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.178/af_0.11.178_linux_arm64.tar.gz"
      sha256 "6462d53c6e9858bb8f568007746cc969a20b9125bb169e8fc094897d90fe3cf0"
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
