# MMCP Homebrew Tap

Official Homebrew tap for installing the Mambu MCP server.

## Prerequisites

### Supported Platforms

- macOS with Apple Silicon (ARM64)
- Linux AMD64
- Linux ARM64

## Installation

### 1. Tap the Repository
```bash
brew tap mambu-gmbh/mmcp-brew
```

### 2. Install MMCP

```bash
brew install mmcp
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

## Troubleshooting

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

## License

This Homebrew tap is maintained by Mambu Tech B.V..
