# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.97"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.97/af_0.11.97_darwin_amd64.tar.gz"
      sha256 "6423c471abecc9f0779a269c52df0d52cbf0de86a80fbd0d751be327077c5008"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.97/af_0.11.97_darwin_arm64.tar.gz"
      sha256 "393b29b27c7062f68454e17d99c0e79a267c3866917427988ff25b9bbed0c5a5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.97/af_0.11.97_linux_amd64.tar.gz"
      sha256 "9cac80ae41bd455f0933d2313128de7b567406aeba7e9d20fb434628a1095dfa"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.97/af_0.11.97_linux_arm64.tar.gz"
      sha256 "ef92426947afde7e9b838338991642b3e0dfe908d0c8c4dc2698bd9799d8484d"
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
