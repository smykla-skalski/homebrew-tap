# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.7/af_0.11.7_darwin_amd64.tar.gz"
      sha256 "3fef731ed751ef0f8b781fbe19477665c6eaa86a267f05550fe4484ef70c51e2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.7/af_0.11.7_darwin_arm64.tar.gz"
      sha256 "9f3195692cf7c1a2a65146979ad796c0aa18730a408655044995aa96b0b2df1e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.7/af_0.11.7_linux_amd64.tar.gz"
      sha256 "c0b88649a66193e61e17496f155e2feafb9935954e0441cca84392becd850a99"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.7/af_0.11.7_linux_arm64.tar.gz"
      sha256 "5343f2f23613d7467a351ec0032854b8cd670fbb973b52b94bf5ecde8d882b03"
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
