#!/bin/bash

# Check if arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Please provide both directory path and search string"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if filesdir exists and is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a directory or does not exist"
    exit 1
fi

# Function to count matching lines in a file
count_matches_in_file() {
    local file="$1"
    local count=$(grep -c "$searchstr" "$file")
    echo "$count"
}

# Function to recursively search for files and count matching lines
search_files() {
    local dir="$1"
    local total_files=0
    local total_matches=0
    
    while IFS= read -r -d '' file; do
        total_files=$((total_files + 1))
        matches=$(count_matches_in_file "$file")
        total_matches=$((total_matches + matches))
    done < <(find "$dir" -type f -print0)
    
    echo "The number of files are $total_files and the number of matching lines are $total_matches"
}

# Perform the search
search_files "$filesdir"
