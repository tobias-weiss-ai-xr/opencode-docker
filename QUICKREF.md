# Quick Reference

## PowerShell Commands (Windows)

```powershell
# Pull official image
.\build-compose.ps1

# Run OpenCode TUI
.\start-compose.ps1

# One-shot execution
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

## Bash Commands (Linux/macOS)

```bash
# Pull official image
./build.sh

# Run OpenCode TUI
./start.sh
```

## Docker Compose Files

| File | Purpose |
|------|---------|
| `docker-compose.yml` | Base configuration (TUI mode) |
| `docker-compose.web.yml` | Web interface overlay |
| `docker-compose.serve.yml` | Headless server overlay |

## Direct Docker Compose Usage

```powershell
# Pull image
docker pull ghcr.io/anomalyco/opencode:latest

# Run TUI
docker compose run --rm opencode

# Run web interface
docker compose -f docker-compose.yml -f docker-compose.web.yml up

# Run headless server
docker compose -f docker-compose.yml -f docker-compose.serve.yml up

# Stop services
docker compose down
```

## Volume Mounts

| Host | Container |
|------|-----------|
| `$HOME/.config/opencode` | `/home/op/.config/opencode` |
| `$HOME/.local/share/opencode` | `/home/op/.local/share/opencode` |
| `$HOME/.local/state` | `/home/op/.local/state` |
| `.` (current dir) | `/workspace` |

## One-liner (No Scripts)

```bash
docker run --rm -ti \
  -v "$HOME/.config/opencode:/home/op/.config/opencode" \
  -v "$HOME/.local/share/opencode:/home/op/.local/share/opencode" \
  -v "$HOME/.local/state:/home/op/.local/state" \
  -v "${PWD}:/workspace" \
  -w /workspace \
  ghcr.io/anomalyco/opencode:latest \
  opencode
```