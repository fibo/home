#!/bin/sh
# Open a new Terminal window in the given folder.
set -e

if [ ! -d "$1" ]; then
    echo "folder not found: $1" >&2
    exit 1
fi

open -a Terminal "$1"
