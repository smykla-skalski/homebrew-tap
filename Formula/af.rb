# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.68"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.68/af_0.11.68_darwin_amd64.tar.gz"
      sha256 "b100863234b554b52ffea8f76fa54c71cba8abf745f6e0500d9a817e74e52aa1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.68/af_0.11.68_darwin_arm64.tar.gz"
      sha256 "3352bc0dc98e9fe0e001c07f4e4589e5f029edc95a45233be61e0ee726874043"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.68/af_0.11.68_linux_amd64.tar.gz"
      sha256 "d9d74c15b5724ae3c8fdb04ea08bf72bd12ffaaddcf04d4249e8446272e23e0d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.68/af_0.11.68_linux_arm64.tar.gz"
      sha256 "e47dd6bb1bcd75111aae0a9d8a19b343bf1ce5147401a6bc796d85a319e78b93"
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
