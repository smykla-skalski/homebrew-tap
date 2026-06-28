# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.107"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.107/af_0.11.107_darwin_amd64.tar.gz"
      sha256 "be16b0187f6ff533e0880b45b9fa79519bee5012b577088d0a36d9d2ab34fd42"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.107/af_0.11.107_darwin_arm64.tar.gz"
      sha256 "6193b7b3c94969b9220b729a27acf8e6cef4ef9d1f6eed700cd03eccb2a63eda"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.107/af_0.11.107_linux_amd64.tar.gz"
      sha256 "bf7034ffb51eb86a66051641488014f3b8a419a633f17aec5cc03876cfe6e1b5"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.107/af_0.11.107_linux_arm64.tar.gz"
      sha256 "af80d23d2b6ac9c7261c7311a53cbe9fdb233063d45346344d39a6454b0fe433"
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
