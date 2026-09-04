# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.175"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.175/af_0.11.175_darwin_amd64.tar.gz"
      sha256 "75ed295e028cf08aa26b4f6d08585254ae51a501fe5caf87680862d92c246081"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.175/af_0.11.175_darwin_arm64.tar.gz"
      sha256 "dcd92ce864ff8568a5c2142d259e5e22033fdf73f6101a2299234667a2bdf3e6"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.175/af_0.11.175_linux_amd64.tar.gz"
      sha256 "94b7fa63ea776d3e568adfd59263372148e26f397ecb1139a616bb8aebed2157"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.175/af_0.11.175_linux_arm64.tar.gz"
      sha256 "e47e37eac60cf19c4c2d558b48309edafe2ab1fee0dc1a062164af3b59ebe70b"
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
