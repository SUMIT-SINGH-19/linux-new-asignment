#!/bin/bash

# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
    echo "Error: Please provide exactly one argument."
    exit 1
fi

# Check if the path exists
if [ ! -e "$1" ]; then
    echo "Error: Path does not exist."
    exit 1
fi

# If argument is a file
if [ -f "$1" ]; then
    echo "Argument is a file."
    echo "Lines Words Characters:"
    wc "$1"

# If argument is a directory
elif [ -d "$1" ]; then
    echo "Argument is a directory."
    echo "Total files:"
    find "$1" -type f | wc -l
    echo "Total .txt files:"
    find "$1" -type f -name "*.txt" | wc -l

else
    echo "Error: Unsupported file type."
fi

