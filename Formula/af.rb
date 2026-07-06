# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.115"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.115/af_0.11.115_darwin_amd64.tar.gz"
      sha256 "9467e17092e7ca8e2f62827b092cd709c005ca765e1b287146e653d5bb3df6fd"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.115/af_0.11.115_darwin_arm64.tar.gz"
      sha256 "ca532b750dadd458964c5f5fdfcd4e058894373a95a3744a5341aaf01a5ee1fa"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.115/af_0.11.115_linux_amd64.tar.gz"
      sha256 "9e0ec696c9a0d8db98eb6f1611f41bac93baf9fb6798f1c47db026f84231ff7a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.115/af_0.11.115_linux_arm64.tar.gz"
      sha256 "fd67580d78dc109d19723b971bca3e3aa03d0e6c6a3a08321f98b5996eb26f04"
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
