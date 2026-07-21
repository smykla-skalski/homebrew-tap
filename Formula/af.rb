# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.130"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.130/af_0.11.130_darwin_amd64.tar.gz"
      sha256 "65a2eb4a2d14fda847d6f3af895d604f4eb73f081c5800b289015e7d8c824dc6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.130/af_0.11.130_darwin_arm64.tar.gz"
      sha256 "f30fcd3a1cdede969eae15cff6ad67584172b9c2f0fa2b394d945e1e432194ba"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.130/af_0.11.130_linux_amd64.tar.gz"
      sha256 "9123e0c73b322f1b1603a0c3eb1136d012c32f817aa711c75360e51fd5c6200d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.130/af_0.11.130_linux_arm64.tar.gz"
      sha256 "2b9e03fdf4258bf1309f1dda55ece3b67494966c88fb3ee156233c2497b95d5f"
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
