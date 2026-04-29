# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.47"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.47/af_0.11.47_darwin_amd64.tar.gz"
      sha256 "465d3d62fb9d2d94f59ae4c2e84fcfffbd9dea770acfa0dc5f1a547663072da1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.47/af_0.11.47_darwin_arm64.tar.gz"
      sha256 "a7296ac0109ea4bd724f1399db513830a184ab395d613e6bef8383ef023b0e13"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.47/af_0.11.47_linux_amd64.tar.gz"
      sha256 "d6f60ffdcc38900fc180c028f1a7cb058c543f3eaa1b0ed38a07be484bb6500b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.47/af_0.11.47_linux_arm64.tar.gz"
      sha256 "0ddcdc6869b80542ff357f9110473445b97d5eb7d42f7e929c9dae80c0d32a34"
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
