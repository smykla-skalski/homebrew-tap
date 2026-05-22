# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.70"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.70/af_0.11.70_darwin_amd64.tar.gz"
      sha256 "41dbe55ef1a28d896d14bde97294dd6135ff12d443ae317ef6d42c7d9c6a57df"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.70/af_0.11.70_darwin_arm64.tar.gz"
      sha256 "944dfc738ce937532d4f8ad52d9880becf2594883f66e0870284d9533ad31248"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.70/af_0.11.70_linux_amd64.tar.gz"
      sha256 "119ce434ba80ae3d48459c487dcc8c2ba2745fde89fa8871edbdd45a0a838cd9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.70/af_0.11.70_linux_arm64.tar.gz"
      sha256 "6eebb75e37c170cf63ace26a5165b7b2b44cd2b700594dac4347c1bd941f600f"
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
