# Pre-commit Secret Scanning

**Date:** 2026-02-03

## Problem
Pre-commit hooks flag patterns that look like secrets:
```
⚠️  WARNING: Potential secrets detected in staged files!
+        run: vercel --prod --token=${{ secrets.VERCEL_TOKEN }}
```

## Context
The scanner flags placeholder patterns (`${{ secrets.X }}`) as potential secrets because they match secret-looking patterns.

## Solution

**This is expected behavior.** The warning is a false positive - the scanner is doing its job by being cautious.

**Options:**

### 1. Accept the warning (recommended)
```
✅ Pre-commit scan completed with warnings
```
- The warning is acceptable for placeholder patterns
- Real secrets would be the actual values, not template syntax

### 2. Suppress specific patterns (if needed)
Add to `.pre-commit-config.yaml`:
```yaml
repos:
  - repo: local
    hooks:
      - id: secret-scan
        exclude: '\${{ secrets\.[A-Z_]+ }}'
```

### 3. Disable scanning entirely (not recommended)
```bash
git config core.preCommit false
```

## Best Practice

**Never commit real secrets:**
- Use environment variables
- Use secret management tools (Vault, AWS Secrets Manager)
- Use CI/CD secrets (GitHub Secrets, Vercel Environment Variables)

**Safe patterns:**
```yaml
# OK - uses secrets from CI/CD
token: ${{ secrets.GITHUB_TOKEN }}

# OK - placeholder syntax
VERCEL_TOKEN: ${{ secrets.VERCEL_TOKEN }}

# NOT OK - actual value committed
token: ghp_real_token_here
```

## Tags
pre-commit, secrets, security, false-positive, ci-cd
