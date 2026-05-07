# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.55"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.55/af_0.11.55_darwin_amd64.tar.gz"
      sha256 "750b3c96990b40c37a73afdb37bb5ddab6159f74700e5da94ffdd60125075624"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.55/af_0.11.55_darwin_arm64.tar.gz"
      sha256 "c1e2139a6877dababa9828e1a8cd5e72d4d32677f474bbb06a16851fb99166e2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.55/af_0.11.55_linux_amd64.tar.gz"
      sha256 "926f7ae842c2b23261ef622c15ddfc8cf74519af8b8485abca7a2fc148e168c4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.55/af_0.11.55_linux_arm64.tar.gz"
      sha256 "f2177b525f71c9776eef77c6249aad20a5b795933af745137d1bedb47c98071a"
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
