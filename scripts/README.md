# Knowledge Base Scripts

Automation scripts for quick setup and configuration.

## Usage

### Setup Testing
```bash
./scripts/setup-tests.sh
```
Installs Vitest + React Testing Library with full configuration.

### Setup CI/CD
```bash
./scripts/setup-cicd.sh
```
Creates GitHub Actions workflow for bun projects.

### Create Test File
```bash
./scripts/new-test.sh <test-name>
```
Creates a new test file with template.

## Examples

```bash
# Setup testing in any project
cd /path/to/project
/home/meep/scripts/setup-tests.sh

# Create a new test
/home/meep/scripts/new-test.sh user-profile
# Creates: src/app/user-profile.test.tsx
```

## Requirements
- Bun installed (`bun install` runs automatically)
- Project has `package.json`
- For React tests: React dependencies installed
