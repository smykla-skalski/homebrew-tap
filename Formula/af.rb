# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.17/af_0.11.17_darwin_amd64.tar.gz"
      sha256 "6dc8c5630b3b8f88c4fbf4d6e0d487a5bd77d9eb496f588650c04b6d35a646ec"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.17/af_0.11.17_darwin_arm64.tar.gz"
      sha256 "9a9a529f236a6c2095d68ef65cefba69bdf96d42edade2689b16fda2900c5cb6"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.17/af_0.11.17_linux_amd64.tar.gz"
      sha256 "b0bf4d3391eb5309e204cf1e3e527485c3c42809b3b670cff2a44e686cd94c17"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.17/af_0.11.17_linux_arm64.tar.gz"
      sha256 "6a4184a9c538dc52ce3e803a140aeaeeddd5b9ccc900661ab0041abc2f4d461a"
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
