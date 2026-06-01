# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.80"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.80/af_0.11.80_darwin_amd64.tar.gz"
      sha256 "89510363405bb13fb032e93b9b3c9634c95cdd8609b631101f4528d93b1a8f57"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.80/af_0.11.80_darwin_arm64.tar.gz"
      sha256 "f5dbec0744dca1ef4013c25044474995711f4df6888e797d2c89623b233b3c96"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.80/af_0.11.80_linux_amd64.tar.gz"
      sha256 "4ebd10055058f1775775a6368826016797c0a19624d8abdeb86ae007b5d25a66"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.80/af_0.11.80_linux_arm64.tar.gz"
      sha256 "9a8ce32e25c296b010a43e8f936b8881cc216887025b79780b3ffaa9c74a0b17"
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
