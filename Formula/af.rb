# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.139"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.139/af_0.11.139_darwin_amd64.tar.gz"
      sha256 "903bd50f9e8760e00795808546cf742f0d5512716ecf044b09d3b59df0c7cf45"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.139/af_0.11.139_darwin_arm64.tar.gz"
      sha256 "ac25655423f44bbfca47ef38b3bbb318d55bf6e3eb7441ddaf088ab5870a2046"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.139/af_0.11.139_linux_amd64.tar.gz"
      sha256 "b69b584092cf2312ac11ce833544bc1ce4464bd207cae370c3c04f4aae38bae1"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.139/af_0.11.139_linux_arm64.tar.gz"
      sha256 "0935eceee7c4c07ac41881be589f0a46c665137a5d59ec4e846e6ffe3940ac38"
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
