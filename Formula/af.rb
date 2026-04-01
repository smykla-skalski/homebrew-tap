# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.19/af_0.11.19_darwin_amd64.tar.gz"
      sha256 "c32d3953204d11ba220ee2bd2dc01a9c1bf92a885e23f5b2abb0ecd2ff5d608a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.19/af_0.11.19_darwin_arm64.tar.gz"
      sha256 "0f4fd35f7c0b7668481cca3de4f114102371448e59d1a3177e7aa98c41e962e9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.19/af_0.11.19_linux_amd64.tar.gz"
      sha256 "e436c6503399832ba3d4bae47cc18d5c3ee7022357856b7b89d8222ba8a2e06d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.19/af_0.11.19_linux_arm64.tar.gz"
      sha256 "cc1dec82a03a2e1f318ec1c5240e8c96d1c5fa91d8f0ecaf1ec306c06e0addd0"
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
