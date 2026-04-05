# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.23/af_0.11.23_darwin_amd64.tar.gz"
      sha256 "52b9ab28d0fc3aa6e650994f5b7c8b3a8d87ffbf35bf40d9fc0f409052183a7f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.23/af_0.11.23_darwin_arm64.tar.gz"
      sha256 "acad45b76435e3c1aac76038a29d81e6f8081faa91049275308862c617c5a640"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.23/af_0.11.23_linux_amd64.tar.gz"
      sha256 "69a3db0989466946a01a1ef46fcf83e0489d45cb51886cf5abfe3678333c2e80"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.23/af_0.11.23_linux_arm64.tar.gz"
      sha256 "cbd8184e57378b1d293f970dcdbbea5457aa43ab6571b925c573886b6801a512"
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
