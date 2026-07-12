# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.121"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.121/af_0.11.121_darwin_amd64.tar.gz"
      sha256 "261e6a7e4d6610ffe57aa006ce43af73f97b02789670ec989342e99ac8e07620"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.121/af_0.11.121_darwin_arm64.tar.gz"
      sha256 "676265821300a7e2f939eb96a3722974c41104e089c249d8216323714bdd55d9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.121/af_0.11.121_linux_amd64.tar.gz"
      sha256 "4bd5d1a88676739dc8222183db1409c56d8eb76e7ae69cf7a4ecef4ddaf922b4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.121/af_0.11.121_linux_arm64.tar.gz"
      sha256 "42415589bb6207f219e2541b5c9af0758258d36a8663c746692880f10f7d3de4"
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
