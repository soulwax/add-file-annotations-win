# compile.ps1
# Script to compile the File Path Annotator into an executable

# Ensure PS2EXE is installed
if (-not (Get-Module -ListAvailable -Name ps2exe)) {
    Write-Host "Installing PS2EXE module..."
    Install-Module -Name ps2exe -Scope CurrentUser -Force
}

# Create build directory
$buildPath = ".\build"
New-Item -ItemType Directory -Force -Path $buildPath

# Compile main script to exe
Write-Host "Compiling to executable..."
Invoke-ps2exe `
    -InputFile ".\main.ps1" `
    -OutputFile "$buildPath\FileAnnotator.exe" `
    -Title "File Path Annotator" `
    -Version "1.0.0" `
    -NoConsole $false `
    -RequireAdmin $false

# Copy configuration files
Write-Host "Copying configuration files..."
Copy-Item ".\comment-types.ps1" $buildPath
Copy-Item ".\path-filters.ps1" $buildPath
Copy-Item ".\filter-utils.ps1" $buildPath

# Create batch file alternative
$batchContent = @"
@echo off
powershell -ExecutionPolicy Bypass -File "%~dp0main.ps1" %*
"@
$batchContent | Out-File -FilePath "$buildPath\FileAnnotator.bat" -Encoding ascii

Write-Host "Build completed successfully!"
Write-Host ("Files created in {0}:" -f $buildPath)
Get-ChildItem $buildPath | ForEach-Object {
    Write-Host ("  - {0}" -f $_.Name)
}