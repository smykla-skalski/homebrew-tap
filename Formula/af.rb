# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.151"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.151/af_0.11.151_darwin_amd64.tar.gz"
      sha256 "d314d93de9a4879bdfe91610a9dc1ecc1a785d2c5846e31e456c201291661b7d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.151/af_0.11.151_darwin_arm64.tar.gz"
      sha256 "49989882ad4e72842a7411436e43b74308834beacfa0b786df8e13d4677c5c3b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.151/af_0.11.151_linux_amd64.tar.gz"
      sha256 "6f59d88886e24891e2dad55f53f593656f508fddc65040c0ce09837bffaabfb4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.151/af_0.11.151_linux_arm64.tar.gz"
      sha256 "e92c2ed2d0c58d3604229693941c60b3940a31c70767cd2fa73bd1c16b500eba"
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
