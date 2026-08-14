# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.154"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.154/af_0.11.154_darwin_amd64.tar.gz"
      sha256 "b5645b541af57f1a3984d4821cecfbb85b51c710f2e019d60a9232e1c5791ee5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.154/af_0.11.154_darwin_arm64.tar.gz"
      sha256 "259db5ee122e548d460d8b4961ae2172d82f9dd7065f2dc76df7b39501df9e82"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.154/af_0.11.154_linux_amd64.tar.gz"
      sha256 "c379641b8b088d291c043fc89ca68d9171ca51cca1aa7758fc620ca5b42cfe86"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.154/af_0.11.154_linux_arm64.tar.gz"
      sha256 "be5a2e47b9be304612247e9a07e3fb1e76ab22f58dcd11aaa3baa9f1c6193570"
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
