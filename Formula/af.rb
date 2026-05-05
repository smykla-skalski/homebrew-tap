# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.53"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.53/af_0.11.53_darwin_amd64.tar.gz"
      sha256 "08235dbc1c1d858875c2e9e447649021df9d71d43320fc92974c4b4de8d80f6e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.53/af_0.11.53_darwin_arm64.tar.gz"
      sha256 "fe48bd0149ded943d1e516b047626da8ac37197582e988da107e054d6812632d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.53/af_0.11.53_linux_amd64.tar.gz"
      sha256 "256f56bafff7a87229795223c5ed5f81d136c3d0d6f7b0a575969ba80a9848ef"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.53/af_0.11.53_linux_arm64.tar.gz"
      sha256 "52eaee1ee7a80856b7efe0d13204a162214a419ddfcd2d868c8cd9b7e1b3c7d4"
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
