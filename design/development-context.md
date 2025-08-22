# Marvin Framework Development Context ❓

## Project Overview

**Marvin** is an AI configuration management system that provides consistent, layered AI assistant configurations across different tools and projects. Named after the paranoid android from Hitchhiker's Guide to the Galaxy, it ensures AI assistants have proper context and personality.

## Current Status

We have successfully implemented a **complete, working framework** with simplified command structure and professional tooling. The system is ready for real-world testing.

### TO DO

This is our current TO DO List. When things are complete, change the - to a ✅

- Error checking: if we run `marvin` in a .marvin directory, verify that we really want to do that and not `marvin init`
- Come up with a different naming scheme to deply configs into the .marvin directory - the current one is confusing. Probably a named ruleset.

## Architecture

### Core Philosophy

- **"Just Works" Approach**: `marvin` automatically does the right thing based on context
- **Layered Configurations**: Global → Domain → Project hierarchy
- **Tool Agnostic**: Supports multiple AI tools with unified config source
- **Quality Assurance**: Built-in Brown M&M test ensures configs are actually read

### Directory Structure

```
~/.marvin/framework/                    # Git repository
├── configs/                           # Template configurations
│   ├── global/
│   │   ├── always/                    # Read-first files
│   │   │   ├── brown-mnm.md          # Quality assurance test
│   │   │   ├── safety.md             # AI safety rules
│   │   │   └── style.md              # Interaction preferences
│   │   └── template-identity.md       # User customization template
│   ├── domains/                       # Domain-specific configs
│   │   ├── coding/
│   │   ├── writing/
│   │   ├── research/
│   │   └── rpg/
│   ├── project/
│   │   └── template-context.md        # Project context template
│   └── tools/                         # AI tool integrations
│       ├── README.md                  # Comprehensive tool documentation
│       ├── cursor/
│       │   └── marvin.mdc             # Cursor IDE rules (YAML + Markdown)
│       ├── code/
│       │   └── instructions.md        # Claude Code instructions
│       └── claude/
│           └── context-template.md    # Claude Projects template
├── tools/                             # Working command-line tools
│   ├── init                          # Initialize personal configs
│   ├── link                          # Link configs to projects
│   ├── setup                         # Configure AI tools
│   ├── sync                          # Sync personal ↔ project configs
│   ├── validate                      # Configuration validation
│   └── status                        # Show current state
└── marvin                            # Main command script
```

### Personal Configuration Location

```
~/.marvin/configs/                     # User's personal configurations
├── global/                           # Copied from framework templates
├── domains/                          # Domain configs user has initialized
└── .git/                            # Version controlled
```

### Project Integration

```
./ai-marvin/                          # Created in project directories
├── global/                           # Synced from personal configs
├── [domain]/                         # Domain configs (coding, writing, etc.)
└── project/                          # Project-specific context
```

## Command Structure (Implemented)

### Smart Main Commands

- `marvin` → Links coding domain OR syncs existing configs
- `marvin writing` → Links writing domain OR syncs existing configs
- `marvin research` → Links research domain OR syncs existing configs
- `marvin rpg` → Links RPG domain OR syncs existing configs

### Configuration Commands

- `marvin --init [domain]` → Initialize personal configs
- `marvin --setup <tool>` → Configure AI tools (cursor, claude, code)
- `marvin --sync` → Force sync between personal and project configs
- `marvin --validate` → Check configuration consistency
- `marvin --status` → Show current state and planned actions
- `marvin --update` → Update framework from GitHub
- `marvin --version` → Show version information
- `marvin --help` → Show detailed help

## Key Implementation Details

### Tool Setup Architecture

- **Directory-based deployment**: Copies entire `configs/tools/[tool]/` directories
- **Multi-file support**: Each tool can have multiple configuration files
- **Template-based**: All tool configs are stored as files, not embedded in scripts

### Tool Integrations

1. **Cursor IDE**: Copies `.mdc` files to `.cursor/rules/`
   - Uses YAML frontmatter for rule metadata
   - Supports multiple specialized rules files
2. **Claude Code**: Copies `.md` files to `.claude-code/`

   - Multiple instruction files supported
   - Alphabetical reading order

3. **Claude Projects**: Combines all configs into single uploadable file
   - Uses template with placeholder replacement
   - Generates `.marvin-claude/combined-context.md`

### Quality Assurance System

- **Brown M&M Test**: Ensures AI actually reads configurations
- **Emoji Collection**: Each config file contains specific emoji
- **Validation**: Built-in consistency checking
- **Status Reporting**: Always shows what would happen before doing it

## Recent Major Improvements

### 1. Simplified Command Structure

- Eliminated confusing multiple commands
- Smart behavior: link OR sync based on context
- Modern CLI patterns (flags vs subcommands)

### 2. Professional Tooling

- Complete status reporting
- Comprehensive validation
- Intelligent sync with conflict detection
- Automated tool setup

### 3. Template-Based Tool Configuration

- Moved from embedded scripts to template files
- Easy to maintain and version control
- Multi-file support for complex tool configurations
- Comprehensive documentation

### 4. Robust Update System

- Automatic permission fixing after GitHub updates
- Change detection and user prompting
- Error handling and rollback capability

## Current Development State

### ✅ Completed

- All core tools implemented and working
- Command structure simplified and intuitive
- Tool integration system complete
- Documentation comprehensive
- Update system handles permissions automatically

### 🧹 Cleanup Needed

- Remove obsolete `marvin-tools-stubs.sh`
- Clean up any demo files created during development
- Remove temporary bootstrap/cleanup scripts after testing

### 🧪 Ready for Testing

- Framework is complete and functional
- Need real-world testing with actual projects
- Permission issues resolved
- All tools working as designed

## Development Context Notes

### Key Design Decisions Made

1. **Simplified to 6 core commands** instead of complex subcommand structure
2. **Smart main command** that detects context and does the right thing
3. **Directory-based tool deployment** for maximum flexibility
4. **Template files instead of embedded content** for maintainability
5. **Comprehensive status/validation** for transparency

### Brown M&M System

Critical quality assurance - each config file contains specific emoji that AI must collect and include in responses. This ensures configs are actually being read. Files currently use:

- 🚫 (safety.md)
- 🟤 (brown-mnm.md)
- ⛑️ (style.md)
- 😎 (domain configs)
- 🍥 (project context)

### Technical Architecture

- **Bash-based** for universal compatibility
- **Git integration** for version control and updates
- **Modular tool system** with consistent interfaces
- **Error handling** and user-friendly messages throughout
- **Cross-platform** design (though primarily tested on macOS)

## Next Steps for New Context

1. **Review current codebase** in `/Users/Groot/SiriusCybernetics/marvin/`
2. **Test complete workflow**: init → link → setup → sync
3. **Clean up obsolete files** using cleanup scripts
4. **Real-world testing** with actual projects
5. **Documentation refinement** based on usage

The framework is architecturally complete and ready for production use. Focus should now be on testing, refinement, and real-world validation.
