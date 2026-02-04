# Bun CI/CD Workflow Template

**Date:** 2026-02-03

## GitHub Actions Template

```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  build-and-test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Setup Bun
        uses: oven-sh/setup-bun@v2
        with:
          bun-version: latest

      - name: Install dependencies
        run: bun install

      - name: Run linter
        run: bun run lint

      - name: Run tests
        run: bun run test:run

      - name: Build application
        run: bun run build
```

## Key Points

1. **Oven-sh/setup-bun** is the official Bun action
2. Run lint before tests (faster failure)
3. Run tests before build (fail fast)
4. All commands use `bun run` prefix

## Alternative: With Vercel Deployment

```yaml
deploy-vercel:
  needs: build-and-test
  runs-on: ubuntu-latest
  if: github.ref == 'refs/heads/main'
  
  steps:
    - name: Checkout code
      uses: actions/checkout@v4

    - name: Install Vercel CLI
      run: npm i -g vercel@latest

    - name: Deploy to Vercel
      run: vercel --prod --token=${{ secrets.VERCEL_TOKEN }}
      env:
        VERCEL_TOKEN: ${{ secrets.VERCEL_TOKEN }}
        VERCEL_ORG_ID: ${{ secrets.VERCEL_ORG_ID }}
        VERCEL_PROJECT_ID: ${{ secrets.VERCEL_PROJECT_ID }}
```

## Secrets Required
- `VERCEL_TOKEN` - Vercel API token
- `VERCEL_ORG_ID` - Organization ID
- `VERCEL_PROJECT_ID` - Project ID

## Tags
bun, ci-cd, github-actions, vercel, deployment
