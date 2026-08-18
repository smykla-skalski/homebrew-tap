# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.158"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.158/af_0.11.158_darwin_amd64.tar.gz"
      sha256 "c130ac23e9144041f8960d09e43dc776702405d8677316809daf6c8373e46a31"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.158/af_0.11.158_darwin_arm64.tar.gz"
      sha256 "894f0b2c2a37092504430907909f6e0530041f4228585ce2063329c9093399d7"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.158/af_0.11.158_linux_amd64.tar.gz"
      sha256 "21544c6692a338b95a8e23e47d6343ad084a708486cb67981458220c9882e433"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.158/af_0.11.158_linux_arm64.tar.gz"
      sha256 "422edef03254e38d92313aee51fdb5ff8e812fb02b5cbee0fb6ec57e53ac9f5f"
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
