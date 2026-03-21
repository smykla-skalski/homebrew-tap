# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.8/af_0.11.8_darwin_amd64.tar.gz"
      sha256 "ea02712c771685de64466c48b18f6d56434cd6d52605d79f0efac7812962ae31"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.8/af_0.11.8_darwin_arm64.tar.gz"
      sha256 "0266743ce8d9423949f740ec5603b0f3e4314da1818f53d9bd6bf63c95e5b228"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.8/af_0.11.8_linux_amd64.tar.gz"
      sha256 "c12c759a69eddbbfd8ea8757a4404f3ab68f7616d7b93f232ba44de3fbe4bb65"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.8/af_0.11.8_linux_arm64.tar.gz"
      sha256 "ef21f4037665a2edc6bc445bb0f220cd16f856d3ca96f37caf19bb6e08a19b22"
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
