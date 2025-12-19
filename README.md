# Mambu MCP Server

A [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) server implementation for the [Mambu Banking Platform](https://mambu.com/). This server enables AI agents and agentic applications to securely interact with the Mambu V2 API, allowing them to discover and execute banking operations programmatically.

## Overview

The Mambu MCP Server acts as a bridge between AI systems and Mambu's banking APIs. It provides:

*   **Dynamic API Catalog**: Automatically loads Mambu V2 API operations from OpenAPI specifications
*   **AI-Native Tools**: Exposes banking operations as MCP tools that AI agents can discover and use
*   **Secure Authentication**: Built-in support for Mambu API authentication
*   **Configurable Access**: Fine-grained control over which operations are available to AI agents


## Installation

Connect to the Repository and Install MMCP

```bash
brew tap mambu-gmbh/mmcp-brew
brew install mmcp
```

You can make sure you are on the latest version by running:

```bash
brew update
brew upgrade mmcp
```


## Quick Start

### 1. Configure Your Mambu Credentials

The MCP server requires three environment variables to connect to your Mambu instance:

*   `MAMBU_BASE_URL`: Your Mambu API endpoint (e.g., `https://your-tenant.mambu.com/api`)
*   `MAMBU_AUTH_USERNAME`: Your Mambu API username
*   `MAMBU_AUTH_PASSWORD`: Your Mambu API password

These are configured in your MCP client (see next section).

### 2. Configure Your MCP Client

Most agentic applications and AI tools support MCP through a configuration file. Below are examples for common platforms.

#### Claude Desktop

Edit your Claude Desktop configuration file:

*   **macOS**: `~/Library/Application Support/Claude/claude_desktop_config.json`
*   **Windows**: `%APPDATA%\Claude\claude_desktop_config.json`
*   **Linux**: `~/.config/Claude/claude_desktop_config.json`

Add the Mambu MCP server configuration:

```json
{
  "mcpServers": {
    "mambu": {
      "command": "mmcp",
      "args": [],
      "env": {
        "MAMBU_BASE_URL": "https://your-tenant.mambu.com/api",
        "MAMBU_AUTH_USERNAME": "your.username",
        "MAMBU_AUTH_PASSWORD": "your-password"
      }
    }
  }
}
```

**Windows users**: If `mmcp` is not in your PATH, use the full path:
```json
"command": "C:\\Program Files\\mmcp\\mmcp.exe"
```

#### Cline (VS Code Extension)

In VS Code, open Cline settings and add to your MCP servers configuration:

```json
{
  "mambu": {
    "command": "mmcp",
    "env": {
      "MAMBU_BASE_URL": "https://your-tenant.mambu.com/api",
      "MAMBU_AUTH_USERNAME": "your.username",
      "MAMBU_AUTH_PASSWORD": "your-password"
    }
  }
}
```

#### Other MCP Clients

For other MCP-compatible tools, use this general pattern:

```json
{
  "servers": {
    "mambu": {
      "command": "mmcp",
      "args": [],
      "env": {
        "MAMBU_BASE_URL": "https://your-tenant.mambu.com/api",
        "MAMBU_AUTH_USERNAME": "your.username",
        "MAMBU_AUTH_PASSWORD": "your-password"
      }
    }
  }
}
```

### 3. Restart Your MCP Client

After configuring, restart your MCP client application. The Mambu MCP server will start automatically when needed.

### 4. Verify Connection

Ask your AI agent to list available Mambu tools or try a simple operation:

```
"What Mambu operations are available?"
"Get client information for client ID 12345"
```

## Available Tools

The server exposes MCP tools that your AI agent can use to interact with Mambu:

### `describeOperation`

Returns detailed schema and parameter information for a specific Mambu API operation.

*   **Input**: `label` (string) - The operation identifier (e.g., `clients_v2.get_client`)
*   **Output**: JSON object with operation details including parameters, method, path, and description

### `invoke`

Executes a Mambu API operation.

*   **Input**:
   *   `label` (string) - The operation to execute
   *   `params` (object) - Parameters required by the operation
*   **Output**: JSON response containing:
   *   `statusCode` - HTTP status code (e.g., 200)
   *   `body` - The response data from Mambu

## Security Considerations

### Credential Storage

Your Mambu credentials are stored in your MCP client's configuration file. Protect this file:

**macOS/Linux**:
```bash
chmod 600 ~/Library/Application\ Support/Claude/claude_desktop_config.json
```

**Windows PowerShell**:
```powershell
icacls "$env:APPDATA\Claude\claude_desktop_config.json" /inheritance:r /grant:r "$env:USERNAME:F"
```

### Alternative: Environment Variables

For better security, you can use a wrapper script that loads credentials from a secure location:

**macOS/Linux** (`launch-mmcp.sh`):
```bash
#!/bin/bash
source ~/.mambu_credentials  # Contains your env vars
mmcp
```

**Windows** (`launch-mmcp.bat`):
```batch
@echo off
call %USERPROFILE%\.mambu_credentials.bat
mmcp.exe
```

Then reference the script in your MCP configuration:
```json
{
  "command": "/path/to/launch-mmcp.sh"
}
```

### API Operation Control

By default, the server enables read-only operations (GET requests) and disables mutating operations (POST, PUT, DELETE) for safety. Administrators can customize which operations are available by modifying the server's configuration (see Developer Guide below).

## Troubleshooting

### Server Won't Start

*   Verify `mmcp` is in your PATH or use the full path to the executable
*   Check that all three environment variables are set in your MCP client configuration
*   Ensure your Mambu credentials are correct

### Authentication Errors

*   Verify your `MAMBU_BASE_URL` includes `/api` at the end
*   Check that your username and password are correct
*   Ensure your Mambu user has API access permissions

### Connection Issues

*   Verify network connectivity to your Mambu instance
*   Check if your Mambu instance requires VPN or IP whitelisting
*   Review your MCP client logs for detailed error messages

### Getting Help

*   Check the [GitHub Issues](https://github.com/mambu/mmcp-server/issues) for known problems
*   Review MCP client documentation for client-specific configuration
*   Enable debug logging (see Developer Guide)



## Uninstallation MMCP

To remove MMCP:

```bash
brew uninstall mmcp
brew untap mambu-gmbh/mmcp-brew
```

## License

This Homebrew tap is maintained by Mambu Tech B.V..
