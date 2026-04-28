# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.46"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.46/af_0.11.46_darwin_amd64.tar.gz"
      sha256 "f7f1fef42df1141ba4425328b6f412dfe93534445dde3d89662cc98911e5a4f9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.46/af_0.11.46_darwin_arm64.tar.gz"
      sha256 "b6bf55943a8c82959bccdf5660e0cca40bd4466208ec35e43b17d02ee56d2fd2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.46/af_0.11.46_linux_amd64.tar.gz"
      sha256 "82ece95a37b0e882e9336b3ac2ee5baa41008687ec1d9c09610672e61bf9959f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.46/af_0.11.46_linux_arm64.tar.gz"
      sha256 "adb218ac5fe3f627333fbcebe123000463eb8b32a8f4463a59b952ccac9c7dd0"
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
