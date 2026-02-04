# Common Patterns

## Testing Pattern
```typescript
// vitest + react-testing-library
import { render, screen, fireEvent } from '@testing-library/react'
import { describe, it, expect } from 'vitest'

describe('Component', () => {
  it('renders', () => {
    render(<Component />)
    expect(screen.getByText('text')).toBeInTheDocument()
  })
})
```

## CI/CD Pattern
```yaml
# GitHub Actions with Bun
- uses: oven-sh/setup-bun@v2
  with:
    bun-version: latest
- run: bun install
- run: bun run test:run
- run: bun run build
```

## Fetch Pattern (Node.js)
```typescript
// Use absolute URL
const url = `${window.location.origin}/api/endpoint`
const res = await fetch(url)
const data = await res.json()
```

## Component Pattern (Next.js App Router)
```typescript
// src/app/page.tsx
'use client'
import { useState } from 'react'

export default function Page() {
  const [state, setState] = useState(initial)
  return <div>{state}</div>
}
```

## API Route Pattern
```typescript
// src/app/api/route.ts
import { NextResponse } from 'next/server'

export async function GET() {
  return NextResponse.json({ data: 'value' })
}
```

## Related
- Full patterns: `/home/meep/lessons/`
- Templates: `/home/meep/templates/`
