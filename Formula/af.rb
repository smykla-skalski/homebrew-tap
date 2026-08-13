# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.153"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.153/af_0.11.153_darwin_amd64.tar.gz"
      sha256 "1624db0d709e558b4fd1c7c9bae37febdeb3afe9544440250de39e84af24f485"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.153/af_0.11.153_darwin_arm64.tar.gz"
      sha256 "daaa2f64e52786d4bb16e96acc91d0ad9d87087c8f9300c67560141ec947b1b2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.153/af_0.11.153_linux_amd64.tar.gz"
      sha256 "8a4459637871cf303f7f12ac096560963abbfaf6a7769318568bdbde50bc21fc"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.153/af_0.11.153_linux_arm64.tar.gz"
      sha256 "cbd3c4f443919b3e6dcf3f42d6c587068b41462307049d29164c10a12439cdd1"
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
