# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.95"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.95/af_0.11.95_darwin_amd64.tar.gz"
      sha256 "189c03ef30cf7c0e3334c9e0a6f11dfc96666322c5c348b803105c49e1931149"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.95/af_0.11.95_darwin_arm64.tar.gz"
      sha256 "702ab911910e230145a294b1417f92558f139ebcf80495b640b1cb0d6f88b650"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.95/af_0.11.95_linux_amd64.tar.gz"
      sha256 "f6b937fb0dba6f8740a703ffaef72dfd3cbdd7bc593a476eaa31979006e79a85"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.95/af_0.11.95_linux_arm64.tar.gz"
      sha256 "382a124f7536b9d6aafb77f9ed505649bc22ecd11d11b632303a4df90416ef75"
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
