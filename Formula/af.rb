# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.51"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.51/af_0.11.51_darwin_amd64.tar.gz"
      sha256 "a7daf30ffab669eda9ca8bc8897656ade020f294f534a58beece06f6ac67ebbc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.51/af_0.11.51_darwin_arm64.tar.gz"
      sha256 "3dd764c92c7d918cc57b3eeefd0cf5523777de7ea18c6b0f827527488eadcc99"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.51/af_0.11.51_linux_amd64.tar.gz"
      sha256 "b747caf5e82ecc17bf9eea8d680879ee8e31abacf21fc07da70d197cbcaf54df"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.51/af_0.11.51_linux_arm64.tar.gz"
      sha256 "378a30b237375171b57d6986af2060031043999fb81cb5c58592b8f650f587b3"
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
