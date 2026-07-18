# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.127"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.127/af_0.11.127_darwin_amd64.tar.gz"
      sha256 "80155aea8fbfd5652db433002b26393f55dcfb3f281a8dcef55e0d3ed0da317d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.127/af_0.11.127_darwin_arm64.tar.gz"
      sha256 "2a094b6f6e1d0468ab138ec70f9245fbb61032ff65da2352fc920957e5da3522"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.127/af_0.11.127_linux_amd64.tar.gz"
      sha256 "b73fda590f4e8cb8bb8221303426a1c683b7ea89b1b5b0bdc2a9a1646da25679"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.127/af_0.11.127_linux_arm64.tar.gz"
      sha256 "612309415a722aa4b013c2b27984b16d9836840832eaf3450c6001dafc96ba7c"
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
