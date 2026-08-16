# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.156"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.156/af_0.11.156_darwin_amd64.tar.gz"
      sha256 "a08eac26449d968fd5b27406bbd9a6e98fc1cf3251047a8dc2e4cb50d17cd018"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.156/af_0.11.156_darwin_arm64.tar.gz"
      sha256 "5824d9edee37793349338145173807e152ec1ec126fd9e8385f0c79de4f8d1bf"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.156/af_0.11.156_linux_amd64.tar.gz"
      sha256 "cd26d1b5fca04a9fdb45eecc0e065e4ac85915a5222f196af1fbc5bce553ad5a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.156/af_0.11.156_linux_arm64.tar.gz"
      sha256 "ad60a4bcbb73f3035e3eeed9c1e8f9bf3d52aa678432e69ffde289a2bdd8ff29"
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
