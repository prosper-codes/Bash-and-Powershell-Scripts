#!/bin/bash

# Author: Takunda Nhau
# Created Date: 2026-01-15
# Last Modified Date: 2026-01-15
# Description:
#   Interactive toolkit menu that allows the user to run system utilities.
# Usage:
#   ./toolkit.sh

PS3="Select an option: "

select OPTION in "Cruft Remover" "Folder Organiser" "Exit"; do
    case "$OPTION" in
        "Cruft Remover")
            ./cruft_remover.sh
            ;;
        "Folder Organiser")
            ./folder_organiser.sh
            ;;
        "Exit")
            echo "Goodbye!"
            break
            ;;
        *)
            echo "Invalid selection."
            ;;
    esac
done
