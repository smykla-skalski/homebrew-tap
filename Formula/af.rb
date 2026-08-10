# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.150"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.150/af_0.11.150_darwin_amd64.tar.gz"
      sha256 "47daaabba0e56f069c358e32fdc627be46aa3123d5b985ec4951da6b805f2049"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.150/af_0.11.150_darwin_arm64.tar.gz"
      sha256 "511958d5380d9f8fd2ce36914e001555b5237affea9496bfe32c41071ba67d4f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.150/af_0.11.150_linux_amd64.tar.gz"
      sha256 "88bd3abcc91df866d96bc79ba1b6b7992de3f92f16254ca6776faddde0c2a700"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.150/af_0.11.150_linux_arm64.tar.gz"
      sha256 "4741122e26d59bf727f6fb800ac07935abe6878db35d48cdf56b183ca5509268"
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
