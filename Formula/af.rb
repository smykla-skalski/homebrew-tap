# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.171"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.171/af_0.11.171_darwin_amd64.tar.gz"
      sha256 "445c36d6715a8b2a5a3f2eb2cb9e28a53081e5ab7984a2b1e149fbe355375a4e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.171/af_0.11.171_darwin_arm64.tar.gz"
      sha256 "8afb9e8da68c03ef1d91a0c26ff5ee3b0839ac383b92af1c8f9f92ee4e9e50e1"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.171/af_0.11.171_linux_amd64.tar.gz"
      sha256 "8255025df81223dc1827461b1da64273123215cf80ff48cfcc6b8f93f125d86b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.171/af_0.11.171_linux_arm64.tar.gz"
      sha256 "22da7aa8f780865f8f1d74ad08eff6cef900a5030ef2680d636ed63839cfff79"
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
