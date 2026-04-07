# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.25/af_0.11.25_darwin_amd64.tar.gz"
      sha256 "3b27c4bed4bdbff3af921dbb550f62c548077efecb0b82a0baaec63eedad8256"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.25/af_0.11.25_darwin_arm64.tar.gz"
      sha256 "f1b08f012a3b463dca3d465b01a62ce987d833104ca2156e0d7bb7c289a89abf"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.25/af_0.11.25_linux_amd64.tar.gz"
      sha256 "d385770626ed5ea5caae11640776eb1523bc31bf5c0212fc8995f20c175a1af9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.25/af_0.11.25_linux_arm64.tar.gz"
      sha256 "5ffb73ae6f2fc9af98ca7cfbc7084145ade0613cf57606697a807fa15cc42470"
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
