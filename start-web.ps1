#!/usr/bin/env pwsh

# Start OpenCode web interface

$ErrorActionPreference = "Stop"
$env:HOME = "$env:USERPROFILE"

Write-Host "Starting OpenCode web interface..." -ForegroundColor Cyan
Write-Host "Opening browser at http://localhost:3000" -ForegroundColor Yellow

& docker compose -f docker-compose.yml -f docker-compose.web.yml up