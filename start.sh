#!/bin/bash
# Start OpenCode using custom Alpine image

docker run --rm -it \
  -v "$HOME/.config/opencode:/home/op/.config/opencode" \
  -v "$HOME/.local/share/opencode:/home/op/.local/share/opencode" \
  -v "$HOME/.local/state:/home/op/.local/state" \
  -v "${PWD}:/workspace" \
  -w /workspace \
  opencode-ai:latest \
  opencode "$@"