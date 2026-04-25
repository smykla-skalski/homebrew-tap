# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.43"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.43/af_0.11.43_darwin_amd64.tar.gz"
      sha256 "f173168f1c0ebc95e0a786569d547c27d8c19228e1d940fb32a2785ca2c7596e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.43/af_0.11.43_darwin_arm64.tar.gz"
      sha256 "aa53ae607d4cd633d70c7835de75fff04fd10a3daaa6b02717d12eda54cb3b68"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.43/af_0.11.43_linux_amd64.tar.gz"
      sha256 "da9d8c292aa6d382d8d70f734f6ccc2dbbf62c193144b3b5c636b0dc0e0af5f4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.43/af_0.11.43_linux_arm64.tar.gz"
      sha256 "680e108055e73aa815e8cfcfbc4ce0f5771f4a1d9d223b1cd756afadc9c1daae"
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
