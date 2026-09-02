# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.173"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.173/af_0.11.173_darwin_amd64.tar.gz"
      sha256 "a84f6c0d4c88c1271d27a198d5eb47b264d2aaec60ed32494872e5d2e58722d2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.173/af_0.11.173_darwin_arm64.tar.gz"
      sha256 "8737a4e187d076885388010a7c8512b7f7bd6df65794a1cbdde5edce9491407a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.173/af_0.11.173_linux_amd64.tar.gz"
      sha256 "3870fc1b7d576243f54db1056d6ea3cf705d0168fe399ab105468a1fd96c0324"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.173/af_0.11.173_linux_arm64.tar.gz"
      sha256 "1032288eb7369fdd4cec277add37994ff191ece7a61e8d53d5b7d3f9943df170"
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
