# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.143"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.143/af_0.11.143_darwin_amd64.tar.gz"
      sha256 "dd81f63217c8fee84319029384fd5004c46e3c4efa63c37aa63b6e7ddab0f615"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.143/af_0.11.143_darwin_arm64.tar.gz"
      sha256 "9161a220e34e1b2e32fea436edd0a8b5621bf08a043c401c01613fb24466d95f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.143/af_0.11.143_linux_amd64.tar.gz"
      sha256 "12f4d75327b779025878f665377f3aff3172cd9e81270a2d4711fea6f5f7f312"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.143/af_0.11.143_linux_arm64.tar.gz"
      sha256 "982ee2c37e0564e74dae28b445337ee02127a3939b8472507313b44073fadfc3"
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
