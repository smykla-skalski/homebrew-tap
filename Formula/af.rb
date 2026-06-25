# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.104"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.104/af_0.11.104_darwin_amd64.tar.gz"
      sha256 "a1caa21b7e2fb2cd78067e303943b7f2fdbad01343a453dd4ff826baf66c0356"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.104/af_0.11.104_darwin_arm64.tar.gz"
      sha256 "a53c7f488b40ff9bf8a2bd27069eb244633449b2ef89e0caaa42e6a020963149"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.104/af_0.11.104_linux_amd64.tar.gz"
      sha256 "da89f4278a35400cf315d04ba305377275af6a012aa5d2ac8cdcd9a13eada212"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.104/af_0.11.104_linux_arm64.tar.gz"
      sha256 "00a105b3a5cd47b347dc0da4d0fa918f5b1796be6f6f40aa7fe5f587ecbb0bbe"
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
