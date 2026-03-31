# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.18/af_0.11.18_darwin_amd64.tar.gz"
      sha256 "81e5a5b70ed431d33b43e5cf5f165f86e947b99fc21a30986abaed1815267101"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.18/af_0.11.18_darwin_arm64.tar.gz"
      sha256 "a89b85997f88a552141f1f570c127e6ba1e3163992e17863d591e3b0ad246e9e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.18/af_0.11.18_linux_amd64.tar.gz"
      sha256 "d48ab1daccda90d796ee6906b6b61c67c8c80e03be57715097a043eb86356502"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.18/af_0.11.18_linux_arm64.tar.gz"
      sha256 "72c3a0ac4912f958e6480975a4dfacd4374e310b5bbed3af44f7687203c51255"
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
