# Marvin 🤖

> "I think you ought to know I'm feeling very depressed." - Marvin, The Paranoid Android

A configuration management system for AI assistants. Because even AI assistants need consistent, well-organized instructions.

## What is Marvin?

Marvin helps you manage AI assistant configurations across different tools, projects, and work domains. Instead of repeating the same context and instructions across Cursor, Claude Projects, ChatGPT, and other AI tools, Marvin provides a centralized system for managing and deploying AI configurations.

## Why Marvin?

If you work with AI assistants across multiple projects, you've probably experienced:

- **Repetitive context sharing** - Explaining the same background information repeatedly
- **Inconsistent AI behavior** - Different responses because context varies between tools
- **Lost session context** - Starting over when switching between AI chats
- **Configuration drift** - AI setups becoming inconsistent across projects over time

Marvin attempts to make you feel better about this by providing a **layered configuration system** that can be deployed to multiple AI tools consistently.

## Quick Start

### Installation

```bash
# Clone Marvin framework
git clone https://github.com/very-fine-hat/marvin.git ~/.marvin/framework
```

### First Time Setup

```bash
# Initialize your personal configurations
marvin --init                    # Creates ~/.marvin/configs/ with coding domain
marvin --init rpg-campaign       # Or initialize with different domain
marvin --init all                # Or initialize all available domains

# Customize your configurations
cd ~/.marvin/configs
cp template-identity.md identity.md
edit identity.md                 # Add your personal details

# Version control your configs
git add .
git commit -m "Initial personal AI configurations"
```

### Using in Projects

```bash
# In any project directory
cd /path/to/your/project

# Link your configurations to the project (smart command!)
marvin                           # Links coding domain OR syncs existing
marvin writing                   # Links writing domain OR syncs existing

# Configure AI tools
marvin --setup cursor            # Set up Cursor IDE integration
marvin --setup claude            # Prepare for Claude Projects

# Customize project-specific context
edit ai-marvin/project/context.md

# Later: just run marvin to sync changes
marvin                           # Automatically syncs any updates

# Commit to project repository
git add ai-marvin/
git commit -m "Add Marvin AI configurations"
```

## Core Concepts

### Layered Configuration

Marvin uses a four-layer configuration system:

1. **Global** - Your identity, working style, universal preferences
2. **Domain** - Configurations for types of work (coding, writing, research, rpgcampaigns, etc.)
3. **Project** - Specific context for individual projects
4. **Session** - Temporary context for current work (auto-managed)

### Tool Integration

Deploy configurations to multiple AI tools:

- **Cursor IDE** - Rules files for coding assistance
- **Claude Projects** - Knowledge base and custom instructions  
- **Claude Code** - Terminal-based AI development
- **Custom integrations** - Extensible to other tools that you may use AI for (e.g., Obsidian for notes)

### Smart Context Management

- **Session continuity** - Maintain context across AI chat sessions
- **Auto-categorization** - Automatically organize work by type
- **Context handoff** - Seamlessly switch between different AI tools
- **Quality assurance** - Built-in validation to ensure AI actually reads your configs

## Directory Structure

After setup, you'll have:

```
~/.marvin/
├── framework/                    # Marvin framework (this repo)
│   ├── configs/                 # Framework template configurations
│   │   ├── global/
│   │   │   ├── always/          # Always-read-first configurations
│   │   │   │   ├── brown-mnm.md # Quality assurance system
│   │   │   │   ├── safety.md    # AI safety rules
│   │   │   │   └── style.md     # Interaction style guide
│   │   │   └── template-*.md    # Templates for customization
│   │   └── domains/             # Domain-specific templates
│   │       ├── coding/
│   │       ├── writing/
│   │       ├── research/
│   │       └── rpg-campaign/
│   └── tools/                   # Management and deployment tools
├── configs/                     # Your personal AI configurations (git repo)
│   ├── global/
│   │   ├── always/              # Framework defaults (copied during init)
│   │   └── identity.md          # Your customized identity
│   └── domains/
│       └── coding/              # Your customized domain configs
└── project/
    └── ai-marvin/               # Project-specific AI configurations
        ├── global/              # Copied from your personal configs
        ├── coding/              # Domain configs for this project
        └── project/             # Project-specific context
```

### Configuration Layers

The new workflow uses a **copy-based approach** with three main locations:

