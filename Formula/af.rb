# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.72"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.72/af_0.11.72_darwin_amd64.tar.gz"
      sha256 "bb30139d9c91ac8b99112d3902c9b9c441a3cafc4367e67aaf2a789abf8a0fd0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.72/af_0.11.72_darwin_arm64.tar.gz"
      sha256 "6db8f0c56263a1d6db78f407cd3618badc9d973e7fe033c128c82833203230e7"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.72/af_0.11.72_linux_amd64.tar.gz"
      sha256 "e5ec43d0218c043896012b5f3c26e031b7b7210bde0d512c27dc43df8a2f6c7f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.72/af_0.11.72_linux_arm64.tar.gz"
      sha256 "62f47569278b72a7b8f31eda0b52fe7ae88a747a80498e47981dbcac36043169"
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
