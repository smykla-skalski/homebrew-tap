# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.162"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.162/af_0.11.162_darwin_amd64.tar.gz"
      sha256 "2d41df34d2a0285c829d4779f42c59d9871131f3aaff56adc1b3005e8016e81e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.162/af_0.11.162_darwin_arm64.tar.gz"
      sha256 "194aa05c37c5608c5e5b0015d8413a89b6a0fbc92604a71ba39c67e1aa40992c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.162/af_0.11.162_linux_amd64.tar.gz"
      sha256 "dbc1edfa3f02c71589fe88d9076fc461e82fab8b55186fc23f859dee3efb5684"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.162/af_0.11.162_linux_arm64.tar.gz"
      sha256 "05a16b7e1f1330190904d867c7eb3ba8e9da6011d1199b3a960a7b6ee5f043cc"
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
