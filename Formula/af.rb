# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.140"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.140/af_0.11.140_darwin_amd64.tar.gz"
      sha256 "674f64e0ee01b830e23c486e75b241b640bbdce451924065084d6a6f07f5ed02"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.140/af_0.11.140_darwin_arm64.tar.gz"
      sha256 "4179ce1aaf00a572b08918a2391c095077917df03777cc7974b326c3f83266d8"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.140/af_0.11.140_linux_amd64.tar.gz"
      sha256 "96891ec22932b66d2b55136e8b70395dc166c5798bef5d356a054a2d76a0ac9b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.140/af_0.11.140_linux_arm64.tar.gz"
      sha256 "43b49251b37f4336222421ec1719ac62384d81c2f9302caa10b21efeae3b3b29"
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
