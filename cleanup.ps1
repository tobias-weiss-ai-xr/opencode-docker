#!/usr/bin/env pwsh

# Clean up: stop containers and remove images

$ErrorActionPreference = "Stop"
$env:HOME = "$env:USERPROFILE"

Write-Host "Stopping OpenCode containers..." -ForegroundColor Cyan
docker compose down 2>$null
docker compose -f docker-compose.yml -f docker-compose.web.yml down 2>$null
docker compose -f docker-compose.yml -f docker-compose.serve.yml down 2>$null

Write-Host "Removing containers..." -ForegroundColor Cyan
docker rm -f opencode-dev opencode-web opencode-serve 2>$null

Write-Host "✓ Cleanup complete" -ForegroundColor Green