# MMCP Homebrew Tap

Official Homebrew tap for installing the MMCP (Mambu Multi-Cloud Platform) CLI tool.

## Prerequisites

### Authentication

Since this tap is currently private, you need a GitHub Personal Access Token with appropriate permissions:

1. Create a token at https://github.com/settings/tokens
2. Grant `repo` scope (required for accessing private repositories)
3. Export it in your shell:
   ```bash
   export HOMEBREW_GITHUB_API_TOKEN=your_token_here
   ```
4. Add the export command to your `~/.zshrc` or `~/.bash_profile` to make it permanent

**Note:** Once this repository becomes public, the token will only be needed if the releases in the `mmcp` repository are still private.

### Supported Platforms

- macOS with Apple Silicon (ARM64)
- Linux AMD64
- Linux ARM64

## Installation

### 1. Tap the Repository

For private repository access:
```bash
brew tap mambu-gmbh/mmcp-brew https://github.com/mambu-gmbh/mmcp-brew
```

Once the repository is public, you can use the shorter form:
```bash
brew tap mambu-gmbh/mmcp-brew
```

### 2. Install MMCP

```bash
brew install mmcp
```

### 3. Verify Installation

```bash
mmcp --version
```

## Updating

To update MMCP to the latest version:

```bash
brew update
brew upgrade mmcp
```

## Uninstallation

To remove MMCP:

```bash
brew uninstall mmcp
```

To remove the tap:

```bash
brew untap mambu-gmbh/mmcp-brew
```

## Platform-Specific Notes

### macOS

The formula automatically removes the quarantine attribute from the binary to prevent "unidentified developer" warnings. This is equivalent to running:
```bash
xattr -d com.apple.quarantine /path/to/mmcp
```

### Linux

No special configuration required. The binary should work out of the box on both AMD64 and ARM64 architectures.

## Troubleshooting

### Authentication Issues

If you encounter authentication errors:
- Verify your `HOMEBREW_GITHUB_API_TOKEN` is set correctly
- Ensure your token has the `repo` scope
- Check that your token hasn't expired

### Installation Fails

If installation fails:
```bash
brew install mmcp --verbose --debug
```

This will provide detailed output to help diagnose the issue.

### Formula Issues

To audit the formula for potential issues:
```bash
brew audit --strict mmcp
```

## For Maintainers

See [RELEASE_PROCESS.md](RELEASE_PROCESS.md) for instructions on updating the formula for new releases.

## License

This Homebrew tap is maintained by Mambu Tech B.V..
