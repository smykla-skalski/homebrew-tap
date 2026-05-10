# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.58"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.58/af_0.11.58_darwin_amd64.tar.gz"
      sha256 "a75624e7c2c0c46ddc0cd31464fcb38c78e4ca3d917d1b5775eeec5cc5c4c9be"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.58/af_0.11.58_darwin_arm64.tar.gz"
      sha256 "9ce4825be654aa2d9a7d27ead587a7cc00ac956b39fa19ca9d9631fd54f19890"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.58/af_0.11.58_linux_amd64.tar.gz"
      sha256 "91e16a3a04008dc7fe29cf8b80eaaf81311d7b5642d03a6b4a2eb387018d0ae1"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.58/af_0.11.58_linux_arm64.tar.gz"
      sha256 "9764595e76134b7ff20514dafad7d6dc5c1eb714a4303b6b7a748e077bfdf7ab"
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
