#!/bin/sh

WATCHED_DIR="/watch"
LAST_CHECK_DIRS="/tmp/checked_dirs.txt"

# Function creates sub-folders and renames with datestamp
process_directory() {
    # Folders are set, create sub-structure
    for folder in $FOLDERS; do
        mkdir -p "$1/$folder"
    done

    # Datestamp is set, rename the folder
    if [ $DATESTAMP ]; then
        mv "$1" "$(dirname "$1")/$(date +$DATESTAMP)_$(basename "$1")"
    fi
}

# Function to check if a directory is empty
is_dir_empty() {
    return $(ls -A "$1" | wc -l)
}

# Store current directory names in watched directory list
ls -1 $WATCHED_DIR | while read dir_name; do echo "$dir_name" > $LAST_CHECK_DIRS; done

# Infinite loop to monitor and process new or empty directories
while true; do
    for dir in $WATCHED_DIR/*; do
        
        # Check that it is a directory
        if [ -d "$dir" ]; then
            dir_name=$(basename "$dir")

            # Process if directory is new and not in checked list
            if ! grep -Fxq "$dir_name" $LAST_CHECK_DIRS; then
                if is_dir_empty "$dir"; then
                    process_directory "$dir"
                    
                    # Add to checked list
                    echo "$dir_name" >> $LAST_CHECK_DIRS
                fi
            fi
        fi
    done
    
    # Wait 5 seconds before next check.
    sleep 5
done
