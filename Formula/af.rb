# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.73"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.73/af_0.11.73_darwin_amd64.tar.gz"
      sha256 "e9ffb843aa18c03d82ff71765d8fd64bb5d158c088e17824fb1ccce0782ac465"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.73/af_0.11.73_darwin_arm64.tar.gz"
      sha256 "8e73438ec3bfddc5b860ec07fee8a7a9e00d3df3e3d93415fad322e07bf03cdd"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.73/af_0.11.73_linux_amd64.tar.gz"
      sha256 "9f1b488832e19cc26b476235e5061f04ba9ec40cb8e78ad998fe3761c2029820"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.73/af_0.11.73_linux_arm64.tar.gz"
      sha256 "e52e58535a4b066c2d960e1ea06795af50c81db871b66ca143e212ba23eb8801"
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
