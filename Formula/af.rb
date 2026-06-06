# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.85"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.85/af_0.11.85_darwin_amd64.tar.gz"
      sha256 "5608f0d146efa08d097614c6bf51190215130549e3862100d13b11cc754d0392"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.85/af_0.11.85_darwin_arm64.tar.gz"
      sha256 "3feb48db17a2e6c3bf5233af61190d54a64fb0c0e4e3da981955f072597a906e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.85/af_0.11.85_linux_amd64.tar.gz"
      sha256 "91a4eace502d929e8cfce2cdb51884e0c3520a43c7612375798a632a18b86f93"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.85/af_0.11.85_linux_arm64.tar.gz"
      sha256 "74411063c4e8b0ceb581ff67164cfe6f19cfb02a4ee0fd29069e172eaefb98a6"
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
