# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.106"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.106/af_0.11.106_darwin_amd64.tar.gz"
      sha256 "c628eaef8ff0fd1637d50712dd33ad8435c5bf20551446f0c3c14baf323524ea"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.106/af_0.11.106_darwin_arm64.tar.gz"
      sha256 "f01835347cdb50daf16d27afadd2fe64e116393980ccb14130a85c33e6737547"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.106/af_0.11.106_linux_amd64.tar.gz"
      sha256 "15aaf228480467e399617b90696a3bd04a022fb8e1aa30af089aae670c2690ba"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.106/af_0.11.106_linux_arm64.tar.gz"
      sha256 "61b6350d05035f8d5037d775d05fc01bdf0c73cc2ac785ec8e9a5b8c2f0e9677"
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
