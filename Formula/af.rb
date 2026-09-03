# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.174"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.174/af_0.11.174_darwin_amd64.tar.gz"
      sha256 "279056d6c471dc327ba6d787128ced5025d02ddc2b7e2c16dea5fb4f5e2b5e69"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.174/af_0.11.174_darwin_arm64.tar.gz"
      sha256 "64131f3e1ce62c32e72d10e0a088142ae9c978d56c3f1dbce823a8a7fd37046f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.174/af_0.11.174_linux_amd64.tar.gz"
      sha256 "c24c47c8c4cbbeec6fe1b16d28396bfc5ed5597d8f0ba4c1abb5de60f1f42ddf"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.174/af_0.11.174_linux_arm64.tar.gz"
      sha256 "30bae83701cfea13d67e913265dae00820f1ae43bf707f10802850712c4b7599"
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
