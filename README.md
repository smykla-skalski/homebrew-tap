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

## Installation

### From This Tap

```bash
# Install a formula from this tap
brew install smykla-skalski/tap/<formula-name>

# Examples:
brew install smykla-skalski/tap/klab
brew install smykla-skalski/tap/klaudiush
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
# klab
klab version

# klaudiush
klaudiush --version
```

## Updating

```bash
# Update Homebrew and all taps
brew update

# Upgrade a specific formula
brew upgrade <formula-name>

# Examples:
brew upgrade klab
brew upgrade klaudiush
```

## Uninstalling

```bash
brew uninstall <formula-name>

# Examples:
brew uninstall klab
brew uninstall klaudiush
```

## Automated Updates

Formulas in this tap are automatically updated when new releases are published:

- **GitHub Actions triggered**: For repositories using custom release workflows
- **GoReleaser**: For projects using GoReleaser for automated releases

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

For tap-related issues or to report formula problems: [Create an issue in this repository](https://github.com/smykla-skalski/homebrew-tap/issues)

## Contributing

Contributions to improve formulas or add new projects to this tap are welcome!

## License

MIT
