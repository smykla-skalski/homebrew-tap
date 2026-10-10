# Homebrew Tap

Official Homebrew tap for smykla-skalski projects.

## Available Formulas

This tap contains Homebrew formulas for various open-source projects:

- **[klab](https://github.com/smykla-skalski/klab)** - Kubernetes networking troubleshooting lab framework
  - Status: Active
  - Repository: Private
  - Update method: GitHub Actions workflow

- **[klaudiush](https://github.com/smykla-skalski/klaudiush)** - Claude Code hooks validator
  - Status: Active
  - Repository: Public
  - Update method: GoReleaser

- **[af](https://github.com/smykla-skalski/af)** - CLI helpers for project cloning, dotfiles, shortcuts, and browser workflows
  - Status: Active
  - Repository: Public
  - Update method: GitHub Actions workflow

- **[reef](https://github.com/smykla-skalski/reef)** - Resource observation and scheduling for coding agents
  - Status: Active
  - Repository: Public
  - Update method: GitHub Actions opens a formula PR after each release

## Installation

### From This Tap

```bash
# Install a formula from this tap
brew install smykla-skalski/tap/<formula-name>

# Examples:
brew install smykla-skalski/tap/af
brew install smykla-skalski/tap/klab
brew install smykla-skalski/tap/klaudiush
brew install smykla-skalski/tap/reef
```

### Special Requirements

Some formulas may have special requirements:

**klab (private repository)**

- Requires GitHub authentication token for access
- Set token before installation:

```bash
export HOMEBREW_GITHUB_API_TOKEN=$(gh auth token)
brew install smykla-skalski/tap/klab
```

## Usage

After installation, verify the formula works:

```bash
# af
af --version

# klab
klab version

# klaudiush
klaudiush --version

# reef
reef --version
```

## Updating

```bash
# Update Homebrew and all taps
brew update

# Upgrade a specific formula
brew upgrade <formula-name>

# Examples:
brew upgrade af
brew upgrade klab
brew upgrade klaudiush
brew upgrade reef
```

## Uninstalling

```bash
brew uninstall <formula-name>

# Examples:
brew uninstall af
brew uninstall klab
brew uninstall klaudiush
brew uninstall reef
```

## Automated Updates

Some formulas in this tap are automatically updated when new releases are published:

- **GitHub Actions triggered**: For repositories using custom release workflows
- **GoReleaser**: For projects using GoReleaser for automated releases

Reef publishes a `reef-release` event after its release assets are available. A daily tap check catches a missed event. The tap downloads the archives, verifies `SHA256SUMS`, audits and installs the updated formula, then opens a signed formula PR for review. The workflow can also be started manually with a published version. A release is available through Homebrew after that PR merges and users run `brew update` and `brew upgrade reef`.

## Troubleshooting

### Formula not found

```bash
# Ensure the tap is properly installed
brew tap smykla-skalski/tap

# List all available formulas
brew search smykla-skalski/tap
```

### Installation failures

```bash
# Check for specific formula issues
brew doctor

# Get detailed error information
brew install -v <formula-name>
```

## Issues and Support

For issues with specific projects:

- **klab**: [smykla-skalski/klab/issues](https://github.com/smykla-skalski/klab/issues)
- **klaudiush**: [smykla-skalski/klaudiush/issues](https://github.com/smykla-skalski/klaudiush/issues)
- **af**: [smykla-skalski/af/issues](https://github.com/smykla-skalski/af/issues)

For tap-related issues or to report formula problems: [Create an issue in this repository](https://github.com/smykla-skalski/homebrew-tap/issues)

## Contributing

Contributions to improve formulas or add new projects to this tap are welcome!

## License

MIT
