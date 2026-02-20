#!/bin/bash
# Start OpenCode using custom Alpine image

# Create required directories with proper permissions for UID 1001
mkdir -p "$HOME/.config/opencode" \
         "$HOME/.local/share/opencode" \
         "$HOME/.local/state/opencode"

# Set ownership to UID 1001 (container user) if possible
if [ "$(id -u)" = "0" ] || [ "$(id -u)" = "1001" ]; then
    chown -R 1001:1001 "$HOME/.config/opencode" \
                       "$HOME/.local/share/opencode" \
                       "$HOME/.local/state/opencode" 2>/dev/null || true
fi

docker run --rm -it \
  -v "$HOME/.config/opencode:/home/op/.config/opencode" \
  -v "$HOME/.local/share/opencode:/home/op/.local/share/opencode" \
  -v "$HOME/.local/state/opencode:/home/op/.local/state/opencode" \
  -v "${PWD}:/workspace" \
  -w /workspace \
  opencode-ai:latest \
  opencode "$@"