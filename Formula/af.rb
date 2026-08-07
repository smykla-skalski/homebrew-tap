# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.147"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.147/af_0.11.147_darwin_amd64.tar.gz"
      sha256 "b18d902e994bf1436683d241f5d60e8c7b965faa277ea0d1df0c8cb9112bf0fe"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.147/af_0.11.147_darwin_arm64.tar.gz"
      sha256 "f9434ca2b4ec2338721ea6430f998a4a9a44798f108ff402a460865ca0aec6e2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.147/af_0.11.147_linux_amd64.tar.gz"
      sha256 "bb1e0ff19ffd72c3f607216ad91607bd5fc5cb2eb1ee423be7a13074fd48cbe1"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.147/af_0.11.147_linux_arm64.tar.gz"
      sha256 "a3abe9579f0da4814feeafc6c3c013daa4502a8307eb39b8e3f44e085cf2779c"
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
