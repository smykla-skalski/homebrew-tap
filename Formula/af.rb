# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.77"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.77/af_0.11.77_darwin_amd64.tar.gz"
      sha256 "d28b071ca8ede5c49fb244c76124ea5ba527692acdf7e0fe7099e34d579e6d8c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.77/af_0.11.77_darwin_arm64.tar.gz"
      sha256 "79753849ca0dce4e0ed7e4fd938adacfc4445e15631828408ad05db4b15ef4e3"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.77/af_0.11.77_linux_amd64.tar.gz"
      sha256 "9fdc969d25fae1f4f962cdf632790a604071a06d370a36f9b5b4de73e3c680c5"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.77/af_0.11.77_linux_arm64.tar.gz"
      sha256 "43ca5e1fb42cfe38bae43e594b57a25f85b46332283b2e6081d7f8504cc1b73f"
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
