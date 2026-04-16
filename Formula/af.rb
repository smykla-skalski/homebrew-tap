# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.34/af_0.11.34_darwin_amd64.tar.gz"
      sha256 "cec2b2e7c9571039298f1a4ec735bf8b5b4e4c2c20ede839066d6b5871a538f3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.34/af_0.11.34_darwin_arm64.tar.gz"
      sha256 "1e9924863dd8e3c66d2d929a78bdc0e613632ea3b7693d73e851e652ec598b87"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.34/af_0.11.34_linux_amd64.tar.gz"
      sha256 "272fe6519cf936b685d13417be35a2270a2bedef8688fc8959e4de946ab9beda"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.34/af_0.11.34_linux_arm64.tar.gz"
      sha256 "de2888ee460ce9b1a53e2002ae5aa1615c1045a4b63fa37218ca3b3bf1a46f1d"
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
