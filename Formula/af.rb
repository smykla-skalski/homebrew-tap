# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.133"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.133/af_0.11.133_darwin_amd64.tar.gz"
      sha256 "d53907d8e2f944b6c35341913fd292f5b548f97b0eaabdeed5bfda0405c44635"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.133/af_0.11.133_darwin_arm64.tar.gz"
      sha256 "a036b8e9f9bcf56da97a81f46e245c8c5035006820b2d995fadfc7e7e3a243f5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.133/af_0.11.133_linux_amd64.tar.gz"
      sha256 "27410e8e8748666760c1c4cdc422f990e7afb772f09062d0f2996d8b3ce0cf89"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.133/af_0.11.133_linux_arm64.tar.gz"
      sha256 "3581d1c5501aad8a227685feceac61c2d67a5f429b14dc0ca5d27cf1a445b941"
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
