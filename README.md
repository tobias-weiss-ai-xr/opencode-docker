# OpenCode Dockerized

A lightweight Docker environment for [OpenCode](https://opencode.ai) using the official Alpine-based image (~160MB).

## Features

- **Official Image**: Uses `ghcr.io/anomalyco/opencode:latest` - no custom build required
- **Isolated Environment**: Runs OpenCode in a container with Alpine Linux
- **Persistent Configurations**: Mounts host directories to retain settings and data
- **Workspace Access**: Mounts current directory to `/workspace` inside the container
- **Multiple Modes**: TUI, web interface, and headless server

## Prerequisites

- [Docker](https://www.docker.com/) installed on your system

## Quick Start

### Windows (PowerShell)

```powershell
# Pull the official image
.\build-compose.ps1

# Run OpenCode TUI
.\start-compose.ps1

# Or run with a one-shot message
.\run.ps1 "Fix the bug in auth.ts"

# Start web interface (http://localhost:3000)
.\start-web.ps1

# Start headless server
.\start-serve.ps1

# Run tests
.\test.ps1

# Cleanup containers
.\cleanup.ps1
```

### Linux/macOS (Bash)

```bash
# Pull the official image
chmod +x build.sh && ./build.sh

# Run OpenCode TUI
chmod +x start.sh && ./start.sh
```

## Docker Compose Modes

| Mode | Command | Description |
|------|---------|-------------|
| TUI | `docker compose run --rm opencode` | Interactive terminal |
| Web | `docker compose -f docker-compose.yml -f docker-compose.web.yml up` | Web UI on port 3000 |
| Serve | `docker compose -f docker-compose.yml -f docker-compose.serve.yml up` | Headless server on port 3000 |

## Volume Mounts

All configurations mount:

| Host Path | Container Path | Purpose |
|-----------|----------------|---------|
| `$HOME/.config/opencode` | `/home/op/.config/opencode` | Configuration files |
| `$HOME/.local/share/opencode` | `/home/op/.local/share/opencode` | Data storage |
| `$HOME/.local/state` | `/home/op/.local/state` | State files |
| `.` (current directory) | `/workspace` | Your project |

## Files

```
opencode-docker/
├── docker-compose.yml        # Base configuration (TUI mode)
├── docker-compose.web.yml    # Web interface overlay
├── docker-compose.serve.yml  # Headless server overlay
├── build.sh / build-compose.ps1   # Pull official image
├── start.sh / start-compose.ps1   # Start TUI
├── start-web.ps1             # Start web interface
├── start-serve.ps1           # Start headless server
├── run.ps1                   # One-shot execution
├── cleanup.ps1               # Stop and cleanup
└── test.ps1                  # Test suite
```

## Customization

### Add Environment Variables

Edit `docker-compose.yml` to add environment variables:

```yaml
services:
  opencode:
    environment:
      - MY_VAR=value
```

### Add Additional Volumes

```yaml
services:
  opencode:
    volumes:
      - /path/on/host:/path/in/container
```

## License

MIT License - see [LICENSE](LICENSE) file.