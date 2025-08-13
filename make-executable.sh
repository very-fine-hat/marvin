#!/bin/bash
# Make Marvin executable files after git pull/clone
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🔧 Making Marvin files executable..."

# Main marvin script
chmod +x "$SCRIPT_DIR/marvin"
echo "✅ Made marvin executable"

# All tools
for tool in "$SCRIPT_DIR/tools"/*; do
    if [[ -f "$tool" && "$(basename "$tool")" != "*.sh" && "$(basename "$tool")" != ".DS_Store" ]]; then
        chmod +x "$tool"
        echo "✅ Made $(basename "$tool") executable"
    fi
done

# Setup script (if it exists at root)
if [[ -f "$SCRIPT_DIR/setup" ]]; then
    chmod +x "$SCRIPT_DIR/setup"
    echo "✅ Made setup executable"
fi

echo "🎉 All Marvin files are now executable!"
