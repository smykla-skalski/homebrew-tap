# typed: false
# frozen_string_literal: true

class Af < Formula
  desc "Afrael's CLI tool"
  homepage "https://github.com/smykla-skalski/af"
  url "https://github.com/smykla-skalski/af/archive/refs/tags/v0.8.109.tar.gz"
  sha256 "9bb41719943f8c8c9f539573c49b196c8c6b77a078599a71700260fd2db39801"
  license "MIT"

  depends_on "rust" => :build
  depends_on "openssl"
  depends_on "zlib"

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin / "af", "completions")
    system "cargo", "genman"
    man1.install Dir["docs/man/man1/*.1"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/af --version")
  end
end
