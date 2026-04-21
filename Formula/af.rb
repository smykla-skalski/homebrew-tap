# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.39/af_0.11.39_darwin_amd64.tar.gz"
      sha256 "14e29a6d292f60a5b279e2f855cc0a1bd9582d7133deb6b64be659bbe0c730c6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.39/af_0.11.39_darwin_arm64.tar.gz"
      sha256 "e307a4c7af0daef5306d7298c764cdee77466d78a631112dff9a474ac97e733a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.39/af_0.11.39_linux_amd64.tar.gz"
      sha256 "a4c676db77b4a03193d3e5866baa40c6452160843fdde9d8417856149020def7"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.39/af_0.11.39_linux_arm64.tar.gz"
      sha256 "c07e9ecaf97f9072584ac262aa6f5ba83a17ae17709b53335291a650734a3f02"
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
