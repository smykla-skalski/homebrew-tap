# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.48"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.48/af_0.11.48_darwin_amd64.tar.gz"
      sha256 "ce85b1bc6b38e719ea88a56e9423095cfe80ebffda7137b4c76ad14f881106e4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.48/af_0.11.48_darwin_arm64.tar.gz"
      sha256 "5ad576b007ae703514f9c399cc072f730dc99953ee3d5e1115d9bff504a6ab77"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.48/af_0.11.48_linux_amd64.tar.gz"
      sha256 "d2f80d88a078ca1e6b41eb713402ccdbabcba20e7755a58a29466a4e1c43ee85"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.48/af_0.11.48_linux_arm64.tar.gz"
      sha256 "e57587277c7c4f464ec63a92bdfbd9a000af1eb83879471d67fef99e9f1eaa1a"
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
