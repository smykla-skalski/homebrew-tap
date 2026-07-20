# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.129"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.129/af_0.11.129_darwin_amd64.tar.gz"
      sha256 "7eb24b0596d1dd18940e6037ac5c5656d906078494e53282914d632b17bed5a1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.129/af_0.11.129_darwin_arm64.tar.gz"
      sha256 "77694c1e152b900e4694a1c02db526773fbeef16d8c3f58e880601dd3079780b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.129/af_0.11.129_linux_amd64.tar.gz"
      sha256 "2f815267c5ad1b29c7161be268d77e57a98de5aa457e3f83f9d68822ed35e623"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.129/af_0.11.129_linux_arm64.tar.gz"
      sha256 "accb8e4f7e47329d234bc8bfe52662cd59f1f07e3db1f97c8ee48efcf37a4a4d"
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
