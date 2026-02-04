# AI Knowledge Base

**Location:** `/home/meep/`
**Auto-loaded:** Yes (via `~/.bashrc.d/ai-knowledge-base.sh`)

## Purpose

Persist patterns, templates, and learnings across AI sessions that would otherwise be lost.

## How It Works

1. **Session Startup**: `~/.bashrc.d/ai-knowledge-base.sh` auto-loads
2. **Environment Variables**: `AI_KNOWLEDGE_BASE`, `LESSONS_PATH`, etc. set
3. **Quick Access**: Aliases `kbase`, `ksearch`, `ktemplate`, `ksetup`, `kcontext`
4. **Future Sessions**: Automatically see and can use all resources

## Quick Commands

```bash
kbase              # Show all resources
ksearch vitest     # Search lessons for "vitest"
ktemplate vitest.config.ts  # Copy template to current dir
ksetup setup-tests.sh       # Run setup script
kcontext           # Show current session context
```

## Structure

```
/home/meep/
├── current-context.md       # Session continuity
├── lessons/                 # Pattern library
│   ├── README.md
│   ├── testing/
│   ├── ci-cd/
│   ├── debugging/
│   ├── errors/
│   └── languages/
├── templates/               # Copy-paste configs
│   ├── package.json
│   ├── vitest.config.ts
│   ├── test-setup.ts
│   └── github-workflow-ci.yml
└── scripts/                 # Automation
    ├── setup-tests.sh
    ├── setup-cicd.sh
    └── new-test.sh
```

## Quick Start

### Search for patterns
```bash
grep -r "vitest" /home/meep/lessons/
grep -r "CI/CD" /home/meep/lessons/
grep -r "fetch" /home/meep/lessons/errors/
```

### Setup testing
```bash
/home/meep/scripts/setup-tests.sh
```

### Setup CI/CD
```bash
/home/meep/scripts/setup-cicd.sh
```

### Add test file
```bash
/home/meep/scripts/new-test.sh my-component
```

## Adding Content

### New Lesson
Create: `lessons/{category}/YYYY-MM-DD-topic.md`
```markdown
# Topic Title

**Date:** YYYY-MM-DD

## Problem
Brief description...

## Solution
Code example...

## Tags
tag1, tag2, tag3
```

### New Template
Add to `templates/` with clear placeholders.

### New Script
Make executable: `chmod +x scripts/my-script.sh`

## Best Practices

1. **Framework-agnostic** - Works with any stack
2. **Copy-paste ready** - Templates should work without modification
3. **Searchable** - Use consistent tags and filenames
4. **Dated** - Include date for freshness tracking
5. **Verified** - Only add patterns that work

## Related

- AGENTS.md - Workflow guidelines
- OPENCODE.md - Deployment automation
- `/home/meep/demo-project/` - Proof-of-concept project
