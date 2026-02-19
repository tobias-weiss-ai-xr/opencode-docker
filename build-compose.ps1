#!/usr/bin/env pwsh

# Build Docker image using docker-compose

$ErrorActionPreference = "Stop"
$env:HOME = "$env:USERPROFILE"

Write-Host "Building opencode-ai:latest image..." -ForegroundColor Cyan

docker compose build --build-arg USER_ID=1000

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Build successful!" -ForegroundColor Green
} else {
    Write-Host "✗ Build failed" -ForegroundColor Red
    exit 1
}