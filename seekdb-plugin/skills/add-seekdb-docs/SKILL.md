---
name: add-seekdb-docs
description: Use this skill when the user asks to add documentation, add docs, add references, or install documentation about OceanBase seekDB. Adds seekDB best practices reference links to project AI documentation (CLAUDE.md, AGENTS.md, or Cursor rules). Does not install packages or modify code.
allowed-tools: ["read_file", "write", "bash", "AskUserQuestion"]
---

# Add seekDB Knowledge References to Project

This skill adds reference links to OceanBase seekDB documentation and best practices in your project's AI documentation file, enabling AI assistants to quickly access seekDB-specific patterns and guidelines without cluttering your project with large documentation files.

## How It Works

This skill follows a simple workflow:

1. **Load metadata** - Read skill information from `skill-knowledge-map.json`
2. **Detect documentation file** - Find `CLAUDE.md`, `AGENTS.md`, or Cursor rules files
3. **Ask permission** - Show what will be added and where
4. **Add references** - Insert URLs in a "Resources & References" section
5. **Report completion** - Confirm successful installation

For detailed workflow steps, see `install-knowledge.md`.

## Parameters

### SKILL_NAME Parameter

Optional. Specifies which skill documentation to install (e.g., `"seekdb-core"`, `"seekdb-sql"`, `"seekdb-python-sdk"`). If not provided, you'll be prompted to choose from available skills defined in `skill-knowledge-map.json`.

## Usage Examples

**Called from another skill:**
```markdown
Execute the add-seekdb-docs skill with SKILL_NAME="seekdb-core"
```

**Called directly by user:**
- "Add seekDB core knowledge to my project"
- "Install seekDB SQL documentation"
- "Set up seekDB best practices for my AI assistant"
- "Add seekDB Python SDK references"

## What Gets Added

References are added to a "Resources & References" section in your AI documentation file:

```markdown
## Resources & References

- **seekDB Core Guidelines**:~/.claude/plugins/marketplaces/seekdb-marketplace/seekdb-plugin/skills/add-seekdb-docs/docs/seekdb-core.mdc
- **seekDB SQL Reference**:~/.claude/plugins/marketplaces/seekdb-marketplace/seekdb-plugin/skills/add-seekdb-docs/docs/seekdb-sql.mdc
```

### Target Files (in priority order):
- `CLAUDE.md` - Most common for Claude Code projects
- `AGENTS.md` - Custom AI documentation files
- `.cursor/README.md` or `.cursor/rules.md` - Cursor IDE projects
- Creates `CLAUDE.md` if none exist

### Behavior:
- Existing "Resources & References" sections: New links are appended
- No existing section: Section is created at end of file
- No documentation file: `CLAUDE.md` is created with references

## Available Documentation Sets

The skill can install references for:

- **seekdb-core** - Core guidelines and overview
- **seekdb-sql** - Complete SQL syntax reference
- **seekdb-python-sdk** - Python SDK usage guide
- **seekdb-vector-search** - Vector search and similarity operations
- **seekdb-hybrid-search** - Hybrid search patterns
- **seekdb-hybrid-vector-index** - Hybrid vector index (semantic index) that automatically converts text to vectors
- **seekdb-ai-functions** - Built-in AI functions
- **seekdb-all** - All seekDB documentation files

## Workflow Reference

For complete implementation details:
- **Workflow**: `install-knowledge.md` - Step-by-step agent workflow with error handling
- **Metadata**: `skill-knowledge-map.json` - Skill definitions and reference URLs

---

## Workflow Implementation

Now I'll execute the installation workflow for you.

**Parameter received**: SKILL_NAME = ${SKILL_NAME || "not provided - will ask user"}

Execute `install-knowledge.md` with the specified SKILL_NAME.

