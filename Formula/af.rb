# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.4/af_0.11.4_darwin_amd64.tar.gz"
      sha256 "6e1adb7888140ae6fbae2add2ac405be3b67fa33de9e143c3af52d683c3d6ead"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.4/af_0.11.4_darwin_arm64.tar.gz"
      sha256 "15df61bdfd529aeacd47b1e20fdb897a093853eb43774a0d0f770519c6825822"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.4/af_0.11.4_linux_amd64.tar.gz"
      sha256 "6c413e9f235c0c9c772f711854be4d4f171b245382f46b91305891fe1e60d8dd"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.4/af_0.11.4_linux_arm64.tar.gz"
      sha256 "c9a530fad3e2c234ea468a5f5c3061376ae2ceda5b3e8aed1fdf5aba5ff66ebb"
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
