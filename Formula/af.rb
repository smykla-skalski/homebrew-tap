# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.0/af_0.11.0_darwin_amd64.tar.gz"
      sha256 "f142a7962c7138997f01d4f5760a1b8b1af62506e6028a59f8e9e970bd84ca35"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.0/af_0.11.0_darwin_arm64.tar.gz"
      sha256 "b84d1e43d2a751a97e304b2a0ddf00d4b492a93d5a0d3d76edac5fdc774a2434"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.0/af_0.11.0_linux_amd64.tar.gz"
      sha256 "feebcffec33b1c30b0158274755713104df2d658a4f6056b2b65345707bb0d7e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.0/af_0.11.0_linux_arm64.tar.gz"
      sha256 "c84fea6ce3fedeed6cd7d29dd4e61f2307c6520192b3ed1b2ec5439bea8c7185"
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
