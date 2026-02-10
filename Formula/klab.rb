# typed: false
# frozen_string_literal: true

require_relative "../custom_download_strategy"

# Homebrew formula for klab - Kubernetes networking troubleshooting lab framework
class Klab < Formula
  desc "Kubernetes networking troubleshooting lab framework"
  homepage "https://github.com/smykla-skalski/klab"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smykla-skalski/klab/releases/download/v0.2.0/klab-darwin-arm64.tar.gz",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "a116b493c36980197028aef73200c0b0e2d29fafef60fc416d6d47fb66b028e7"
    end
  end

  # Private repository - requires GitHub authentication
  # Set HOMEBREW_GITHUB_API_TOKEN environment variable with a GitHub token
  # that has 'repo' scope access to smykla-skalski/klab

  def install
    if Hardware::CPU.arm?
      # Tarball extracts to klab/ directory containing the binary and dependencies
      libexec.install Dir["klab/*"]
      bin.install_symlink libexec/"klab"
    else
      odie "klab only supports Apple Silicon (arm64) on macOS"
    end
  end

  test do
    system bin/"klab", "version"
  end
end
