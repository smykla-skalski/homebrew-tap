# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.116"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.116/af_0.11.116_darwin_amd64.tar.gz"
      sha256 "a4ce7694a383f2a22f8e9c320d153bbd277bdf8f55be35a494eb66230fbe97dd"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.116/af_0.11.116_darwin_arm64.tar.gz"
      sha256 "19d195371df2c8aebd2c54f44e7f3a8983c400349b3e5a1a50baf20acc41c9bd"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.116/af_0.11.116_linux_amd64.tar.gz"
      sha256 "5c32b5f5f3bc4569fb2da32aaf3e839a9650ad82f4fef41e3e2281bda08ad99b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.116/af_0.11.116_linux_arm64.tar.gz"
      sha256 "5a6d4b3bf829aadabf17437f8d48f78e01127c111802770dc21f291e363f86f3"
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
