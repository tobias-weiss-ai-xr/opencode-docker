#!/bin/bash
# Start OpenCode using custom Alpine image

# Create required directories
mkdir -p "$HOME/.config/opencode" \
         "$HOME/.local/share/opencode" \
         "$HOME/.local/state/opencode"

# Make directories writable by container user (UID 1001)
# Using chmod 777 as fallback if chown fails
chmod -R 777 "$HOME/.config/opencode" \
             "$HOME/.local/share/opencode" \
             "$HOME/.local/state/opencode" 2>/dev/null || true

docker run --rm -it \
  -v "$HOME/.config/opencode:/home/op/.config/opencode" \
  -v "$HOME/.local/share/opencode:/home/op/.local/share/opencode" \
  -v "$HOME/.local/state/opencode:/home/op/.local/state/opencode" \
  -v "${PWD}:/workspace" \
  -w /workspace \
  opencode-ai:latest \
  opencode "$@"