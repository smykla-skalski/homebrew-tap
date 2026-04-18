# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.36/af_0.11.36_darwin_amd64.tar.gz"
      sha256 "5d8412ed1df860145dbdd227b5c94d70c0a12268a87a66ba0ee44acda5d638d9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.36/af_0.11.36_darwin_arm64.tar.gz"
      sha256 "36f0c08935309ccf472cde808e4085717969243a63b07bed9a6d6e4a63e31093"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.36/af_0.11.36_linux_amd64.tar.gz"
      sha256 "c78b4b96ba4afac2623f6120af975a819a5ccef82c4a5cdf2be4128efc7352a3"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.36/af_0.11.36_linux_arm64.tar.gz"
      sha256 "6bfdafeb223d5f203f0876a214d413aeadc845fe46ef502b119ba3a2fc9b746f"
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
