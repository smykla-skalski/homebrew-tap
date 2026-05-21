# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.69"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.69/af_0.11.69_darwin_amd64.tar.gz"
      sha256 "a1908f04c413eaffd92def5b42d2643b7ea6b406dc0d9423d53f2a4b264eef20"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.69/af_0.11.69_darwin_arm64.tar.gz"
      sha256 "d88a9cfa0700563dee5bec0fb7ec597fadc15996f5d3b5717b17df6f94e30a53"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.69/af_0.11.69_linux_amd64.tar.gz"
      sha256 "8a0353567fcaad9fd49909efd64ab11d9a8a1e1044d47780a401134a3023ecb7"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.69/af_0.11.69_linux_arm64.tar.gz"
      sha256 "75efcd5a8f1c41e613233e07f8587bc141bdb131e0f9e219dd80f39f24f592c8"
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
