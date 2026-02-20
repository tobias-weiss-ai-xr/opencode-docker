#!/bin/bash
# Start OpenCode using official image

# Run opencode - it will use the current working directory (/workspace)
# The -c flag continues the last session; omit it to start fresh if needed
docker run --rm -it \
  -v "$HOME/.config/opencode:/home/op/.config/opencode" \
  -v "$HOME/.local/share/opencode:/home/op/.local/share/opencode" \
  -v "$HOME/.local/state:/home/op/.local/state" \
  -v "${PWD}:/workspace" \
  -w /workspace \
  -e PATH="/home/op/.opencode/bin:$PATH" \
  ghcr.io/anomalyco/opencode:latest \
  opencode "$@"