# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.13/af_0.11.13_darwin_amd64.tar.gz"
      sha256 "944c4c159fcca3d1c613da8beaf69443e255ea24003e9f4d35f090795e28e1d4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.13/af_0.11.13_darwin_arm64.tar.gz"
      sha256 "04758aad6e308cde1df112acfc21c1d877bb0e1d8c167feff3bc747a9d370bc5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.13/af_0.11.13_linux_amd64.tar.gz"
      sha256 "d827832d0eb56b92a4dfacf68e3e26a50164331d14d360fef344d7534840d8aa"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.13/af_0.11.13_linux_arm64.tar.gz"
      sha256 "2e1a736c4828af3fb23022f4731eb43fbf6a6c4b33443d27e43534c3b2a3266d"
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
