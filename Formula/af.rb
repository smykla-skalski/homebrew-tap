# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.176"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.176/af_0.11.176_darwin_amd64.tar.gz"
      sha256 "5340a9d77f1e1c0a643d8ab21d588f61ed81af0065239c4858346fb4e11f09f8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.176/af_0.11.176_darwin_arm64.tar.gz"
      sha256 "52fafd26da0be9006245eed866487b4a4509d4a6723a4b5f0cf8b90a11693b94"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.176/af_0.11.176_linux_amd64.tar.gz"
      sha256 "1c298dfbf9a3e51b875277174cd5bf5ad3fabfef09d09b42a367f0d7ffe759d0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.176/af_0.11.176_linux_arm64.tar.gz"
      sha256 "8db06f20610eecc3f9c4397d9005110c2e088bad995c6075eca47ab6fb3c37fa"
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
