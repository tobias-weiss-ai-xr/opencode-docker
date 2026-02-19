#!/usr/bin/env pwsh

# Clean up: stop containers and remove images

$ErrorActionPreference = "Stop"
$env:HOME = "$env:USERPROFILE"

Write-Host "Stopping OpenCode containers..." -ForegroundColor Cyan
docker compose down

Write-Host "Cleaning up related containers..." -ForegroundColor Cyan
docker compose -f docker-compose.web.yml down 2>$null
docker compose -f docker-compose.serve.yml down 2>$null

Write-Host "Removing opencode-ai image..." -ForegroundColor Cyan
docker rmi opencode-ai:latest 2>$null

Write-Host "✓ Cleanup complete" -ForegroundColor Green