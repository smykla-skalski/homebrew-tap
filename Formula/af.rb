# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.87"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.87/af_0.11.87_darwin_amd64.tar.gz"
      sha256 "58f11e6b55f936c638353128338096e2a6f0c125991c15cd38bd7d17874874a4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.87/af_0.11.87_darwin_arm64.tar.gz"
      sha256 "e5fbe6e3b3f8f88c504aae0c50730ea8097748e28136436918ee148e3d97385b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.87/af_0.11.87_linux_amd64.tar.gz"
      sha256 "b527ba68b4edb58d8da90052c1032ddeda16ef7ce2f0d9e80802b1c4026ae047"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.87/af_0.11.87_linux_arm64.tar.gz"
      sha256 "f82f4cd83f5436cd7753be3d2623be9633d768ec2cb2d70ee9ec45a7b3f85a87"
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
