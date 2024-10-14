# File Janitor

**File Janitor** is a simple Bash utility that helps you manage files in your directories by listing, 
reporting, and cleaning up temporary, log, and Python files. It automates common file management tasks 
and organizes your workspace.
This is my first bach project.
Here I worked with the basics of Bash scripting language, including functions and arguments, reading files, 
conditional statements and text processing. Also, I practice writing helpful scripts, take advantage of 
frequently used utilities, and discover how to automate work with shell scripts.

## Features

- **Greeting**: Greet the user.
- **Help**: Offer a help message.
- **List files**: Display files in a directory.
- **Report**: Generate a report showing the number of `.tmp`, `.log`, and `.py` files and their total size.
- **Clean**: Archive and delete old `.log` files, remove `.tmp` files, and move `.py` files into a dedicated directory.
  
## Usage

You can run the `file-janitor.sh` script with the following options:

```bash
./file-janitor.sh [option] [directory]
Options: help, list, report, clean.
