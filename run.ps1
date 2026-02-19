#!/usr/bin/env pwsh

# Run OpenCode with a message and exit

$ErrorActionPreference = "Stop"
$env:HOME = "$env:USERPROFILE"

if ($args.Count -eq 0) {
    Write-Host "Usage: .\run.ps1 'your message here'" -ForegroundColor Yellow
    exit 1
}

$message = $args -join ' '

Write-Host "Running OpenCode with: $message" -ForegroundColor Cyan

docker compose run --rm opencode opencode run $message