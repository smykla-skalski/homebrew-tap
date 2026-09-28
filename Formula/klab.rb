# typed: false
# frozen_string_literal: true

require_relative "../custom_download_strategy"

# Homebrew formula for klab - Kubernetes networking troubleshooting lab framework
class Klab < Formula
  desc "Kubernetes networking troubleshooting lab framework"
  homepage "https://github.com/smykla-skalski/klab"
  url "https://github.com/smykla-skalski/klab/releases/download/v0.2.2/klab-darwin-arm64.tar.gz",
      using: GitHubPrivateRepositoryReleaseDownloadStrategy
  version "0.2.2"
  sha256 "afdd8cbd6d3f26760c76dcda7b8749710c85dbba784a38431ff210265cc79f6a"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  # Private repository - requires GitHub authentication
  # Set HOMEBREW_GITHUB_API_TOKEN environment variable with a GitHub token
  # that has 'repo' scope access to smykla-skalski/klab

  def install
    bin.install "klab"
  end

  test do
    system bin/"klab", "version"
  end
end
