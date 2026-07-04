# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.113"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.113/af_0.11.113_darwin_amd64.tar.gz"
      sha256 "612ed5cea7df3bb07a396fdce62cdf3e4c247b798288cf8f7e41a849e626e69a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.113/af_0.11.113_darwin_arm64.tar.gz"
      sha256 "ad3b8643f66fde8df339bfbe0db62e0909e74407bca5f0ac33e78a06cb9ac505"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.113/af_0.11.113_linux_amd64.tar.gz"
      sha256 "e4b8c50edd515f3a7222745fc85e0370e5fba7998757a00445b6d11b759aceb9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.113/af_0.11.113_linux_arm64.tar.gz"
      sha256 "015b179f97578de11d9b85013f6bf4648c4accc1592ce4689b413f3271ee6444"
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
