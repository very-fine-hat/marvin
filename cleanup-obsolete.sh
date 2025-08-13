#!/bin/bash
# Clean up obsolete files from Marvin development
set -euo pipefail

echo "🧹 Cleaning up obsolete Marvin files..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Remove obsolete stub generator
if [[ -f "$SCRIPT_DIR/tools/marvin-tools-stubs.sh" ]]; then
    rm "$SCRIPT_DIR/tools/marvin-tools-stubs.sh"
    echo "✅ Removed tools/marvin-tools-stubs.sh (obsolete stub generator)"
fi

# Remove old sync-project (replaced by new sync tool)
if [[ -f "$SCRIPT_DIR/tools/sync-project" ]]; then
    echo "⚠️  Found tools/sync-project - this may be obsolete"
    echo "   The new 'sync' tool replaces sync-project functionality"
    echo "   Review and remove if no longer needed"
fi

# Remove demo files that might have been created
demo_files=(
    "configs/tools/cursor/security.mdc"
    "configs/tools/cursor/security.mdc.remove"  
    "configs/tools/code/coding-standards.md"
)

for file in "${demo_files[@]}"; do
    if [[ -f "$SCRIPT_DIR/$file" ]]; then
        rm "$SCRIPT_DIR/$file"
        echo "✅ Removed $file (demo file)"
    fi
done

# Remove temporary files
temp_files=(
    "bootstrap.sh"
    "cleanup-demo-files.sh"
)

echo ""
echo "🗂️  Temporary files that can be removed after testing:"
for file in "${temp_files[@]}"; do
    if [[ -f "$SCRIPT_DIR/$file" ]]; then
        echo "   - $file"
    fi
done

echo ""
echo "🎉 Cleanup complete!"
echo ""
echo "💡 After testing that everything works, you can also remove:"
echo "   - bootstrap.sh (one-time permission fix)"
echo "   - cleanup-obsolete.sh (this file)"
