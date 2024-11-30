#!/bin/bash

# This script is used to import the needed libraries for a given repository indicated in the command
# - The needed libraries are stored in the needed_libs.txt file in the destination repository
# - The libraries are stored in the imported_lib folder in the destination repository
# - The libraries are stored in the export_lib folder in the source repository

DEST_REPO="$1"

if [ ! -d "$DEST_REPO" ]; then
    echo "ERROR: Destination repository folder '$DEST_REPO' not found"
    exit 1
fi

if [ ! -f "$DEST_REPO/needed_libs.txt" ]; then
    echo "ERROR: File '$DEST_REPO/needed_libs.txt' not found"
    exit 1
fi

libraries=$(cat "$DEST_REPO/needed_libs.txt")

if [ -z "$libraries" ]; then
    echo "ERROR: No libraries listed in '$DEST_REPO/needed_libs.txt'"
    exit 1
fi

echo "The needed libraries are: $libraries, updating them in '$DEST_REPO/imported_lib'"

if [ -d "$DEST_REPO/imported_lib" ]; then
    echo "Removing old imported libraries"
    rm -rf $DEST_REPO/imported_lib
fi
mkdir -p $DEST_REPO/imported_lib

for lib in $libraries; do
    if [ ! -d "$lib" ]; then
        echo "ERROR: Library folder '$lib' not found"
        exit 1
    fi
    if [ ! -d "$lib/export_lib" ]; then
        echo "ERROR: Library '$lib' does not have 'export_lib' folder"
        exit 1
    fi
    
    cp -r $lib/export_lib $DEST_REPO/imported_lib/$lib
    # mv $DEST_REPO/imported_lib/$lib/export_lib $DEST_REPO/imported_lib/$lib
    # rm -r $DEST_REPO/imported_lib/$lib/export_lib

    echo "     $lib imported ✔️"
done
echo "All libraries imported successfully!"
