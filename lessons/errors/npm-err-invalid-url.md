# NPM/Node Fetch Invalid URL Error

**Date:** 2026-02-03

## Error
```
TypeError: Failed to parse URL from /api/hello
code: 'ERR_INVALID_URL'
input: '/api/hello'
```

## Context
`fetch('/api/hello')` fails with relative URL in Node.js/test environment.

## Root Cause
- `fetch()` in Node.js requires absolute URLs
- Relative URLs (`/api/hello`) work in browsers but not in Node/test environments
- `jsdom` test environment doesn't resolve relative URLs automatically

## Solution
Use `window.location.origin` to build absolute URL:
```typescript
const url = `${window.location.origin}/api/hello`
fetch(url)
```

## Alternative Solutions

### 1. MSW (Mock Service Worker)
```typescript
import { setupServer } from 'msw/node'
const server = setupServer()
```

### 2. Environment check
```typescript
const baseUrl = typeof window !== 'undefined' 
  ? window.location.origin 
  : 'http://localhost:3000'
```

### 3. Use absolute paths in configuration
Some frameworks (Next.js) handle this automatically in API routes.

## Prevention
- Always use absolute URLs in `fetch()` calls
- Wrap in helper function
- Test in jsdom environment before deployment

## Tags
fetch, url, node, testing, jsdom, invalid-url
