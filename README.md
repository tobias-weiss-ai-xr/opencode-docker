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

### 1. Build the Docker Image
Run the `build.sh` script to build the Docker image:
```bash
chmod +x build.sh
./build.sh
```
This creates an image tagged as `opencode-ai:latest`.

### 2. Start OpenCode
Run the `start.sh` script to start the OpenCode CLI inside the container:
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

### Adjust Mounted Directories
Modify the `start.sh` script to mount additional directories or environment variables.

## License
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

## Contributing
Contributions are welcome! Open an issue or submit a pull request.

## Support
For issues or questions, visit the [OpenCode documentation](https://opencode.ai) or open an issue in this repository.