# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.165"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.165/af_0.11.165_darwin_amd64.tar.gz"
      sha256 "69879369a9401e1d415b158986a5165ba3ae4ae33001b74d459f7b38ba7362ee"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.165/af_0.11.165_darwin_arm64.tar.gz"
      sha256 "4d5b545551f9b6ae6306aae4334dc3cbd92b746f844f0c728cd289ac2128c82a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.165/af_0.11.165_linux_amd64.tar.gz"
      sha256 "ab2b121ad08c03bdb8c4081ed894bbd6c2cecf0f076f4dacdbea7968fffcf072"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.165/af_0.11.165_linux_arm64.tar.gz"
      sha256 "99edd5c761f4815f4fac864232741f4ee92430819a51463d2a1dde3880c5fcf5"
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
