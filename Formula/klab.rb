# typed: false
# frozen_string_literal: true

require_relative "../custom_download_strategy"

# Homebrew formula for klab - Kubernetes networking troubleshooting lab framework
class Klab < Formula
  desc "Kubernetes networking troubleshooting lab framework"
  homepage "https://github.com/smykla-skalski/klab"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smykla-skalski/klab/releases/download/v0.1.0/klab-darwin-arm64",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "075f7af07a5e6682783aad672f61e24bf6ed8f7a1a51de1578dbac907f70120e"
    end
  end

  # Private repository - requires GitHub authentication
  # Set HOMEBREW_GITHUB_API_TOKEN environment variable with a GitHub token
  # that has 'repo' scope access to smykla-skalski/klab

  def install
    if Hardware::CPU.arm?
      bin.install "klab-darwin-arm64" => "klab"
    else
      odie "klab only supports Apple Silicon (arm64) on macOS"
    end
  end

  test do
    system bin/"klab", "version"
  end
end
