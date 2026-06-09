# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.88"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.88/af_0.11.88_darwin_amd64.tar.gz"
      sha256 "b4405a9c97ce3c55d4c2a2dfb5a34ba07476d35309db86397f7bef8e2948c029"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.88/af_0.11.88_darwin_arm64.tar.gz"
      sha256 "fb7d854c8bba6c00b167b92a22f7174ac256151aca515407f969e141fc105b49"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.88/af_0.11.88_linux_amd64.tar.gz"
      sha256 "3bfaa3de3c830e11b63ef89a75dc28a4f72cbf96d41ede4ebc9191bffcada2f0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.88/af_0.11.88_linux_arm64.tar.gz"
      sha256 "481ff4bb90227fcc1375eb53c2d90ac2ea6b79831580aa79c4f80242d48fa675"
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
