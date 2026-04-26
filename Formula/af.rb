# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.44"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.44/af_0.11.44_darwin_amd64.tar.gz"
      sha256 "d3167e0b8c74fc08f6a62f60e1c429f366d68364f9a76c5090c657dfa9afdb31"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.44/af_0.11.44_darwin_arm64.tar.gz"
      sha256 "a90f716174a00739010d0ba67a96a4c42aa6010225dde597f342cec06038d3ff"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.44/af_0.11.44_linux_amd64.tar.gz"
      sha256 "75885f7ec0e375f8a5783506db41433b4e477648161860f19d6b4d7bb47644de"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.44/af_0.11.44_linux_arm64.tar.gz"
      sha256 "46d190d86fb6fcf30180bfcf6f342cbd11c3582f4e16b5effdbab234d8e017e3"
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
