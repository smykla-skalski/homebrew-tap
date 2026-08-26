# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.166"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.166/af_0.11.166_darwin_amd64.tar.gz"
      sha256 "685e3c0fb6eaf388bcd4a2846cdc543f2bfb4a26e0dc076bdbd64b7b60d53f08"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.166/af_0.11.166_darwin_arm64.tar.gz"
      sha256 "a7b64e049d1c70083c9b4e8bdffad1485e7a5403e85dcb60d98434f79b69fc23"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.166/af_0.11.166_linux_amd64.tar.gz"
      sha256 "0092d6391d59132262d9af0398df9627009b0a034b0257294f8872761c520ff5"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.166/af_0.11.166_linux_arm64.tar.gz"
      sha256 "80aab3bcc04401669cd6681d3fefecd9fff9d774f453c5276e25fae4a4ff6b7c"
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
