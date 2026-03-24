# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.11/af_0.11.11_darwin_amd64.tar.gz"
      sha256 "a19f1471fe0c771da06248dc9d9c641adac62f9e8e6edbbf61db3e679645b241"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.11/af_0.11.11_darwin_arm64.tar.gz"
      sha256 "0a2acc90a3ea45eae807f098a30892a4a2a88e6f27f52faa3e2521921cfc4ce5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.11/af_0.11.11_linux_amd64.tar.gz"
      sha256 "6f34ee5c3d3091a61b4bfc4a2ec995e5f14b3818fe30f37c7114ed492e7b80f6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.11/af_0.11.11_linux_arm64.tar.gz"
      sha256 "eee3227b83f614b23a6728c778ad52193a024206eff3b40148a03c8f2e8484ca"
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
