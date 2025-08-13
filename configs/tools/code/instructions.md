# Claude Code Instructions

## CRITICAL: Read ALL ai-marvin/ files in order

You MUST read ALL files in the ai-marvin/ directory in this specific order:

### 1. Always files (read FIRST)
- `ai-marvin/global/always/brown-mnm.md` - **READ THIS FIRST** (Brown M&M quality assurance)
- `ai-marvin/global/always/safety.md` - AI safety rules and boundaries  
- `ai-marvin/global/always/style.md` - Interaction style preferences

### 2. Global configurations
- All remaining files in `ai-marvin/global/`

### 3. Domain configurations
- All files in `ai-marvin/[domain]/always/` (if exists)
- All remaining files in `ai-marvin/[domain]/`

### 4. Project configurations  
- All files in `ai-marvin/project/always/` (if exists)
- All remaining files in `ai-marvin/project/`

## Quality Assurance

The brown-mnm.md file contains the Brown M&M test. You MUST follow its emoji 
collection instructions and include emoji from ALL files read in your responses.

## Important

- Files in `always/` directories must be read before other files in the same layer
- This ensures critical configurations are processed first
- All configurations are essential for consistent AI assistance
