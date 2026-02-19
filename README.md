# OpenCode Dockerized

This repository provides a **Dockerized environment** for [OpenCode](https://opencode.ai), an AI-powered coding assistant. Use this to run OpenCode in an isolated container with persistent configurations and easy access to your local workspace.

## Features
- **Isolated Environment**: Runs OpenCode in a Docker container with Ubuntu 24.04.
- **Persistent Configurations**: Mounts host directories to retain OpenCode settings and data.
- **Workspace Access**: Mounts the current directory to `/workspace` inside the container for seamless file access.
- **Non-Root User**: Runs as a non-root user with UID matching the host for consistent file permissions.

## Prerequisites
- [Docker](https://www.docker.com/) installed on your system.
- A working internet connection to download the OpenCode installer.

## Usage

### Option A: Using Docker Compose (Recommended for PowerShell/Windows)

#### 1. Build the Docker Image
```powershell
.\build-compose.ps1
```
This creates an image tagged as `opencode-ai:latest`.

#### 2. Start OpenCode

**Run OpenCode TUI:**
```powershell
.\start-compose.ps1
```

**Run with a specific message (one-shot):**
```powershell
.\run.ps1 "Fix the bug in auth.ts"
```

**Start web interface:**
```powershell
.\start-web.ps1
```
Opens at http://localhost:3000

**Start headless server:**
```powershell
.\start-serve.ps1
```
Runs server at http://localhost:3000

#### 3. Test Your Setup
```powershell
.\test.ps1
```

#### 4. Cleanup
```powershell
.\cleanup.ps1
```

### Option B: Using Traditional Scripts (Linux/macOS)

#### 1. Build the Docker Image
```bash
chmod +x build.sh
./build.sh
```
This creates an image tagged as `opencode-ai:latest`.

#### 2. Start OpenCode
```bash
chmod +x start.sh
./start.sh
```

### 3. Access Your Workspace
- The current directory on your host is mounted to `/workspace` inside the container.
- OpenCode will have access to all files in this directory.
- Configurations and data are persisted in `~/.config/opencode` and `~/.local/share/opencode`.

## Customization
### Change the Base Image
Edit the `Dockerfile` to use a different base image (e.g., `debian` or `alpine`).

### Docker Compose Modes
The project includes multiple compose files for different use cases:

- `docker-compose.yml` - Default TUI mode
- `docker-compose.web.yml` - Web interface (port 3000)
- `docker-compose.serve.yml` - Headless server (port 3000)

### Adjust Mounted Directories
Edit `docker-compose.yml` or the `.ps1` scripts to add more volumes or environment variables.

## License
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

## Contributing
Contributions are welcome! Open an issue or submit a pull request.

## Support
For issues or questions, visit the [OpenCode documentation](https://opencode.ai) or open an issue in this repository.