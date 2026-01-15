#!/bin/bash

# Author: Takunda Nhau
# Created Date: 2026-01-15
# Last Modified Date: 2026-01-15
# Description:
#   Organises files in a chosen directory into subfolders based on file extensions.
# Usage:
#   ./folder_organiser.sh

read -rp "Enter the directory to organise: " TARGET_DIR

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Error: Directory does not exist."
    exit 1
fi

cd "$TARGET_DIR" || exit 1

# --- Process files ---
while IFS= read -r FILE; do
    [[ -f "$FILE" ]] || continue

    case "$FILE" in
        *.jpg|*.jpeg|*.png)
            mkdir -p images
            mv "$FILE" images/
            ;;
        *.doc|*.docx|*.txt|*.pdf)
            mkdir -p documents
            mv "$FILE" documents/
            ;;
        *.xls|*.xlsx|*.csv)
            mkdir -p spreadsheets
            mv "$FILE" spreadsheets/
            ;;
        *.sh)
            mkdir -p scripts
            mv "$FILE" scripts/
            ;;
        *.zip|*.tar|*.tar.gz|*.tar.bz2)
            mkdir -p archives
            mv "$FILE" archives/
            ;;
        *.ppt|*.pptx)
            mkdir -p presentations
            mv "$FILE" presentations/
            ;;
        *.mp3)
            mkdir -p audio
            mv "$FILE" audio/
            ;;
        *.mp4)
            mkdir -p video
            mv "$FILE" video/
            ;;
        *)
            # Leave file in current directory
            ;;
    esac
done < <(ls)

echo "Folder organisation complete."
