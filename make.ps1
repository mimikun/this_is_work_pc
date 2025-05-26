$ProjectRoot = (Get-Item -Path $PSScriptRoot).FullName
$TargetDir = Join-Path $ProjectRoot "target"
$ProjectName = "this_is_work_pc"
$BinRelease = Join-Path $TargetDir "release" "$ProjectName.exe"
$InstallDir = "C:\Program Files\Yt Env Checks"

function Build-Project {
    Write-Host "--- Building release version ---"
    cargo build --release
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Build failed."
        exit 1
    }
    Write-Host "Build complete."
}

function Install-Project {
    Build-Project

    Write-Host "--- Installing $($ProjectName).exe to $($InstallDir) ---"
    if (-not (Test-Path $InstallDir)) {
        New-Item -ItemType Directory -Path $InstallDir | Out-Null
    }
    Copy-Item -Path $BinRelease -Destination $InstallDir -Force
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Installation failed."
        exit 1
    }
    Write-Host "Installation complete. You may need to add $($InstallDir) to your PATH."
}

function Clean-Project {
    Write-Host "--- Cleaning up target directory ---"
    cargo clean
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Clean up failed."
        exit 1
    }
    Write-Host "Clean up complete."
}

function Show-Help {
    Write-Host "PowerShell script for Cargo Project"
    Write-Host ""
    Write-Host "Usage:"
    Write-Host "  . .\make.ps1 -Command Build         - Build the release version (default if no command specified)"
    Write-Host "  . .\make.ps1 -Command Install       - Build and install the release version"
    Write-Host "  . .\make.ps1 -Command Clean         - Clean up the target directory"
    Write-Host "  . .\make.ps1 -Command Help          - Display this help message"
}

param(
    [string]$Command = "Build"
)

switch ($Command) {
    "Build" { Build-Project }
    "Install" { Install-Project }
    "Clean" { Clean-Project }
    "Help" { Show-Help }
    default {
        Write-Error "Unknown command: $Command"
        Show-Help
        exit 1
    }
}
