# Getting Started with Marvin

## Installation

### 1. Clone the Framework
```bash
git clone https://github.com/yourusername/marvin.git ~/.marvin/framework
```

### 2. Run Setup
```bash
~/.marvin/framework/setup
```

### 3. Add to PATH (if needed)
Add to your `.bashrc` or `.zshrc`:
```bash
export PATH="$HOME/bin:$PATH"
```

## Your First Configuration

### 1. Create Your Identity
```bash
marvin edit global/identity.md
```

Fill in your background, experience, and working style. This forms the foundation of all AI interactions.

### 2. Set Up Your Primary Domain
Most people start with either coding or writing:

```bash
# For developers
marvin edit domains/coding.md

# For writers
marvin edit domains/writing.md
```

### 3. Link Your First Project
```bash
marvin link my-project /path/to/existing/project
```

Or create a new project:
```bash
marvin create my-project coding
```

### 4. Deploy to Your AI Tools
```bash
# Deploy to Cursor IDE
marvin sync my-project cursor

# Deploy to Claude Projects
marvin sync my-project claude
```

## Understanding the Configuration Layers

Marvin uses a layered configuration system:

1. **Global** (`~/.marvin/configs/global/`)
   - Your identity and universal preferences
   - Applied to every AI interaction

2. **Domain** (`~/.marvin/configs/domains/`)
   - Specific to types of work (coding, writing, etc.)
   - Applied to all projects in that domain

3. **Project** (`~/.marvin/configs/projects/`)
   - Specific context for individual projects
   - Combined with global and domain configs

4. **Session** (`~/.marvin/configs/sessions/`)
   - Auto-managed temporary context
   - Maintains continuity between AI chats

## Common Workflows

### Daily Development Work
1. Start work on a project
2. AI tools automatically have your context
3. Session context accumulates as you work
4. Switch projects - context switches automatically

### Setting Up a New Machine
1. Clone your configs: `git clone <your-configs-repo> ~/.marvin/configs`
2. Run setup: `marvin sync all`
3. All AI tools configured consistently

### Adding a New AI Tool
1. Create sync target in framework
2. Define configuration format for that tool
3. Test with existing project
4. Add to regular sync workflow

## Tips for Success

### Start Simple
- Begin with basic identity and one domain
- Add complexity gradually as you learn what works
- Don't over-configure initially

### Be Consistent
- Update configurations when you learn new preferences
- Keep project contexts current
- Regular validation helps catch issues early

### Version Everything
- Commit configuration changes regularly
- Use branches to experiment with new approaches
- Tag stable configurations for easy rollback

### Customize for Your Workflow
- The framework provides structure, not rigid rules
- Adapt the tools and templates to your specific needs
- Share successful patterns with the community

## Next Steps

1. **Explore Examples**: Look at the `docs/examples/` directory
2. **Customize Tools**: Modify the sync and link tools for your setup
3. **Create Templates**: Build templates based on your successful projects
4. **Join Community**: Share your configurations and learn from others

## Troubleshooting

### Common Issues

**marvin command not found**
- Make sure `~/bin` is in your PATH
- Check that the symlink was created: `ls -la ~/bin/marvin`

**Configurations not being applied**
- Run `marvin validate` to check for issues
- Verify AI tools are reading from the correct locations
- Check file permissions and symlink integrity

**Conflicting configurations**
- Use layered approach - more specific configs override general ones
- Document any intentional conflicts
- Regular validation helps catch accidental conflicts

**Git issues in configs directory**
- Configs directory should be its own git repository
- Don't mix framework and personal configs in same repo
- Use `.gitignore` to exclude sensitive information

For more help, see the full documentation or open an issue on GitHub.