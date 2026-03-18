# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.5/af_0.11.5_darwin_amd64.tar.gz"
      sha256 "77b6b9fe6000880cd49f4154046fc664fb6d866f60130da715157ca6391803ee"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.5/af_0.11.5_darwin_arm64.tar.gz"
      sha256 "462e05a5b314cd3ac4b2f9b35c269fa5f5c142cd82de32e182db255c882de455"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.5/af_0.11.5_linux_amd64.tar.gz"
      sha256 "d2743f092cf7c918cd170dcc22f3427bf7076edbd10257b3161211e57a13a5da"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.5/af_0.11.5_linux_arm64.tar.gz"
      sha256 "c4bfed39c349deb3582c4fa1a295f39c6d62dc82fcfecedf9fdeff662fd0fc2b"
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
