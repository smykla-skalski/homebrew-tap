# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.81"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.81/af_0.11.81_darwin_amd64.tar.gz"
      sha256 "7f95600d8bac6b5473941fe40ea39f9f232f1af9f13fa8e6102eb5ce58fa1529"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.81/af_0.11.81_darwin_arm64.tar.gz"
      sha256 "417f174170670db2c4f4f3e59fd2fbb493297a4329a21f4032ee8b6badfe77f3"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.81/af_0.11.81_linux_amd64.tar.gz"
      sha256 "5e241b69fda16b8eb69b063e660bac402ddc9657a4ede3b8242e3f429e7975d8"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.81/af_0.11.81_linux_arm64.tar.gz"
      sha256 "731b0fedb96d75ec9d361ac40d15c6378dda0a5fb4057045d3c39ec60d537425"
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
