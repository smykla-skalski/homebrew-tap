# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.99"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.99/af_0.11.99_darwin_amd64.tar.gz"
      sha256 "eee1d1d32daf8d53b7de7669825d0247e378d8ef476b7e217a2e67d627061e94"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.99/af_0.11.99_darwin_arm64.tar.gz"
      sha256 "fc5844d80036305795a5341cce87f74939c2fea0e60aa797d7e02e338f65aba7"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.99/af_0.11.99_linux_amd64.tar.gz"
      sha256 "dddaff520fdf57a4a20c6f1de7e2b99b954a463120227a4bfab115ab140770c4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.99/af_0.11.99_linux_arm64.tar.gz"
      sha256 "acfe21e17d0cc9a46b90d6dd6977209dc99f2152749cf73fc11c00c7fa3b1c10"
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
