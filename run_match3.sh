#!/bin/bash

# Determine the platform
OS=$(uname -s)

# Navigate to the Match3 directory (script assumes it's run from within or outside Match3)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR" || { echo "Failed to navigate to Match3 directory"; exit 1; }

# Clean build artifacts
echo "Cleaning build artifacts..."
make clean || { echo "make clean failed"; exit 1; }

# Build the project
echo "Building Match 3..."
make || { echo "make failed"; exit 1; }

# Check if the executable exists
EXECUTABLE="build/match3"
if [ "$OS" = "MINGW32_NT" ] || [ "$OS" = "MINGW64_NT" ]; then
    EXECUTABLE="build/match3.exe" # Windows uses .exe
fi

if [ ! -f "$EXECUTABLE" ]; then
    echo "Error: $EXECUTABLE not found"
    exit 1
fi

# Ensure executable permissions (not needed on Windows)
if [ "$OS" != "MINGW32_NT" ] && [ "$OS" != "MINGW64_NT" ]; then
    chmod +x "$EXECUTABLE" || { echo "Failed to set executable permissions"; exit 1; }
fi

# Run the executable
echo "Running Match 3..."
"$EXECUTABLE" || { echo "Failed to run $EXECUTABLE"; exit 1; }
