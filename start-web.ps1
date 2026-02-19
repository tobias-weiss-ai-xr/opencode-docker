#!/usr/bin/env pwsh

# Start OpenCode web interface using docker-compose

$ErrorActionPreference = "Stop"
$env:HOME = "$env:USERPROFILE"

Write-Host "Starting OpenCode web interface..." -ForegroundColor Cyan
Write-Host "Opening browser at http://localhost:3000" -ForegroundColor Yellow

& docker compose -f docker-compose.web.yml up

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ OpenCode web stopped" -ForegroundColor Green
} else {
    Write-Host "✓ OpenCode web stopped (ctrl+c)" -ForegroundColor Yellow
}