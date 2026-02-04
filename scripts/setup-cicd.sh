#!/bin/bash
# Usage: ./setup-cicd.sh
# Sets up GitHub Actions CI/CD workflow

echo "Creating GitHub Actions workflow..."

mkdir -p .github/workflows

cat > .github/workflows/ci.yml << 'EOF'
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
EOF

echo "✅ CI/CD workflow created!"
echo "File: .github/workflows/ci.yml"
