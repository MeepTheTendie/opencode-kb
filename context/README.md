# Context Index

All context files for AI-assisted development.

## Quick Commands

```bash
kctx              # List all contexts
kctx-load <name> # Load a context
kctx-save <name> "<text>"  # Save text to context
kctx-current     # Show current contexts
kctx-readme      # Show this file
kctx-start       # Show session history
kctx-end "<summary>"  # Save session summary
```

## Available Contexts

| Context | Purpose |
|---------|---------|
| `project` | Current project context |
| `tech-stack` | Technologies in use |
| `patterns` | Common patterns reference |
| `preferences` | User preferences |
| `session-history` | Session summary |

## Usage Examples

```bash
# Load tech stack context
kctx load tech-stack

# Load project context
kctx load project

# Save a note to a context
kctx.save session-history "- New pattern discovered"

# Append to session history
kctx.append session-history "- Completed task X"

# List all contexts
kctx
```

## Adding New Contexts

1. Create `/home/meep/context/new-context.md`
2. It automatically appears in `kctx` list
3. Use `kctx load new-context` to read it

## Auto-Update

- Session end: summaries auto-save to `session-history.md`
- Session start: `session-history.md` loads for continuity

## Related

- Knowledge base: `/home/meep/lessons/`
- Templates: `/home/meep/templates/`
- Scripts: `/home/meep/scripts/`
