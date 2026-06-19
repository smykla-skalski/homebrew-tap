# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.98"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.98/af_0.11.98_darwin_amd64.tar.gz"
      sha256 "6b0733c4f0ae8df314a353c7dce8f15495db26354e98580e22f19eb5c7affb7f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.98/af_0.11.98_darwin_arm64.tar.gz"
      sha256 "87c4958aba160380e4de512f8ea6dfac46b9d760050ff3f491d24f4b2344ed9f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.98/af_0.11.98_linux_amd64.tar.gz"
      sha256 "cd1098f452d44f789f466a9529225c4c4ab5984c8219a15a1c7505774455ed4a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.98/af_0.11.98_linux_arm64.tar.gz"
      sha256 "c0707c9fe9b19a699c21c8671b2d5834421d93bf295cafc65bb869649b721a94"
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
