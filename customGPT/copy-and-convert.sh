#!/bin/bash

# Define source and destination directories
SRC_DIR="./src"
DEST_DIR="./files-for-gpt"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Copy the entire contents from src to files-for-gpt
rsync -av --delete "$SRC_DIR"/ "$DEST_DIR"/

# Change the file extensions from .md to .txt in the destination directory
find "$DEST_DIR" -name '*.md' -exec sh -c '
for file do
  mv "$file" "${file%.md}.txt"
done
' sh {} +
