#!/bin/bash
# Start OpenCode using custom Alpine image

# Create required directories
mkdir -p "$HOME/.config/opencode" \
         "$HOME/.local/share/opencode" \
         "$HOME/.local/state/opencode"

# Make directories writable by container user (UID 1001)
chmod -R 777 "$HOME/.config/opencode" \
             "$HOME/.local/share/opencode" \
             "$HOME/.local/state/opencode" 2>/dev/null || true

# Get terminal size
TERM_SIZE=$(stty size 2>/dev/null || echo "24 80")
TERM_ROWS=$(echo $TERM_SIZE | cut -d' ' -f1)
TERM_COLS=$(echo $TERM_SIZE | cut -d' ' -f2)

# Use xterm-256color for better TUI compatibility
: "${TERM:=xterm-256color}"

docker run --rm -it \
  --init \
  -e TERM="$TERM" \
  -e COLORTERM=truecolor \
  -e LINES=$TERM_ROWS \
  -e COLUMNS=$TERM_COLS \
  -v "$HOME/.config/opencode:/home/op/.config/opencode" \
  -v "$HOME/.local/share/opencode:/home/op/.local/share/opencode" \
  -v "$HOME/.local/state/opencode:/home/op/.local/state/opencode" \
  -v "${PWD}:/workspace" \
  -w /workspace \
  opencode-ai:latest \
  opencode "$@"