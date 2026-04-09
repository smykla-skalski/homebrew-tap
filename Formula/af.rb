# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.27/af_0.11.27_darwin_amd64.tar.gz"
      sha256 "e1bed623cc48e279913fbdaf9475ee31fbbc933f5630f07963adfdb450a1448c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.27/af_0.11.27_darwin_arm64.tar.gz"
      sha256 "a7d7b3109ac6b899305a13353c1c559075744d9e8e9484ce31ece478dda8b50c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.27/af_0.11.27_linux_amd64.tar.gz"
      sha256 "677e9d5849d0b5c541b5b8e20ed1e8f58ef07dc176e6cb24bf1cafdc3f60b6a9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.27/af_0.11.27_linux_arm64.tar.gz"
      sha256 "7cd23051e40df8cf5ad5ba133e92cdb3ea5d9018bc67f774ea318820cdeb0e75"
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
