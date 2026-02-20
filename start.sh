#!/bin/bash
# Start OpenCode using official image

docker run --rm -ti \
  -v "$HOME/.config/opencode:/home/op/.config/opencode" \
  -v "$HOME/.local/share/opencode:/home/op/.local/share/opencode" \
  -v "$HOME/.local/state:/home/op/.local/state" \
  -v "${PWD}:/workspace" \
  -w /workspace \
  -e PATH="/home/op/.opencode/bin:$PATH" \
  ghcr.io/anomalyco/opencode:latest \
  opencode /workspace