# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.60"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.60/af_0.11.60_darwin_amd64.tar.gz"
      sha256 "cbfd7e9b5c7888583039071a51100721f166f6d0f2cb636ec814cebb8ea5127d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.60/af_0.11.60_darwin_arm64.tar.gz"
      sha256 "559fa49836cde710221a206420a297e94b260f2477fdb8ff1be4c486c77a2440"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.60/af_0.11.60_linux_amd64.tar.gz"
      sha256 "4bf9002ee6545642332f079340c1cb3b4a2b05cd60a66e5e5e78fc17d32ceae2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.60/af_0.11.60_linux_arm64.tar.gz"
      sha256 "7791c1aa5afa99b26100e8ffe7155a76cd071d183b7d6ab9394626993e635ed4"
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