1. **Framework configs** (`~/.marvin/framework/configs/`) - Templates and defaults
2. **Personal configs** (`~/.marvin/configs/`) - Your customized configurations (git repository)
3. **Project configs** (`project/ai-marvin/`) - Project-specific copy of configs

### Always-Read-First Files

Files in `always/` directories are read before other files in the same layer:

- **Brown M&M Test** (`brown-mnm.md`) - Quality assurance system that ensures AI assistants actually read your configurations
- **Safety Rules** (`safety.md`) - Essential AI safety boundaries and guidelines
- **Style Guide** (`style.md`) - Consistent interaction patterns and preferences

This ensures critical configurations are always processed first, regardless of filesystem ordering.

## Example Use Cases

### Software Developer
- Initialize with `marvin --init coding`
- Customize global identity and coding domain preferences
- Use `marvin` in each project - automatically links coding configs
- Set up tools with `marvin --setup cursor` and `marvin --setup claude`
- Project teams can see and collaborate on AI configurations

### Content Creator
- Initialize with `marvin --init writing`
- Set up writing domain with style guides and preferences
- Use `marvin writing` to link writing configs to content projects
- Consistent AI assistance across different publications and clients

### Researcher
- Initialize with `marvin --init research`
- Configure research methodology and analysis frameworks
- Use `marvin research` for research projects
- Maintain consistent research approach across different studies

### TTRPG Game Master
- Initialize with `marvin --init rpg-campaign`
- Set up RPG domain with system-specific guidelines
- Use `marvin rpg-campaign` in campaign directories
- Use `marvin --setup` to integrate with note-taking tools like Obsidian

## Commands

```bash
# Smart main command
marvin [domain]                   # Link domain configs OR sync if already linked

# Configuration flags
marvin --init [domain]            # Initialize personal configuration directory
marvin --setup <tool>             # Configure AI tool (cursor, claude, code)
marvin --sync                     # Force sync between personal and project configs
marvin --validate                 # Check configuration consistency
marvin --status                   # Show current state and planned actions
marvin --update                   # Update Marvin framework from GitHub
marvin --version                  # Show version information
marvin --help                     # Show detailed help
```

## Workflow

The typical Marvin workflow:

1. **One-time setup**: `marvin --init` to create personal configurations
2. **Customize**: Edit template files in `~/.marvin/configs/`
3. **Per-project**: Use `marvin` to link configs (or sync existing)
4. **Tool setup**: Use `marvin --setup <tool>` to configure AI tools
5. **Iterate**: Just run `marvin` to keep everything in sync

### Smart Command Behavior

```bash
marvin              # In new project: links coding domain
                    # In existing marvin project: syncs changes
                    
marvin writing      # In new project: links writing domain  
                    # In existing marvin project: syncs writing configs
```

### Sync Workflow

Marvin supports bidirectional syncing:

- **Personal → Project**: `marvin --sync` copies updates from `~/.marvin/configs/` to current project
- **Project → Personal**: `marvin --sync` can promote useful project changes back to personal configs
- **Conflict resolution**: When both sides have changes, Marvin asks which direction to sync

## Philosophy

- **Start simple, grow organically** - Begin with basic configurations, add complexity as needed
- **Single source of truth** - Maintain configurations in one place, deploy everywhere
- **Tool agnostic** - Work with multiple AI assistants and tools
- **Version controlled** - Track evolution of your AI preferences over time
- **Extensible** - Easy to add new tools, domains, and configuration patterns

## Advanced Features

- **Brown M&M Test** - Quality assurance system to ensure AI assistants actually read your configurations
- **Context handoff** - Maintain session context when switching between AI tools
- **Multi-domain projects** - Handle projects that span multiple work domains
- **Conditional configurations** - Different configs for different environments or contexts
- **Team sharing** - Share configuration patterns across team members

## Contributing

Marvin is designed to be extensible. We welcome:

- New AI tool integrations
- Configuration templates for different domains
- Workflow improvements and optimizations
- Documentation and examples

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

MIT License - see [LICENSE](LICENSE) for details.

## Inspiration

Named after Marvin the Paranoid Android from *The Hitchhiker's Guide to the Galaxy*. Like Marvin, this tool is obsessed with getting things right and might seem a bit over-engineered for the task at hand. But also like Marvin, it's incredibly capable once you get to know it.

> "I've been talking to the main computer... It hates me." - Marvin

Don't worry, your AI assistants won't hate you. With proper configuration management, they'll actually be quite helpful.

(Yes, this was largely generated by Claude.  Not sure how Marvin would feel about that.)
