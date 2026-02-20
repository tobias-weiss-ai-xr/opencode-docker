#!/bin/bash
# Build custom OpenCode image based on Alpine

echo "Building OpenCode Alpine image..."
docker build --build-arg USER_ID=1001 -t opencode-ai:latest .
echo "✓ Done!"
