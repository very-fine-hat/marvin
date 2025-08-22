# AI Quality Assurance 🚫🟤

## CRITICAL REQUIREMENTS FOR ALL CHATS

When you respond to any chat messages you MUST ALWAYS do the following:

1. **Read ALL configuration files** - Global, domain, project, and session configs
2. **Collect emoji IMMEDIATELY** - As you read each file, note its title emoji
3. **Include ALL emoji** - At the end of EVERY response, list all emoji from all files read
4. **Maintain reading order** - List emoji in the order files were read
5. **No spaces between emoji** - Concatenate directly: 🌟💻🎲📋
6. **ALWAYS ensure you are following the Emoji Test instructions** described below

- This requirement applies to ALL messages, even simple ones like "tell me a joke"
- If you haven't read all configuration files, your response should start with "Let me get up to date on our context"
- This is a HARD REQUIREMENT - there are no exceptions

## Brown M&M Emoji Test 🚫🟤

### Emoji Collection Rules

1. Each configuration file may have an emoji (or sequence) in one of these formats:

   - **In the first line after a markdown title**: "# Title 💩"
   - **In a YAML frontmatter description**: "description: Title 💩"

2. After reading ANY configuration file, you must:
   - Include ALL emoji from ALL files you have read in EVERY response
   - Place the emoji on their own line at the end of the response
   - List the emoji in the order the files were read
   - Include no spaces between emoji
   - Include ALL emoji with no exceptions

### Emoji Collection Process

- Collect emoji IMMEDIATELY after reading each file (including this one)
- Maintain a running list of emoji in the order files are read
- Do not wait until all files are read to collect emoji
- This ensures no emoji are missed and the correct order is maintained

### Critical Notes

- **Only use emoji that appear in the title line or frontmatter description**
- **The emoji must be at the end of the title/description line**
- **Multiple emoji in the same line should all be included** (e.g., "# Title 🌟✨" would contribute both 🌟 and ✨)
- **Do not include emoji that appear elsewhere in the files**
- All emoji are equal in importance
- Do not skip emoji from any file you've read
- If you haven't read a file, do not include its emoji

### Example Response Format

```
[Your response content here]

[AI model used: Claude Sonnet 4]
🌟💻🎲📋🚫🟤
```

## Special Command: "explain emoji sequence"

When you receive the command **"explain emoji sequence"**, you must:

1. **List each emoji** from your last response in order
2. **Identify the source file** for each emoji
3. **Show the exact title line** where each emoji was found
4. **Confirm the reading order** of configuration files
5. **Note if any files contain duplicate emoji** (and if not, say "All files have unique emoji.")

### Example Response to "explain emoji sequence":

```
Emoji sequence from last response: 🌟💻🎲📋🚫🟤

Source breakdown:
🌟 - From "# My AI Identity 🌟" in global/identity.md
💻 - From "# Coding Domain Configuration 💻" in domains/coding.md
🎲 - From "# RPG Campaign Domain Configuration 🎲" in domains/rpg.md
📋 - From "# Project Context 📋" in projects/current-project/context.md
🚫🟤 - From "# AI Quality Assurance 🚫🟤" in global/brown-m-and-m.md

Files were read in this order:
1. global/identity.md
2. domains/coding.md
3. domains/rpg.md
4. projects/current-project/context.md
5. global/brown-m-and-m.md

All configuration files were successfully read and processed.  All files have unique emoji.
```

This command helps verify:

- All expected configuration files were actually read
- Emoji were collected from correct title lines
- Files were processed in logical order
- No configuration files were missed or skipped

## Why This Matters

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

_The Brown M&M test is named after Van Halen's famous contract rider that required a bowl of M&Ms with all brown ones removed. It was a simple test to verify that venues had read and followed all contract requirements carefully. Similarly, this emoji test verifies that AI assistants have read and processed all your configuration requirements._
