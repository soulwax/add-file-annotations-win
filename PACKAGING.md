# Creating an Executable

## Method 1: PS2EXE (Recommended)

1. Install PS2EXE module:

```powershell
Install-Module -Name ps2exe
```

2. Create a compile script (`compile.ps1`):

```powershell
# Create output directory if it doesn't exist
New-Item -ItemType Directory -Force -Path ".\bin"

# Compile to exe
Invoke-ps2exe `
    -InputFile ".\main.ps1" `
    -OutputFile ".\bin\FileAnnotator.exe" `
    -IconFile ".\icon.ico" `  # Optional: Add your own icon
    -Title "File Path Annotator" `
    -Version "1.0.0" `
    -NoConsole $false `
    -RequireAdmin $false
    
# Copy configuration files
Copy-Item ".\comment-types.ps1" ".\bin\"
Copy-Item ".\path-filters.ps1" ".\bin\"
Copy-Item ".\filter-utils.ps1" ".\bin\"
```

3. Run the compile script:

```powershell
.\compile.ps1
```

4. Distribute the contents of the `bin` folder:
   - `FileAnnotator.exe`
   - `comment-types.ps1`
   - `path-filters.ps1`
   - `filter-utils.ps1`

## Method 2: Batch File Wrapper

1. Create `FileAnnotator.bat`:

```batch
@echo off
powershell -ExecutionPolicy Bypass -File "%~dp0main.ps1" %*
```

2. Create a distribution package:

```batch
mkdir bin
copy FileAnnotator.bat bin\
copy main.ps1 bin\
copy comment-types.ps1 bin\
copy path-filters.ps1 bin\
copy filter-utils.ps1 bin\
```

## Installation Instructions

### PS2EXE Version

1. Copy all files from the `bin` directory to your desired location
2. Double-click `FileAnnotator.exe` or run from command line
3. Optional: Add to PATH for global access

### Batch Version

1. Copy all files from the `bin` directory to your desired location
2. Double-click `FileAnnotator.bat` or run from command line
3. Optional: Add to PATH for global access

## Usage

Both versions can be used either by:

- Double-clicking the executable/batch file in the root of your project
- Running from command line:

  ```bash
  FileAnnotator.exe   # PS2EXE version
  FileAnnotator.bat   # Batch version
  ```

## Notes

1. PS2EXE Version:
   - Self-contained executable
   - More professional appearance
   - Can include custom icon
   - Might trigger antivirus (common for PS2EXE conversions)

2. Batch Version:
   - Simpler implementation
   - More transparent
   - Requires PowerShell
   - No antivirus issues
