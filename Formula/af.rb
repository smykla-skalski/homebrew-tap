# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.10.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.10.3/af_0.10.3_darwin_amd64.tar.gz"
      sha256 "7d05babb2e3dfc79bd756a8102f23058be7646c61f5f735cacd15f6d96ea4d28"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.10.3/af_0.10.3_darwin_arm64.tar.gz"
      sha256 "8cb82748e468cbb403ec63433477ca0518453e6c391d229461aee24700b1558a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.10.3/af_0.10.3_linux_amd64.tar.gz"
      sha256 "79d40fd3d06dc09332a29ae680d5a3f72b3bb18b9d3e643511338f1d56adb54b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.10.3/af_0.10.3_linux_arm64.tar.gz"
      sha256 "ae48460a60b194e4b044b6044e765c7ae2d4ccdb7553bc2ab28afc3713421b0a"
    end
  end

  def install
    bin.install "af"
    generate_completions_from_executable(bin / "af", "completions")
    man1.install "af.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/af --version")
  end
end
