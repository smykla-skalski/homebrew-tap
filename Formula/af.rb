# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.28/af_0.11.28_darwin_amd64.tar.gz"
      sha256 "ccd5cb1d76d273d79e56029bc3bf63ec529bbeb7a426fb35bc32bcd68d543a76"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.28/af_0.11.28_darwin_arm64.tar.gz"
      sha256 "2201a68b19fdbeac6f9ac4af07dace86017d6b1d8f6ff91dc009d3e49ef6d451"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.28/af_0.11.28_linux_amd64.tar.gz"
      sha256 "1d91b9abbf0e194dcd872ba1daf96217d3c2da96bb7dfc07a7e1370730343ba9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.28/af_0.11.28_linux_arm64.tar.gz"
      sha256 "a59469a5580a1b2cea31120bf7621b1e81c44357e0a3e57ee025860e769fb036"
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
