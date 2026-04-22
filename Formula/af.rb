# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.40/af_0.11.40_darwin_amd64.tar.gz"
      sha256 "5a2715c86854970e52df796d627150d40dec383a9f32959d39867a93013d3410"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.40/af_0.11.40_darwin_arm64.tar.gz"
      sha256 "fa3e8ba4218cc5d95c9f7ad1e41efac86c36143596d50d44d96b9a4b51e2217b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.40/af_0.11.40_linux_amd64.tar.gz"
      sha256 "94fcc17eacd0c71b7ab41c9806f6b2a4f29f400c4f20cdaa306f88476ec51cab"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.40/af_0.11.40_linux_arm64.tar.gz"
      sha256 "0c4bded5ba6b827b9a0bfe11e696744a8aa9c65e31aec9dd4b0d2220015bcc32"
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
