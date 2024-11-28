# compile-standalone.ps1
# Script to compile everything into a single executable

# Ensure PS2EXE is installed
if (-not (Get-Module -ListAvailable -Name ps2exe)) {
    Write-Host "Installing PS2EXE module..."
    Install-Module -Name ps2exe -Scope CurrentUser -Force
}

# Create build directory
$buildPath = ".\build"
New-Item -ItemType Directory -Force -Path $buildPath

# Read all configuration files
$commentTypes = Get-Content -Raw ".\comment-types.ps1"
$pathFilters = Get-Content -Raw ".\path-filters.ps1"
$filterUtils = Get-Content -Raw ".\filter-utils.ps1"
$mainScript = Get-Content -Raw ".\main-standalone.ps1"

# Replace placeholder content in main script
$mainScript = $mainScript.Replace(
    "# [Content of comment-types.ps1 goes here]",
    ($commentTypes -split "`n" | Select-Object -Skip 2 | Join-String -Separator "`n")
).Replace(
    "# [Content of path-filters.ps1 goes here]",
    ($pathFilters -split "`n" | Select-Object -Skip 2 | Join-String -Separator "`n")
).Replace(
    "# [Content of filter-utils.ps1 goes here]",
    ($filterUtils -split "`n" | Select-Object -Skip 2 | Join-String -Separator "`n")
)

# Save the combined script temporarily
$tempScript = Join-Path $buildPath "temp-combined.ps1"
$mainScript | Out-File -FilePath $tempScript -Encoding UTF8

# Compile to exe
Write-Host "Compiling to standalone executable..."
Invoke-ps2exe `
    -InputFile $tempScript `
    -OutputFile "$buildPath\FileAnnotator.exe" `
    -Title "File Path Annotator" `
    -Version "1.0.0" `
    -NoConsole $false `
    -RequireAdmin $false

# Clean up temporary file
Remove-Item $tempScript

Write-Host "Build completed successfully!"
Write-Host ("Standalone executable created: {0}" -f (Join-Path $buildPath "FileAnnotator.exe"))