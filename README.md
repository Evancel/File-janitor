# File Janitor

**File Janitor** is a Bash utility designed to help manage and clean directories by listing files, generating reports, and performing cleanup operations on temporary (`.tmp`), log (`.log`), and Python (`.py`) files. It automates repetitive file management tasks and helps organize your workspace efficiently.

> ✅ **This is my first Bash scripting project**, where I practiced core concepts like command-line arguments, conditionals, text processing, file operations, and script automation. It demonstrates my ability to write practical tools to streamline developer workflows.

## Features

- ✅ **Welcome Message**: Friendly greeting when the script starts.
- ✅ **Help**: Display available commands and usage instructions.
- ✅ **List Files**: Show files in the specified directory (or current directory by default).
- ✅ **Report**: Count `.tmp`, `.log`, and `.py` files and calculate their total sizes.
- ✅ **Clean**:
  - Archive and delete old `.log` files (older than 3 days).
  - Remove all `.tmp` files.
  - Move `.py` files into a `python_scripts` subdirectory.

## Usage

Run the script with:

```bash
./file-janitor.sh [option] [directory]
If no directory is provided, the script operates in the current directory.
```

## Example
```bash
./file-janitor.sh report /path/to/target-directory
```

## Why I Built This
As part of my learning in Bash scripting, I wanted to build a practical, real-world tool that handles common file operations. This project helped me:
- Work with file system utilities like find, tar, rm, mv.
- Practice parsing command-line arguments and applying conditionals.
- Learn text output formatting for better user experience.

## Next Steps / Improvements
In the future, I plan to:
- Add more flexible date-based cleanup options.
- Improve error handling and input validation.
- Add colorized output for better readability.
- Refactor into smaller functions for better maintainability.

### 🤝 Contributing
Feel free to try it out or contribute!
