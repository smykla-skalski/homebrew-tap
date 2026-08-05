# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.145"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.145/af_0.11.145_darwin_amd64.tar.gz"
      sha256 "87a548750b8e3a41c15e81996bc5d1dce8be9f084540242cdba8e22f2e2f281b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.145/af_0.11.145_darwin_arm64.tar.gz"
      sha256 "660f64c7799e6a9d0a984a4ab1de2237d708a359740e979296c6bab3705183c9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.145/af_0.11.145_linux_amd64.tar.gz"
      sha256 "db773589c725d34e80cfba49b6f96196c8668a778e6dbc5e2b2bb91373fa9b4a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.145/af_0.11.145_linux_arm64.tar.gz"
      sha256 "9db60487a37c073dbf7b56c42841296e59e1a5d90524988be223f4778222325b"
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
