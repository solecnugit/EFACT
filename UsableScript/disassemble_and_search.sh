#!/bin/bash

# Check if correct number of arguments is given
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <path-to-directory> <search-string>"
    exit 1
fi

# Directory containing potential ELF files
DIR=$1

# String to search for in disassembly
SEARCH_STRING=$2

# Iterate over all files in the specified directory
for file in "$DIR"/*; do
    # Check if file is an ELF executable
    if file "$file" | grep -q 'ELF'; then
        # Output filename for disassembly
        txt_output="${file}.txt"

        # Generate disassembly and save to text file
        objdump -d "$file" > "$txt_output"

        # Search the disassembly for the given string
        if grep -q "$SEARCH_STRING" "$txt_output"; then
            echo "String found in: $file"
        fi
    fi
done

