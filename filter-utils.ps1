# filter-utils.ps1
# Utility functions for path filtering

# Function to check if a path matches any pattern in a pattern list
function Test-MatchesPattern {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path,
        
        [Parameter(Mandatory=$true)]
        [string[]]$Patterns
    )
    
    foreach ($pattern in $Patterns) {
        if ($Path -match $pattern) {
            return $true
        }
    }
    return $false
}

# Function to check if a path should be processed
function Test-ShouldProcessPath {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path,
        
        [Parameter(Mandatory=$true)]
        [hashtable]$PathFilters
    )
    
    # Check if path matches any override patterns
    if ($PathFilters.override -and (Test-MatchesPattern -Path $Path -Patterns $PathFilters.override)) {
        return $true
    }
    
    # Check if path matches any exclude patterns
    if ($PathFilters.exclude -and (Test-MatchesPattern -Path $Path -Patterns $PathFilters.exclude)) {
        return $false
    }
    
    # If include patterns exist, path must match one of them
    if ($PathFilters.include -and $PathFilters.include.Count -gt 0) {
        return Test-MatchesPattern -Path $Path -Patterns $PathFilters.include
    }
    
    # If no include patterns, and not excluded, process the path
    return $true
}