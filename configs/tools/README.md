# Marvin Tool Configurations

This directory contains configuration files for AI tools that will be deployed when you run `marvin --setup <tool>`.

## Overview

Marvin uses a **directory-based deployment** approach - when you run setup commands, entire directories are copied to your project, enabling multi-file configurations for each tool.

## Available Tools

### Cursor IDE (`cursor/`)

**Files:**
- `marvin.mdc` - Main configuration telling Cursor to read ai-marvin/ files

**Deployment:** `marvin --setup cursor` copies `cursor/` → `.cursor/rules/`

**Extensibility:** Add additional `.mdc` files for specialized rules:
- `security.mdc` - Security-focused development rules
- `performance.mdc` - Performance optimization guidelines  
- `accessibility.mdc` - Accessibility standards and checks
- `team-standards.mdc` - Team-specific coding conventions

**Format:** Each `.mdc` file needs YAML frontmatter:
```yaml
---
description: Description of what this rule does
globs: ["**/*.{js,ts}"]  # File patterns (optional)
alwaysApply: true        # Apply to all files (default: false)
---
```

**Documentation:** [Cursor Rules Documentation](https://docs.cursor.com/features/rules-for-ai)

---

### Claude Code (`code/`)

**Files:**
- `instructions.md` - Main instructions telling Claude Code to read ai-marvin/ files

**Deployment:** `marvin --setup code` copies `code/` → `.claude-code/`

**Extensibility:** Add additional `.md` files for specialized instructions:
- `coding-standards.md` - Detailed coding standards and conventions
- `testing-guidelines.md` - Testing requirements and best practices
- `deployment-procedures.md` - Deployment and release procedures
- `security-checklist.md` - Security review requirements
- `performance-guidelines.md` - Performance optimization standards

**Format:** Standard Markdown files with clear, actionable guidance.

**File Ordering:** Claude Code reads files alphabetically. Use numbered prefixes if ordering matters:
- `01-instructions.md`
- `02-coding-standards.md`
- `03-security-guidelines.md`

---

### Claude Projects (`claude/`)

**Files:**
- `context-template.md` - Template for generating combined configuration files

**Deployment:** `marvin --setup claude` generates `.marvin-claude/combined-context.md`

**How It Works:**
Unlike Cursor and Claude Code (which read multiple files), Claude Projects requires a single file upload. The setup process:
1. Uses `context-template.md` as the base template
2. Combines all files from your project's `ai-marvin/` directory  
3. Replaces `<!-- MARVIN_CONTENT_PLACEHOLDER -->` with combined content
4. Creates final file for upload to Claude Projects

**Extensibility:** Add alternative templates for different use cases:
- `context-minimal-template.md` - Lightweight version
- `context-detailed-template.md` - Comprehensive version  
- `context-security-template.md` - Security-focused template

*(Note: Using alternative templates requires modifying the setup tool)*

**Template Format:** Standard Markdown with placeholder:
- `<!-- MARVIN_CONTENT_PLACEHOLDER -->` - Where combined ai-marvin/ content is inserted

---

## General Principles

### Multi-File Support
All tools support multiple files in their directories. Start with the provided defaults and add specialized files as your project needs grow.

### Directory Deployment  
Setup commands copy entire directories, so any files you add will be deployed automatically.

### File Naming
- **Cursor:** Use `.mdc` extension with YAML frontmatter
- **Claude Code:** Use `.md` extension, standard Markdown
- **Claude Projects:** Templates use `.md` with placeholders

### Customization Workflow
1. Start with default files provided
2. Add specialized files as needed for your project
3. Run `marvin --setup <tool>` to deploy to your project
4. Files are copied, not symlinked, so you can modify them per-project if needed

### Maintenance
These template files are version-controlled with the Marvin framework. Updates to the framework will include improvements to default configurations.

## Usage

```bash
marvin --setup cursor    # Deploy cursor/ directory to .cursor/rules/
marvin --setup code      # Deploy code/ directory to .claude-code/  
marvin --setup claude    # Generate combined file from claude/ template
marvin --status         # See what's currently deployed
marvin --validate       # Check all configurations
```

## Adding New Tools

To add support for a new AI tool:
1. Create new directory under `configs/tools/`
2. Add configuration files for the tool
3. Update the `setup` script to handle the new tool
4. Add validation and status checks

The directory-based approach makes it easy to add comprehensive configurations for any AI tool.
