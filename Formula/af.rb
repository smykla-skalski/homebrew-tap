# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.114"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.114/af_0.11.114_darwin_amd64.tar.gz"
      sha256 "a64f331d9f77984eb009c79f0ce5336cd43f985d9677aa584bc626ab8174e3d2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.114/af_0.11.114_darwin_arm64.tar.gz"
      sha256 "36954b41e04598a20e2dc02de5dbec00a27d8ded695b73d1c80eec71c335a9c3"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.114/af_0.11.114_linux_amd64.tar.gz"
      sha256 "66b43852d5e32d1be7e45e4eba0cf4867caf27e97bb0b82febdea370cb82dbde"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.114/af_0.11.114_linux_arm64.tar.gz"
      sha256 "fe8b0041bfecbc20d23e22194ccda6f6d1ab158bda03a68e14b47f74b490b611"
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
