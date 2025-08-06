#!/bin/bash
# Make the auto-increment hook executable
chmod +x ~/SiriusCybernetics/marvin/.git/hooks/pre-commit
echo "✅ Auto-increment hook is now executable and ready!"

# Check if .version file exists, create it if not
cd ~/SiriusCybernetics/marvin
if [[ ! -f .version ]]; then
    echo "1.0.0" > .version
    echo "📝 Created initial .version file with version 1.0.0"
    echo "   Next commit will bump to 1.0.1"
else
    current_version=$(cat .version)
    echo "📋 Current version: $current_version"
    echo "   Next commit will auto-increment the patch version"
fi
