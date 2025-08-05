# templates/global/brown-m-and-m.md.template

```markdown
# AI Quality Assurance 🚫🟤

## The Brown M&M Test

This file implements a quality assurance system to ensure AI assistants actually read and process all your configuration files.

### How It Works

1. **Emoji Collection**: Each configuration file has an emoji in its title (e.g., "# My Identity 🌟")
2. **Response Validation**: AI must include ALL emoji from ALL files read at the end of every response
3. **Automatic Detection**: The system automatically generates the expected emoji sequence
4. **Quality Verification**: Missing or incorrect emojis indicate configuration wasn't properly read

### Critical Requirements for AI Assistants

**YOU MUST ALWAYS:**

1. **Read ALL configuration files** - Global, domain, project, and session configs
2. **Collect emoji immediately** - As you read each file, note its title emoji
3. **Include ALL emoji** - At the end of EVERY response, list all emoji from all files read
4. **Maintain order** - List emoji in the order files were read
5. **No spaces between emoji** - Concatenate directly: 🌟💻🎲📋

### Example Response Format

```
[Your response content here]

[AI model used: Claude Sonnet 4]
🌟💻🎲📋
```

### Emoji Reference

**Global Configuration Emoji:**
- 🌟 Identity and background
- 🎨 Communication style and preferences  
- 🛡️ Safety rules and boundaries
- 🚫🟤 Quality assurance (this file)

**Domain Configuration Emoji:**
- 💻 Software development and coding
- ✍️ Writing and content creation
- 🔬 Research and analysis
- 🎲 RPG campaigns and game mastering
- 💼 Business and professional work
- [Add others as needed]

**Project Configuration Emoji:**
- 📋 Project context and requirements
- 🔄 Session context and current work
- [Project-specific emoji as needed]

### Why This Matters

**Common AI Assistant Problems:**
- Skipping configuration files due to length or complexity
- Not integrating multiple sources of context properly
- Inconsistent behavior across different sessions
- Missing critical safety rules or preferences

**The Brown M&M Test Solves This By:**
- Providing immediate feedback when configs aren't read
- Making it impossible to fake reading configurations
- Creating accountability for comprehensive context processing
- Enabling rapid troubleshooting of AI behavior issues

### Framework Integration

This quality assurance system is automatically integrated into Marvin:

1. **Template Integration**: All templates include appropriate emoji
2. **Sync Validation**: Deployment tools verify emoji sequences
3. **Automatic Generation**: Expected emoji sequences are calculated automatically
4. **Tool Integration**: All AI tool deployments include Brown M&M instructions

### Troubleshooting

**If AI responses don't include expected emoji:**
1. Check that all configuration files have emoji in titles
2. Verify AI tool is reading from correct configuration locations
3. Confirm configuration deployment was successful
4. Test with a simple request to isolate the issue

**If emoji sequence is wrong:**
1. Compare expected vs actual emoji sequence
2. Identify which configuration files are missing or extra
3. Check for file permission or symlink issues
4. Validate configuration file syntax and formatting

### Customization

**Emoji Selection Guidelines:**
- Choose distinctive, memorable emoji for each configuration area
- Avoid emoji that might be filtered or unavailable in some contexts
- Use emoji that relate to the content area when possible
- Maintain consistency across similar configuration types

**Adding New Domains:**
1. Choose an appropriate emoji for the new domain
2. Add it to the emoji reference list above
3. Update framework tools to recognize the new emoji
4. Test the complete emoji sequence with AI tools

---

*The Brown M&M test is named after Van Halen's famous contract rider that required a bowl of M&Ms with all brown ones removed. It was a simple test to verify that venues had read and followed all contract requirements carefully. Similarly, this emoji test verifies that AI assistants have read and processed all your configuration requirements.*
```