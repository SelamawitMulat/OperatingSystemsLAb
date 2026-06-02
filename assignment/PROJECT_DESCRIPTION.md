# System Call Analyzer Shell - Project Description

## Project Overview
This project implements an interactive shell program that traces and analyzes system calls executed during command execution. Using the `strace` utility as a backend, the analyzer captures, interprets, and explains low-level kernel operations triggered by any user command.

## Objective
To develop a comprehensive system call analyzer that helps understand the relationship between high-level shell commands and their underlying kernel operations. The tool provides detailed analysis including system call names, descriptions, parameters, return values, and their interpretations.

## Project Description

### Core Features
1. **Interactive Shell Interface** - User-friendly command prompt accepting any shell command
2. **System Call Tracing** - Captures all system calls using `strace` with process forking support
3. **Detailed Analysis** - Provides comprehensive breakdown of each system call
4. **Parameter Explanation** - Explains the meaning and purpose of each system call parameter
5. **Return Value Interpretation** - Identifies success/failure and error conditions
6. **Summary Report** - Displays count of each system call executed

### Supported System Calls
The analyzer focuses on analyzing the following critical system calls:
- **open, openat** - File opening operations
- **read, write** - I/O operations
- **close** - File descriptor closure
- **execve** - Program execution
- **fork, clone** - Process creation
- **mmap** - Memory mapping
- **access** - Permission checking
- **stat, fstat** - File metadata retrieval
- **lseek** - File pointer positioning
- **exit, exit_group** - Process termination

### Technical Implementation
- **Language**: Bash Shell Script
- **Dependencies**: strace utility
- **Analysis Strategy**: Real-time parsing of strace output with regular expressions
- **Output Format**: Structured, human-readable analysis with clear parameter breakdowns

### How It Works
1. User enters a shell command at the prompt
2. Command is executed with `strace -f` to capture all system calls
3. Strace output is parsed line-by-line
4. For each recognized system call:
   - Display system call name and purpose
   - Extract and explain parameters with context
   - Show return value and interpret success/failure
5. Generate summary showing frequency of each system call

## Group Members
- **Team Lead/Developer**: Selam Awitmulat

## Usage
```bash
chmod +x assign.sh
./assign.sh
```

At the prompt, type any command (e.g., `ls`, `cat file.txt`, `grep pattern file`) and the analyzer will display detailed system call information.

## Example Output
When executing `ls`, the analyzer displays:
- System Call: openat
  - Purpose: Opens a file relative to directory reference
  - Parameters: directory reference, file path, access flags
  - Return Value: file descriptor or error code
  - Interpretation: whether operation succeeded

## Benefits
- Educational tool for understanding kernel operations
- Debugging tool for analyzing program behavior
- Performance analysis aid for identifying expensive system calls
- Learning resource for operating systems students

## Deliverables Included
✓ Executable shell program (assign.sh)
✓ Project description document
✓ Comprehensive system call analysis
