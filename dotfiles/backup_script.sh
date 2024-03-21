#!/bin/bash

# Hardcoded source directory
source_dir="~/Library/Mobile Documents/com~apple~CloudDocs/Plain Org/"
source_dir=$(eval echo "$source_dir")

# Hardcoded destination directory
destination_dir="~/workspace/Plain Org/"
destination_dir=$(eval echo "$destination_dir")

# Hardcoded commit message
commit_message="Backup"

# Copy files from source directory to destination directory
cp -r "$source_dir"/* "$destination_dir"/

# Navigate to destination directory
cd "$destination_dir" || exit

# Check if Git is initialized in the destination directory
if [ ! -d ".git" ]; then
    echo "Initializing new Git repository..."
    git init
fi

# Add all files to staging area
git add .

# Commit changes with provided commit message
git commit -m "$commit_message"

# Push changes to remote repository
git push origin master

