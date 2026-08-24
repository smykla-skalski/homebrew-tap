# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.164"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.164/af_0.11.164_darwin_amd64.tar.gz"
      sha256 "873215e6bcd9db566f36a1d6e46e29a9ba54bf344f14ae239697e963fcf637cf"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.164/af_0.11.164_darwin_arm64.tar.gz"
      sha256 "72dd69bf909aa3e255dd1119266bc3da171a0404d015e4b50b9afcd6fbcbc014"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.164/af_0.11.164_linux_amd64.tar.gz"
      sha256 "b4da55508bbe97f478f537e033a2398e2ed13313dc04c418e868f48548f8efb5"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.164/af_0.11.164_linux_arm64.tar.gz"
      sha256 "73d78c5d205206d2f9db7ae83e8b7a832903b77a014d551cfd600bb4a7dbf715"
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
