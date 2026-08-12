# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.152"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.152/af_0.11.152_darwin_amd64.tar.gz"
      sha256 "406b101f96227c2f86203c22b2cd4444ab77f8169b8227d03867b28eca9d391a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.152/af_0.11.152_darwin_arm64.tar.gz"
      sha256 "31fa1bb25d2179ec2647bfdd06819567c7a3e51195c54193e5a8fa454c1b00ff"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.152/af_0.11.152_linux_amd64.tar.gz"
      sha256 "6297a953a988b749aa21daeade89f7b5d140b4055173eb3da86fc3e9362987dd"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.152/af_0.11.152_linux_arm64.tar.gz"
      sha256 "4f6a7cccf84f1fe3177b2ac918e816f1d7ee3c4ca8e2c739237e1c89cc5cee0e"
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
