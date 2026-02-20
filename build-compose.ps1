#!/usr/bin/env pwsh

# Pull official OpenCode image

$ErrorActionPreference = "Stop"
$env:HOME = "$env:USERPROFILE"

Write-Host "Pulling official OpenCode image..." -ForegroundColor Cyan

docker pull ghcr.io/anomalyco/opencode:latest

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Image ready!" -ForegroundColor Green
} else {
    Write-Host "✗ Pull failed" -ForegroundColor Red
    exit 1
}