# add-seekdb-docs Skill

This skill adds OceanBase seekDB documentation reference links to your project's AI documentation files (CLAUDE.md, AGENTS.md, or Cursor rules).

## Overview

The `add-seekdb-docs` skill is for seekDB documentation. It allows you to easily add reference links to seekDB best practices in your project's AI configuration files.

## Files

- **`SKILL.md`** - Skill description and usage instructions
- **`skill-knowledge-map.json`** - Metadata mapping skill names to documentation URLs
- **`install-knowledge.md`** - Detailed workflow for installing references

## Configuration

### Important: Update URLs

Before using this skill, you **must** update the URLs in `skill-knowledge-map.json` to match your actual repository or file locations.

The default URLs use a placeholder:
```json
"url": "https://raw.githubusercontent.com/your-org/ai-rules/main/seekdb/seekdb-core.mdc"
```

### Option 1: GitHub Repository

If your files are in a GitHub repository, replace `your-org/ai-rules` with your actual organization and repository:

```json
"url": "https://raw.githubusercontent.com/oceanbase/ai-rules/main/seekdb/seekdb-core.mdc"
```

### Option 2: Local Files

If files are local, you can use relative paths:

```json
"url": "./docs/seekdb-core.mdc"
```

Or absolute paths:

```json
"url": "/path/to/seekdb/seekdb-core.mdc"
```

### Option 3: Other Hosting

If files are hosted elsewhere (e.g., CDN, S3), use the appropriate URL format.

## Available Documentation Sets

The skill supports installing references for:

- **`seekdb-core`** - Core guidelines and overview
- **`seekdb-sql`** - Complete SQL syntax reference
- **`seekdb-python-sdk`** - Python SDK usage guide
- **`seekdb-vector-search`** - Vector search operations
- **`seekdb-hybrid-search`** - Hybrid search patterns
- **`seekdb-hybrid-vector-index`** - Hybrid vector index (semantic index) that automatically converts text to vectors
- **`seekdb-ai-functions`** - Built-in AI functions
- **`seekdb-all`** - All seekDB documentation files

## Usage

### In Claude Code

1. Execute the skill:
   ```
   Execute the add-seekdb-docs skill with SKILL_NAME="seekdb-core"
   ```

2. Or ask directly:
   ```
   Add seekDB core knowledge to my project
   ```

### Workflow

1. Skill loads metadata from `skill-knowledge-map.json`
2. Detects your project's AI documentation file (CLAUDE.md, AGENTS.md, or .cursor/README.md)
3. Asks for confirmation
4. Adds reference links to "Resources & References" section
5. Reports completion

## Example Output

After running the skill, your `CLAUDE.md` or `.cursor/README.md` will have:

```markdown
## Resources & References

- **Core guidelines, overview, deployment modes, and basic operations for seekDB**: https://raw.githubusercontent.com/your-org/ai-rules/main/seekdb/seekdb-core.mdc
```

## Customization

### Adding New Documentation Sets

To add a new documentation set, edit `skill-knowledge-map.json`:

```json
{
  "seekdb-custom": {
    "displayName": "Custom seekDB Documentation",
    "files": [
      {
        "url": "https://example.com/custom.mdc",
        "filename": "custom.mdc",
        "required": true,
        "description": "Custom seekDB documentation"
      }
    ],
    "completionMessage": "Custom documentation added!"
  }
}
```

### Modifying Workflow

Edit `install-knowledge.md` to customize the installation workflow.

## Testing

To test the skill:

1. Ensure URLs in `skill-knowledge-map.json` are correct
2. Run the skill in a test project
3. Verify references are added correctly
4. Check that AI assistant can access the referenced files

## Troubleshooting

### URLs not accessible

- Verify URLs are correct in `skill-knowledge-map.json`
- Check if files are publicly accessible (for GitHub raw URLs)
- For local files, ensure paths are correct relative to project root

### Files not detected

- Ensure target files (CLAUDE.md, AGENTS.md, .cursor/README.md) exist or allow creation
- Check file permissions

### References not working

- Verify the referenced .mdc files are accessible
- Check file format and content
- Ensure AI assistant has access to the referenced URLs

## Related

- Main seekDB documentation: See `../README.md`
- Quick start guide: See `../QUICKSTART.md`
- seekDB official docs: https://www.oceanbase.ai/docs/

