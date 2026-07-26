# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.135"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.135/af_0.11.135_darwin_amd64.tar.gz"
      sha256 "67c6f42f8a6d456db2afc679d7797abbb9355e6643e7b5318b9fdb776abc2842"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.135/af_0.11.135_darwin_arm64.tar.gz"
      sha256 "6689c3f39effd138e304c3f92e0f4bc45a19b20d2091ea7493fbccadde869bf5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.135/af_0.11.135_linux_amd64.tar.gz"
      sha256 "a8453895130611aa59d13bebf47d2b1e93adf67964fb533661fc11adb19c1b85"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.135/af_0.11.135_linux_arm64.tar.gz"
      sha256 "f222f309ddfca5a9fdd271cee61534a85a0c66c394379285e2367fc731538a9f"
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
