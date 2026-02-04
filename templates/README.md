# Configuration Templates

Copy-paste templates for common configurations.

## Templates

### package.json
Basic template with Bun + Vitest scripts.
```bash
cp /home/meep/templates/package.json ./
```

### vitest.config.ts
Vitest configuration with React and jsdom.
```bash
cp /home/meep/templates/vitest.config.ts ./
```

### test-setup.ts
Testing Library setup with jest-dom imports.
```bash
cp /home/meep/templates/test-setup.ts src/test/setup.ts
```

### github-workflow-ci.yml
GitHub Actions CI/CD pipeline for bun projects.
```bash
cp /home/meep/templates/github-workflow-ci.yml .github/workflows/ci.yml
```

## Customization

Replace placeholders:
- `{{PROJECT_NAME}}` - Your project name
- `{{DEV_COMMAND}}` - Development command (e.g., `next dev`)
- `{{BUILD_COMMAND}}` - Build command (e.g., `next build`)
- `{{START_COMMAND}}` - Start command (e.g., `next start`)
- `{{LINT_COMMAND}}` - Lint command (e.g., `next lint`)
