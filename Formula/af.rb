# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.103"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.103/af_0.11.103_darwin_amd64.tar.gz"
      sha256 "8dae1357164d5ff2bf79d737640910a40f4af03aa8c3f078d1bc91d64fb9e014"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.103/af_0.11.103_darwin_arm64.tar.gz"
      sha256 "a5cf4b7d315e341dcc54e9894cd13caab95d165b6eb0b0e5e92519ad37a10771"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.103/af_0.11.103_linux_amd64.tar.gz"
      sha256 "33eb43a9b13facd7fcbcf470956074431a2624e989df826d617420f9667995ae"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.103/af_0.11.103_linux_arm64.tar.gz"
      sha256 "df277890a7d36205ddc23e1ce79bc9317b470482dba9256c4f29e496b2096d04"
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
