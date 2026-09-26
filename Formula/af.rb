# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.177/af_0.11.177_darwin_amd64.tar.gz"
      sha256 "e65f389818ffee56dceeddaab942f5bd2329b77d992c41eb181ec071b4e251a2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.177/af_0.11.177_darwin_arm64.tar.gz"
      sha256 "9ac0dee586460bcc01b9a17aadc4b5fe54b4c30e263ec022f79405c99a7103d9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.177/af_0.11.177_linux_amd64.tar.gz"
      sha256 "a8cf64e585df0bf75f2d4b522f9d9248fd0f9dede6707cda76e7cb022d269228"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.177/af_0.11.177_linux_arm64.tar.gz"
      sha256 "b04c96a2204c65d84adbb688eb67fc5d8926855fb23e33f6884304a23d1e099f"
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
