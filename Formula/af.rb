# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  version "0.11.79"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.79/af_0.11.79_darwin_amd64.tar.gz"
      sha256 "1094d73a6ae780a092710f89450880c7af08ae488f201cadbfdb865ca17bbe9e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.79/af_0.11.79_darwin_arm64.tar.gz"
      sha256 "d1489bee31ba077f773ceea5b8eb248a5ef21d4a98863d02536f96be40331fbd"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.79/af_0.11.79_linux_amd64.tar.gz"
      sha256 "7960334b7fa2e472bb5b5f0f22f78abd5ad8b62c9decca69fa2659cee2a1cfdf"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/smykla-skalski/af/releases/download/v0.11.79/af_0.11.79_linux_arm64.tar.gz"
      sha256 "41d5163d78420e1d66d156bf7231812ec4f13afeda9f417d2481548910179896"
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
