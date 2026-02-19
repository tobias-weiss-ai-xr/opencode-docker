#!/usr/bin/env pwsh

# Start OpenCode TUI using docker-compose

$ErrorActionPreference = "Stop"
$env:HOME = "$env:USERPROFILE"

Write-Host "Starting OpenCode TUI..." -ForegroundColor Cyan

docker compose run --rm opencode opencode