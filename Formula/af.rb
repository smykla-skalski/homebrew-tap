# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.172"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.172/af_0.11.172_darwin_amd64.tar.gz"
      sha256 "1979480eaf4a8becb36f34dbe9fb6c5126ecd200b464a7b2b53419e4486d55f5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.172/af_0.11.172_darwin_arm64.tar.gz"
      sha256 "893985f33ef45e5c2b5c39bfbba8ff25329a1aa8909d6bff6a9c1633afffb792"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.172/af_0.11.172_linux_amd64.tar.gz"
      sha256 "5129e259b0acdc77032f98fed8aca4241d7b826c23d031f8d9275403582ef497"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.172/af_0.11.172_linux_arm64.tar.gz"
      sha256 "b8f3e5815e0c65c89926f32e044d67916819410ffdfa21d8cd88ce72e63eb4b4"
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
