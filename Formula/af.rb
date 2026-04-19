# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.37/af_0.11.37_darwin_amd64.tar.gz"
      sha256 "7c4ce4313394306b07180dcab8f8652b91eec9a29b357e0bb11fce59661a15c8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.37/af_0.11.37_darwin_arm64.tar.gz"
      sha256 "d1cf7c7df0053af0d0310157f66ea9e5c73091f89150ee54f3ba95ba4274dcef"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.37/af_0.11.37_linux_amd64.tar.gz"
      sha256 "ec44e1a2a4e7046655b9539eb4de85ebd14634f43e961229a9e2b17dfecec38c"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.37/af_0.11.37_linux_arm64.tar.gz"
      sha256 "e1f5fe34424920d0c980aa22ae801b143c80fd004bd85d11f6a83d1df4f8efa1"
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
