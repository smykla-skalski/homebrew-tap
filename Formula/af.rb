# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.148"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.148/af_0.11.148_darwin_amd64.tar.gz"
      sha256 "8cab4e48b70b46ec2ce4e68cf4c3155b9e5b7b2c4ef3c52b0d8b99e623fc3bd0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.148/af_0.11.148_darwin_arm64.tar.gz"
      sha256 "e66f1e5c5383416922502bf34a43f69f358d0316e36e86db39aa307afc371fe5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.148/af_0.11.148_linux_amd64.tar.gz"
      sha256 "d6e0a91335011dd82e2cf232b15024fc8476e589128de2134d97ba6e7d5825c0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.148/af_0.11.148_linux_arm64.tar.gz"
      sha256 "cd31c7b2eba2c926291dec55c7de0b7f3a94682ba5a413376916b4eeda526203"
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
