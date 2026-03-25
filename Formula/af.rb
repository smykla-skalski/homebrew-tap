# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.12/af_0.11.12_darwin_amd64.tar.gz"
      sha256 "b993bc3b683441b48129a972050b5dd82bdefc43508576aea670261b03bcedbd"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.12/af_0.11.12_darwin_arm64.tar.gz"
      sha256 "5a278362525bc23172c62017a784925967b9423fb1a28514b73b427c28c0dbf4"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.12/af_0.11.12_linux_amd64.tar.gz"
      sha256 "599181408dc9e5b215e34e24c69fa9017757d52d6148fca0d195d8079fa36a5a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.12/af_0.11.12_linux_arm64.tar.gz"
      sha256 "06929cf6382fb7e7b5d7c6276c77b4de16dfaac7234818fd93ac75fb7c0ce2cc"
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
