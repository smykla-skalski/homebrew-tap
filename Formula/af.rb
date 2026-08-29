# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.169"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.169/af_0.11.169_darwin_amd64.tar.gz"
      sha256 "713bed4907a271c7f684c033bc189ce232d4a4f650846698455e0c0dfcbb434c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.169/af_0.11.169_darwin_arm64.tar.gz"
      sha256 "9f74d19d7043df1b0065e2b82bff29078f13768b8aaee19aae5d6a6288a6a3af"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.169/af_0.11.169_linux_amd64.tar.gz"
      sha256 "902182206b2b75ff0e382573ee072720bbf406dd8cbd9bc245af40bcd5ccb570"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.169/af_0.11.169_linux_arm64.tar.gz"
      sha256 "01eb0c7710ae6e1e645898d63efa785364cf33c22029174e55fd269df4ba4c21"
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
