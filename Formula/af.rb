# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.128"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.128/af_0.11.128_darwin_amd64.tar.gz"
      sha256 "be03a09fefc4f9bbf62a9b0960aaed03c7372b7a8b88bf38e28a5371722cfc79"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.128/af_0.11.128_darwin_arm64.tar.gz"
      sha256 "2383541c08d03df31d5f7d2a57ab26bb0e2bcacc5b951c202f12401a3dba0401"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.128/af_0.11.128_linux_amd64.tar.gz"
      sha256 "c32ea7c34a33c5ffab96043ff1694cbd2ecd1ed172112e993dc5f1461f43a1cb"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.128/af_0.11.128_linux_arm64.tar.gz"
      sha256 "d41b171a552979e655b6fb2f489a106136cfd93f9e887a79a72b38d9ca8b4f91"
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
