#!/bin/bash

# Author: Takunda Nhau
# Created Date: 2026-01-15
# Last Modified Date: 2026-01-15
# Description:
#   Finds and interactively removes files ("cruft") that have not been modified
#   for a user-defined number of days within a chosen directory.
# Usage:
#   ./cruft_remover.sh

# --- User input ---
read -rp "Enter the directory to remove cruft from: " TARGET_DIR
read -rp "Enter the number of days since last modification: " DAYS

# --- Validation ---
if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Error: Directory does not exist."
    exit 1
fi

# --- Find eligible files ---
readarray -t CRUFT_FILES < <(
    find "$TARGET_DIR" -maxdepth 1 -type f -mtime +"$DAYS"
)

# --- Check if anything was found ---
if [[ ${#CRUFT_FILES[@]} -eq 0 ]]; then
    echo "No cruft files found."
    exit 0
fi

# --- Iterate and delete interactively ---
for FILE in "${CRUFT_FILES[@]}"; do
    echo "Attempting to delete: $FILE"
    rm -i "$FILE"
done

echo "Cruft removal complete."
