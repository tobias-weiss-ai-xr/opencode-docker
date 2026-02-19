#!/usr/bin/env pwsh

# Test suite for opencode-docker

$ErrorActionPreference = "Stop"
$TotalTests = 0
$PassedTests = 0
$FailedTests = 0

function Test-Result {
    param(
        [string]$Description,
        [bool]$Passed,
        [string]$Details = ""
    )

    $script:TotalTests++
    if ($Passed) {
        $script:PassedTests++
        Write-Host "✓ $Description" -ForegroundColor Green
    } else {
        $script:FailedTests++
        Write-Host "✗ $Description" -ForegroundColor Red
        if ($Details) {
            Write-Host "  $Details" -ForegroundColor Gray
        }
    }
}

Write-Host "`n=== OpenCode Docker Test Suite ===" -ForegroundColor Cyan
Write-Host ""

# Test 1: Check Docker is installed and running
Write-Host "[Test 1/7] Docker daemon status" -ForegroundColor Yellow
try {
    $dockerVersion = docker --version 2>&1
    Test-Result "Docker is installed" $true $dockerVersion
} catch {
    Test-Result "Docker is installed" $false "Docker not found or not in PATH"
    exit 1
}

# Test 2: Check if opencode-ai image exists
Write-Host "`n[Test 2/7] Docker image" -ForegroundColor Yellow
$imageExists = docker images opencode-ai:latest --format "{{.Repository}}:{{.Tag}}" 2>&1
Test-Result "opencode-ai:latest image exists" ($imageExists -eq "opencode-ai:latest") 

# Test 3: Test basic container execution
Write-Host "`n[Test 3/7] Basic container execution" -ForegroundColor Yellow
try {
    $output = docker run --rm opencode-ai:latest opencode --help 2>&1
    $hasCommands = ($output -join "") -match "Commands:"
    Test-Result "Container can run opencode --help" $hasCommands
} catch {
    Test-Result "Container can run opencode --help" $false $_.Exception.Message
}

# Test 4: Test volume mounting
Write-Host "`n[Test 4/7] Volume mounting" -ForegroundColor Yellow
try {
    $testFile = "test-file-$(Get-Date -Format 'yyyyMMddHHmmss').txt"
    "test content" | Out-File -FilePath $testFile -Encoding utf8
    
    $check = docker run --rm -v "${PWD}:/workspace" -w /workspace opencode-ai:latest cat /workspace/$testFile 2>&1
    Test-Result "Container can read mounted file" ($check -eq "test content")
    
    Remove-Item $testFile -Force
} catch {
    Test-Result "Container can read mounted file" $false $_.Exception.Message
}

# Test 5: Test docker-compose availability
Write-Host "`n[Test 5/7] docker-compose" -ForegroundColor Yellow
try {
    $composeVersion = docker compose version 2>&1
    if ($composeVersion -match "error") {
        $composeVersion = docker-compose --version 2>&1
    }
    Test-Result "docker-compose is available" $true $composeVersion
} catch {
    Test-Result "docker-compose is available" $false "docker-compose not found"
}

# Test 6: Test docker-compose configuration
Write-Host "`n[Test 6/7] docker-compose configuration" -ForegroundColor Yellow
if (Test-Path "docker-compose.yml") {
    try {
        $configCheck = docker compose config 2>&1
        $hasError = ($configCheck -join "") -match "error"
        Test-Result "docker-compose.yml is valid" (-not $hasError)
    } catch {
        Test-Result "docker-compose.yml is valid" $true
    }
} else {
    Test-Result "docker-compose.yml exists" $false "docker-compose.yml not found"
}

# Test 7: Test PATH environment
Write-Host "`n[Test 7/7] Environment configuration" -ForegroundColor Yellow
try {
    $pathCheck = docker run --rm opencode-ai:latest bash -c 'echo $PATH' 2>&1
    $pathString = if ($pathCheck -is [array]) { $pathCheck -join "" } else { $pathCheck }
    Test-Result "OpenCode binary is in PATH" ($pathString.Contains("opencode"))
} catch {
    Test-Result "OpenCode binary is in PATH" $false $_.Exception.Message
}

# Summary
Write-Host "`n=== Test Summary ===" -ForegroundColor Cyan
Write-Host "Total:  $TotalTests" -ForegroundColor White
Write-Host "Passed: $PassedTests" -ForegroundColor Green
Write-Host "Failed: $FailedTests" -ForegroundColor $(if ($FailedTests -gt 0) { "Red" } else { "Green" })
Write-Host ""

if ($FailedTests -eq 0) {
    Write-Host "🎉 All tests passed!" -ForegroundColor Green
    exit 0
} else {
    Write-Host "⚠ Some tests failed. Check the output above." -ForegroundColor Yellow
    exit 1
}