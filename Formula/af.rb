# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.3/af_0.11.3_darwin_amd64.tar.gz"
      sha256 "98534b6b9394443c9c490d73f00636e051c84e145b89f1cae7dde05df0d211fa"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.3/af_0.11.3_darwin_arm64.tar.gz"
      sha256 "fced55273b146baf62a2526ce1905be6a371905f06de7308f5d26ed02a616d6e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.3/af_0.11.3_linux_amd64.tar.gz"
      sha256 "08ed96f7fed563d460749b0ab04d9bbf72b31cf413da8d6dbd1de85aa26bc1dd"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.3/af_0.11.3_linux_arm64.tar.gz"
      sha256 "400c76bc7484cdb5bf32c73f140023601cf0a34fd1549a3957886a9558d6450d"
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
