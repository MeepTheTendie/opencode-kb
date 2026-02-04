# Vitest + React Testing Library Setup

**Date:** 2026-02-03

## Problem
Tests using React Testing Library fail with:
```
Invalid Chai property: toBeInTheDocument
```

## Solution

### 1. Install dependencies
```bash
bun add -D vitest @testing-library/react jsdom @testing-library/jest-dom
```

### 2. Create setup file
```typescript
// src/test/setup.ts
import '@testing-library/jest-dom'
import { cleanup } from '@testing-library/react'
import { afterEach } from 'vitest'

afterEach(() => {
  cleanup()
})
```

### 3. Configure vitest
```typescript
// vitest.config.ts
import { defineConfig } from 'vitest/config'
import react from '@vitejs/plugin-react'
import { resolve } from 'path'

export default defineConfig({
  plugins: [react()],
  test: {
    environment: 'jsdom',
    setupFiles: ['./src/test/setup.ts'],
    include: ['**/*.test.{ts,tsx}'],
    globals: true,
  },
  resolve: {
    alias: {
      '@': resolve(__dirname, './src'),
    },
  },
})
```

### 4. Update package.json scripts
```json
{
  "scripts": {
    "test": "vitest",
    "test:run": "vitest run"
  }
}
```

## Common Matchers Available
- `toBeInTheDocument()`
- `toHaveTextContent()`
- `toHaveStyle()`
- `toBeChecked()`
- `toHaveValue()`
- `toBeDisabled()`
- `not.toBeInTheDocument()`

## Tags
vitest, testing-library, react, jest-dom, setup
