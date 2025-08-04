#!/bin/bash
# Marvin AI Configuration Management - Main Command
set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Marvin directories
MARVIN_HOME="$HOME/.marvin"
FRAMEWORK_DIR="$MARVIN_HOME/framework"
CONFIGS_DIR="$MARVIN_HOME/configs"
TOOLS_DIR="$FRAMEWORK_DIR/tools"

echo_color() {
    local color=$1
    shift
    echo -e "${color}$*${NC}"
}

show_help() {
    cat << 'EOF'
🤖 Marvin AI Configuration Management

USAGE:
    marvin <command> [options]

COMMANDS:
    init                    Initialize Marvin configuration system
    edit <path>             Edit configuration file
    link <project> [path]   Link existing project to Marvin
    create <project> <type> Create new project from template
    sync <project> <tool>   Deploy configurations to AI tool
    validate                Check configuration consistency
    status                  Show configuration status
    help                    Show this help message

EXAMPLES:
    marvin init                          # First-time setup
    marvin edit global/identity.md       # Edit your identity
    marvin link myapp /path/to/myapp     # Link existing project
    marvin create webapp coding         # New project from template
    marvin sync myapp cursor            # Deploy to Cursor IDE
    marvin validate                      # Check all configs

CONFIGURATION LAYERS:
    global/     - Universal identity and preferences
    domains/    - Domain-specific configurations (coding, writing, etc.)
    projects/   - Project-specific context and requirements
    sessions/   - Auto-managed session context

SUPPORTED TOOLS:
    cursor      - Cursor IDE rules and configurations
    claude      - Claude Projects knowledge and instructions
    code        - Claude Code terminal configurations
    custom      - Custom AI tool integrations

Get started: marvin init
Documentation: https://github.com/yourusername/marvin

"I've calculated your chance of survival, but I don't think you'll like it." - Marvin
EOF
}

check_setup() {
    if [[ ! -d "$CONFIGS_DIR" ]]; then
        echo_color $RED "❌ Marvin not set up. Run the setup script first:"
        echo "   ~/.marvin/framework/setup"
        exit 1
    fi
}

# Parse command
COMMAND="${1:-help}"
shift || true

case "$COMMAND" in
    "help"|"-h"|"--help")
        show_help
        ;;
    
    "init")
        echo_color $BLUE "🚀 Initializing Marvin..."
        if [[ ! -f "$FRAMEWORK_DIR/setup" ]]; then
            echo_color $RED "❌ Setup script not found at $FRAMEWORK_DIR/setup"
            echo "   Make sure Marvin framework is properly installed."
            exit 1
        fi
        exec "$FRAMEWORK_DIR/setup"
        ;;
    
    "edit")
        check_setup
        if [[ $# -eq 0 ]]; then
            echo_color $RED "❌ Usage: marvin edit <path>"
            echo "   Example: marvin edit global/identity.md"
            exit 1
        fi
        
        FILE_PATH="$1"
        FULL_PATH="$CONFIGS_DIR/$FILE_PATH"
        
        # Create directory if needed
        mkdir -p "$(dirname "$FULL_PATH")"
        
        # Use preferred editor
        EDITOR="${EDITOR:-nano}"
        if command -v code >/dev/null 2>&1; then
            EDITOR="code"
        elif command -v vim >/dev/null 2>&1; then
            EDITOR="vim"
        fi
        
        echo_color $BLUE "📝 Editing $FILE_PATH with $EDITOR..."
        "$EDITOR" "$FULL_PATH"
        ;;
    
    "link")
        check_setup
        if [[ ! -f "$TOOLS_DIR/link-project" ]]; then
            echo_color $RED "❌ link-project tool not found"
            echo "   Make sure Marvin framework is complete."
            exit 1
        fi
        exec "$TOOLS_DIR/link-project" "$@"
        ;;
    
    "create")
        check_setup
        if [[ ! -f "$TOOLS_DIR/create-project" ]]; then
            echo_color $RED "❌ create-project tool not found"
            echo "   Make sure Marvin framework is complete."
            exit 1
        fi
        exec "$TOOLS_DIR/create-project" "$@"
        ;;
    
    "sync")
        check_setup
        if [[ ! -f "$TOOLS_DIR/sync-project" ]]; then
            echo_color $RED "❌ sync-project tool not found"
            echo "   Make sure Marvin framework is complete."
            exit 1
        fi
        exec "$TOOLS_DIR/sync-project" "$@"
        ;;
    
    "validate")
        check_setup
        if [[ ! -f "$TOOLS_DIR/validate-config" ]]; then
            echo_color $RED "❌ validate-config tool not found"  
            echo "   Make sure Marvin framework is complete."
            exit 1
        fi
        exec "$TOOLS_DIR/validate-config" "$@"
        ;;
    
    "status")
        check_setup
        echo_color $BLUE "🤖 Marvin Configuration Status"
        echo
        
        # Show basic info
        echo "Framework: $FRAMEWORK_DIR"
        echo "Configs:   $CONFIGS_DIR"
        echo
        
        # Check git status
        cd "$CONFIGS_DIR"
        if [[ -d .git ]]; then
            echo_color $GREEN "Git status:"
            git status --short || true
            echo
        fi
        
        # Show directory structure
        echo_color $GREEN "Configuration structure:"
        find "$CONFIGS_DIR" -name "README.md" -prune -o -name ".git" -prune -o -type f -print | head -20
        ;;
    
    *)
        echo_color $RED "❌ Unknown command: $COMMAND"
        echo
        show_help
        exit 1
        ;;
esac