# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.38/af_0.11.38_darwin_amd64.tar.gz"
      sha256 "8c64731f0c23c65ca3ffd3f31530c5a1242a1faefa99990cf4f73f57f8725e4c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.38/af_0.11.38_darwin_arm64.tar.gz"
      sha256 "1f46798017156d3390f101b174336fa72fe6f7e93b1f28cedf5e72ba9780b8ef"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.38/af_0.11.38_linux_amd64.tar.gz"
      sha256 "a7056609d9c8a552fa91dd13d8387250fc221ee433a7fef1f66a3c0276f824cb"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.38/af_0.11.38_linux_arm64.tar.gz"
      sha256 "9fc8a21aa84b5e168ac8ec35971399b83bc4d82452b0881b7a0d3c2869f5d1f5"
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
