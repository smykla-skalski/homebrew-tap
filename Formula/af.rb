# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.54"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.54/af_0.11.54_darwin_amd64.tar.gz"
      sha256 "7b51fb9d07d6e81ddd86cfa74ccf6a3d02de7306803c60740294da41548e8c28"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.54/af_0.11.54_darwin_arm64.tar.gz"
      sha256 "348b74f8274ac6c3aa7f761b556eec47d804193845e4e72219437c9d5562f57c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.54/af_0.11.54_linux_amd64.tar.gz"
      sha256 "5ea0f590ba06153b30c60c75ea552fb7f0588df0c22ff0616fa9bd44dead9497"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.54/af_0.11.54_linux_arm64.tar.gz"
      sha256 "008968c472ee5a64b63d56cc1f7b15dff3952f9053ac358b79d3136f2abc8dd3"
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
