# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.21/af_0.11.21_darwin_amd64.tar.gz"
      sha256 "70acd8946f401df126fb055dc00393675e293a5093502fbd0f04bcf4c5b29317"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.21/af_0.11.21_darwin_arm64.tar.gz"
      sha256 "eedcbc19a5ccd8a8743d1b3d33b34bd63c40502f0405f744ed9f5f1820dfe7df"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.21/af_0.11.21_linux_amd64.tar.gz"
      sha256 "b035f20c9af74636e6c0cb3c9a85204b7309ffc18aad2187959f373414d56fab"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.21/af_0.11.21_linux_arm64.tar.gz"
      sha256 "b3eb43934c29b4195f237fcad3bb558cc053af8389feb0c6735c667ca0391998"
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
