#!/bin/bash
# Marvin AI Configuration Management - Setup Script
set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Marvin directories
MARVIN_HOME="$HOME/.marvin"
FRAMEWORK_DIR="$MARVIN_HOME/framework"
CONFIGS_DIR="$MARVIN_HOME/configs"

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo_color() {
    local color=$1
    shift
    echo -e "${color}$*${NC}"
}

echo_color $BLUE "🤖 Marvin AI Configuration Management Setup"
echo
echo_color $YELLOW "\"I think you ought to know I'm feeling very depressed.\" - Marvin"
echo
echo "Setting up your AI configuration management system..."
echo

# Check if already installed
if [[ -d "$CONFIGS_DIR" && -f "$CONFIGS_DIR/.git/config" ]]; then
    echo_color $YELLOW "⚠️  Marvin configs already exist at $CONFIGS_DIR"
    echo
    read -p "Continue with setup anyway? This will not overwrite existing configs. (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Setup cancelled."
        exit 0
    fi
fi

# Create marvin directory structure
echo_color $BLUE "📁 Creating Marvin directory structure..."
mkdir -p "$MARVIN_HOME"

# If we're running from the framework directory, we're already in the right place
if [[ "$SCRIPT_DIR" == "$FRAMEWORK_DIR" ]]; then
    echo_color $GREEN "✅ Framework already in place at $FRAMEWORK_DIR"
else
    echo_color $YELLOW "⚠️  Note: Framework should be at $FRAMEWORK_DIR"
    echo "   Current location: $SCRIPT_DIR"
    echo "   You may want to clone marvin to the correct location:"
    echo "   git clone <marvin-repo> $FRAMEWORK_DIR"
fi

# Create configs directory if it doesn't exist
if [[ ! -d "$CONFIGS_DIR" ]]; then
    echo_color $BLUE "📂 Creating personal configs directory..."
    mkdir -p "$CONFIGS_DIR"/{global,domains,projects,sessions}
    
    # Initialize git repository for personal configs
    cd "$CONFIGS_DIR"
    git init
    
    # Create basic .gitignore
    cat > .gitignore << 'EOF'
# Temporary files
*.tmp
*.log
.DS_Store

# Personal/sensitive information
local/
private/
*.secret
*.key

# Session context (auto-managed)
sessions/
EOF

    echo_color $GREEN "✅ Personal configs directory created"
else
    echo_color $GREEN "✅ Personal configs directory already exists"
fi

# Create basic configuration structure from templates
echo_color $BLUE "📋 Setting up configuration templates..."

# Global templates
if [[ ! -f "$CONFIGS_DIR/global/README.md" ]]; then
    cat > "$CONFIGS_DIR/global/README.md" << 'EOF'
# Global Configurations

Your universal AI configurations that apply across all projects and domains.

## Getting Started

1. Copy the template files from the framework and customize them:
   ```bash
   cp ~/.marvin/framework/templates/global/* ~/.marvin/configs/global/
   ```

2. Edit each file to reflect your identity, working style, and preferences

3. These configurations will be included in all AI tool deployments

## Files to Create

- `identity.md` - Your background, experience, and expertise
- `style.md` - How you prefer to work with AI assistants  
- `safety.md` - Universal safety rules and boundaries

Start with these three files and add more as needed.
EOF
fi

# Domains templates
if [[ ! -f "$CONFIGS_DIR/domains/README.md" ]]; then
    cat > "$CONFIGS_DIR/domains/README.md" << 'EOF'
# Domain Configurations

Domain-specific AI configurations for different types of work.

## Getting Started

1. Create directories for your primary work domains:
   ```bash
   mkdir -p ~/.marvin/configs/domains/{coding,writing,research}
   ```

2. Copy and customize relevant templates:
   ```bash
   cp ~/.marvin/framework/templates/domains/coding.md.template ~/.marvin/configs/domains/coding/
   ```

3. Edit each domain configuration to match your preferences and expertise

## Common Domains

- `coding/` - Software development preferences and guidelines
- `writing/` - Creative and technical writing assistance
- `research/` - Research methodology and analysis frameworks
- `business/` - Professional communication and analysis

Create directories for your specific work areas.
EOF
fi

# Projects templates  
if [[ ! -f "$CONFIGS_DIR/projects/README.md" ]]; then
    cat > "$CONFIGS_DIR/projects/README.md" << 'EOF'
# Project Configurations

Project-specific configurations and context.

## Getting Started

Projects are typically linked to existing work directories:

```bash
marvin link my-project /path/to/project
```

Or created from templates:

```bash
marvin create my-project coding
```

## Project Structure

Each project directory contains:
- `context.md` - Project overview and specific requirements
- Links to actual project files (when applicable)
- Session context and work history
- Tool-specific configurations

## Management

Use Marvin commands to manage projects:
- `marvin link` - Link existing projects
- `marvin create` - Create new projects from templates
- `marvin sync` - Deploy configurations to AI tools
- `marvin validate` - Check configuration consistency
EOF
fi

# Add marvin command to PATH by creating a symlink
echo_color $BLUE "🔧 Setting up marvin command..."

# Determine the marvin script location
if [[ -f "$FRAMEWORK_DIR/marvin" ]]; then
    MARVIN_SCRIPT="$FRAMEWORK_DIR/marvin"
elif [[ -f "$SCRIPT_DIR/marvin" ]]; then
    MARVIN_SCRIPT="$SCRIPT_DIR/marvin"
else
    echo_color $RED "❌ Could not find marvin command script"
    echo "   Expected at: $FRAMEWORK_DIR/marvin or $SCRIPT_DIR/marvin"
    exit 1
fi

# Create ~/bin if it doesn't exist
mkdir -p "$HOME/bin"

# Create symlink to marvin command
if [[ ! -L "$HOME/bin/marvin" ]]; then
    ln -sf "$MARVIN_SCRIPT" "$HOME/bin/marvin"
    echo_color $GREEN "✅ marvin command linked to ~/bin/marvin"
else
    echo_color $GREEN "✅ marvin command already available"
fi

# Check if ~/bin is in PATH
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo_color $YELLOW "⚠️  ~/bin is not in your PATH"
    echo "   Add this to your ~/.bashrc or ~/.zshrc:"
    echo "   export PATH=\"\$HOME/bin:\$PATH\""
    echo
fi

# Initial commit for configs
cd "$CONFIGS_DIR"
if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
    git add .
    git commit -m "Initial Marvin configuration setup

- Created basic directory structure
- Added README files for each configuration area
- Ready for customization and first project setup"
    echo_color $GREEN "✅ Initial commit created for personal configurations"
fi

echo
echo_color $GREEN "🎉 Marvin setup complete!"
echo
echo_color $BLUE "Next steps:"
echo "1. Customize your configurations:"
echo "   marvin edit global/identity.md"
echo "   marvin edit domains/coding.md"
echo
echo "2. Link your first project:"
echo "   marvin link my-project /path/to/project"
echo
echo "3. Deploy to your AI tools:"
echo "   marvin sync my-project cursor"
echo
echo "4. Get help anytime:"
echo "   marvin help"
echo
echo_color $YELLOW "Remember: Start simple and grow your configurations organically!"
echo
echo "Your configurations are stored at: $CONFIGS_DIR"
echo "Framework location: $FRAMEWORK_DIR"