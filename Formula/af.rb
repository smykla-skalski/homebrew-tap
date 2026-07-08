# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.117"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.117/af_0.11.117_darwin_amd64.tar.gz"
      sha256 "c8cce434252f7f0e7655ca7f838b2392be154a5a2125e5dcf02ce802f1a03781"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.117/af_0.11.117_darwin_arm64.tar.gz"
      sha256 "a482950141338f8080c982c3c1ac2ae910f62c7c83c7f5b9eff0ac3b08a4a89e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.117/af_0.11.117_linux_amd64.tar.gz"
      sha256 "016f7456bc572974cc7681192e2ead357afec548d0af012f79f7839bc409010e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.117/af_0.11.117_linux_arm64.tar.gz"
      sha256 "65678827f2a0c3c7fb1f21b14a277f0eb8bf6eef82d75a9c17ec7c33e2cf68f1"
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
