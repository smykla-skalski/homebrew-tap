# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.92"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.92/af_0.11.92_darwin_amd64.tar.gz"
      sha256 "7e93a2924e770dadb63256a0b03a8612fe1ea576c4ed09508fb84d69c8167a8f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.92/af_0.11.92_darwin_arm64.tar.gz"
      sha256 "457b2960d5919a3b4fac4d7e63eac5ac4e26265435b2cb3eb6968438fa24c498"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.92/af_0.11.92_linux_amd64.tar.gz"
      sha256 "33f2e0977d79d2ed040d1e4512fc877204630f906d290b641679f20d6a0662f4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.92/af_0.11.92_linux_arm64.tar.gz"
      sha256 "83d2e63631bdfd0663dbcc1022a14fe8726aaea5eff1c3c65ef954cef7fc30a6"
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
