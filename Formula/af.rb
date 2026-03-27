# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.14/af_0.11.14_darwin_amd64.tar.gz"
      sha256 "d747f567257ed481469d734ec9d11bc08f79d6de3213f65fdaef257716653e54"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.14/af_0.11.14_darwin_arm64.tar.gz"
      sha256 "6d036a053e433e3f3767f4d1d8af97edaf5128f79381719fd5dfb52c9f9d59b4"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.14/af_0.11.14_linux_amd64.tar.gz"
      sha256 "d5727e12336a0762ddb63a6f677ef0ddb066017d0348d8bde2fee3df39a5e996"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.14/af_0.11.14_linux_arm64.tar.gz"
      sha256 "48b665a53844694c1a582fe96a777dca12f586b23fac4776faabfe6bf88cbee4"
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
