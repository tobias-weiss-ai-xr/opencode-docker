#!/usr/bin/env pwsh

# Start OpenCode headless server using docker-compose

$ErrorActionPreference = "Stop"
$env:HOME = "$env:USERPROFILE"

Write-Host "Starting OpenCode headless server on http://localhost:3000..." -ForegroundColor Cyan

& docker compose -f docker-compose.serve.yml up