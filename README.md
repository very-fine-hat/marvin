# Marvin

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

# Run setup
~/.marvin/framework/setup

# Initialize your first configuration
marvin init
```

### First Configuration

```bash
# Create your identity
marvin edit global/identity.md

# Set up a domain (e.g., coding)
marvin edit domains/coding.md

# Link your first project
marvin link my-project /path/to/project

# Deploy to your AI tools
marvin sync my-project cursor
marvin sync my-project claude
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
├── framework/           # Marvin framework (this repo)
└── configs/            # Your personal AI configurations
    ├── global/         # Universal configurations
    ├── domains/        # Domain-specific configurations  
    ├── projects/       # Project-specific configurations
    └── sessions/       # Auto-managed session context
```

## Example Use Cases

### Software Developer
- Global identity with programming background and preferences
- Coding domain with language-specific guidelines and architecture patterns
- Project-specific technical context and requirements
- Automatic deployment to Cursor, Claude Code, and Claude Projects

### Content Creator
- Global identity with writing experience and style preferences
- Writing domain with genre-specific guidelines and voice preferences
- Project-specific context for different publications or clients
- Consistent AI assistance across writing tools and platforms

### Researcher
- Global identity with research background and methodology preferences
- Research domain with analysis frameworks and citation standards
- Project-specific research questions and source organization
- Consistent AI assistance for literature review, analysis, and writing

### TTRPG Game Master
- Global identity with gamemastering background and system preferences
- RPG domain with system-specific guidelines
- Project-specific context for campaigns, players, etc.
- Deployment into a location for content and notes (e.g., an Obsidian Vault)

## Commands

```bash
marvin init                           # Initialize personal configuration
marvin edit <path>                    # Edit configuration file
marvin link <project> [path]          # Link existing project
marvin create <project> <template>    # Create new project from template
marvin sync <project> <tool>          # Deploy configurations to AI tool
marvin validate                       # Check configuration consistency
marvin status                         # Show configuration status
marvin help                          # Show detailed help
```

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
