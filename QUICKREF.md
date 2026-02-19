# Quick Reference

## PowerShell Scripts (Windows/WSL)

### Essential Commands

```powershell
# Build the image
.\build-compose.ps1

# Run OpenCode TUI
.\start-compose.ps1

# Run with one message
.\run.ps1 "fix the bug in auth.ts"

# Start web interface
.\start-web.ps1

# Start headless server
.\start-serve.ps1

# Run tests
.\test.ps1

# Cleanup
.\cleanup.ps1
```

## Docker Compose Files

- `docker-compose.yml` - TUI mode (default)
- `docker-compose.web.yml` - Web interface with port 3000
- `docker-compose.serve.yml` - Headless server with port 3000

## Direct Docker Compose Usage

```powershell
# Build
docker compose build

# Run TUI
docker compose run --rm opencode

# Run web
docker compose -f docker-compose.web.yml up

# Run headless server
docker compose -f docker-compose.serve.yml up

# Stop services
docker compose down
```

## Volume Mounts

All compose configurations mount:
- `$HOME/.config/opencode` → `/home/op/.config/opencode`
- `$HOME/.local/share/opencode` → `/home/op/.local/share/opencode`
- `$HOME/.local/state` → `/home/op/.local/state`
- Current directory → `/workspace`