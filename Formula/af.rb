# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.42"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.42/af_0.11.42_darwin_amd64.tar.gz"
      sha256 "e16c7631133f1799e5d869a1443aea9e07a1868352b0499df96f978f5c576ff6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.42/af_0.11.42_darwin_arm64.tar.gz"
      sha256 "a6c2418530a7691cb9b968a3d02ac1edda43109b6dc7cfb841ab3ca3203d2dbe"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.42/af_0.11.42_linux_amd64.tar.gz"
      sha256 "b4330840455f3453da40868c69044aeb28822179f1107c49771420be2b4e9a2d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.42/af_0.11.42_linux_arm64.tar.gz"
      sha256 "89d81256cda2c4be28d615afcaa9c2c4cb9860e5838b589356bf258b619a23f5"
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
