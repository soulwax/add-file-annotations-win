# Source File Path Annotator

A PowerShell script that automatically adds or updates file path comments at the top of source files. It supports multiple programming languages and provides flexible configuration options for including/excluding files.

## Features

- Supports 50+ programming languages with appropriate comment syntax
- Intelligent comment handling (both single-line and multi-line)
- Configurable path filtering (exclude/include/override patterns)
- Preserves file encoding (UTF-8 without BOM)
- Updates existing path comments without duplication
- Detailed logging and progress reporting

## Structure

The project consists of four files:

```sh
project_root/
├── main.ps1           # Main script (entry point)
├── comment-types.ps1  # Language definitions & comment syntax
├── path-filters.ps1   # Path filtering rules
└── filter-utils.ps1   # Utility functions
```

## Installation

1. Clone or download this repository
2. Place all script files in your project's root directory

## Usage

1. Open PowerShell in your project's root directory
2. Run the script:

   ```powershell
   .\main.ps1
   ```

### Example

Before:

```cpp
#pragma once
#include <vector>

class Example {
    // ...
};
```

After:

```cpp
// File: src/core/Example.hpp
#pragma once
#include <vector>

class Example {
    // ...
};
```

## Configuration

### Language Support (`comment-types.ps1`)

Define how comments should be added for different file types. Example:

```powershell
return @{
    "cstyle" = @{
        extensions = @(".cpp", ".hpp", ".c", ".h")
        prefix = "//"
        suffix = ""
    }
    "python" = @{
        extensions = @(".py", ".pyw")
        prefix = "#"
        suffix = ""
    }
}
```

### Path Filtering (`path-filters.ps1`)

Configure which files should be processed or skipped:

```powershell
return @{
    # Files/folders to skip
    exclude = @(
        '\\vendor\\',
        '\\node_modules\\',
        '\.generated\.'
    )

    # Only process these paths (optional)
    include = @(
        '\\src\\',
        '\\include\\'
    )

    # Process these even if excluded
    override = @(
        '\\vendor\\our-company\\'
    )
}
```

## Integration

### Git Pre-Commit Hook

You can add this to your git pre-commit hook:

```bash
#!/bin/bash
# .git/hooks/pre-commit

# Run the path annotator
powershell -ExecutionPolicy Bypass -File "./main.ps1"

# Add the changes to the commit
git add -u
```

### VS Code Task

Add this to your `.vscode/tasks.json`:

```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Annotate Files",
            "type": "shell",
            "command": "powershell",
            "args": [
                "-ExecutionPolicy",
                "Bypass",
                "-File",
                "./main.ps1"
            ],
            "group": {
                "kind": "build",
                "isDefault": false
            }
        }
    ]
}
```

See `PROJECT_STRUCTURE.md` for detailed information about supported project structures and file patterns.

## Contributing

Feel free to:

1. Add support for new languages
2. Improve filtering patterns
3. Suggest new features
4. Report issues

## License

MIT License - Feel free to use and modify!
