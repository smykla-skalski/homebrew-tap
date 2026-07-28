# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.137"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.137/af_0.11.137_darwin_amd64.tar.gz"
      sha256 "b4dddcd5a4369dfc2f3d4ce45e50a6494fa3c9ad3c24c80b8a86aba048e1c69c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.137/af_0.11.137_darwin_arm64.tar.gz"
      sha256 "b97438873f1fdefe767242c701bc3c37c4d0c2bac62a6b3466caa9df5db0d89c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.137/af_0.11.137_linux_amd64.tar.gz"
      sha256 "ce463e3009621707f3723cc18c64074b4a78ab5d511348a42d1fba570f8ff781"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.137/af_0.11.137_linux_arm64.tar.gz"
      sha256 "aa34adac5d1ff4ec57b7c0a5348c2530b97e97e631ff9d5fd47bc80abe64b8e1"
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
