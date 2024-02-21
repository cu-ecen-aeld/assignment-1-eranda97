#!/bin/bash

# Check if the required arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

# Extract arguments
writefile="$1"
writestr="$2"

# Check if the file path is provided
if [ -z "$writefile" ]; then
    echo "Error: File path not specified."
    exit 1
fi

# Check if the string to write is provided
if [ -z "$writestr" ]; then
    echo "Error: Text string not specified."
    exit 1
fi

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Write the string to the file
echo "$writestr" > "$writefile"

# Check if file creation was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to create file $writefile"
    exit 1
fi

echo "File $writefile created successfully with content: $writestr"
exit 0

