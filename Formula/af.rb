# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.132"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.132/af_0.11.132_darwin_amd64.tar.gz"
      sha256 "1b3a88c5e2eacd8178fcd947098109efffecf78bfaba74ccada345997d9c3dd2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.132/af_0.11.132_darwin_arm64.tar.gz"
      sha256 "69eff9102ed84a7611d8cd3c566e7b4cf676d88f1037950f2974e69707133676"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.132/af_0.11.132_linux_amd64.tar.gz"
      sha256 "8c050428c8813fb55fcc87e80fd421a516b469d75f3177961b491c267051936c"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.132/af_0.11.132_linux_arm64.tar.gz"
      sha256 "0fd982924cc4b7b783b00c6fd93a781e7bf19ff7e5330316414ef1fb9c10d67e"
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
