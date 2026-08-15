# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.155"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.155/af_0.11.155_darwin_amd64.tar.gz"
      sha256 "e443b39083e0c7faec5f5d01fd73eb03b42db3a8401fb4ef04756ab5f272d780"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.155/af_0.11.155_darwin_arm64.tar.gz"
      sha256 "68d6208bc31465c98319eebd1ab7e0fcae16d1b9c8acf264a9dc0e353fbe380a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.155/af_0.11.155_linux_amd64.tar.gz"
      sha256 "8e39cc8a87b815fef8faccf8fc033922601425756bcf5a8102833fb00c388084"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.155/af_0.11.155_linux_arm64.tar.gz"
      sha256 "79a81e839de88316fa351638bb9373bd482d6d8fcc3b869381ebd63c9c99e177"
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
