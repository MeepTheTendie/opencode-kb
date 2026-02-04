# Technology Stack

## Package Managers (Priority Order)
1. **Bun** - Primary package manager
2. **npm** - Fallback
3. **asdf** - Version management for runtimes

## Languages
- TypeScript/JavaScript
- Elixir (in PATH: `$HOME/elixir/bin`)

## Frameworks
- Next.js (App Router)
- React
- Vitest (testing)

## Tools
- Git
- GitHub Actions (CI/CD)
- Vercel (deployment)
- Fly.io (`$HOME/.fly/bin`)
- WezTerm (terminal)

## Databases
- Convex (`VITE_CONVEX_URL` set)
- Supabase (`VITE_SUPABASE_URL`, `VITE_SUPABASE_ANON_KEY` set)

## Key Paths
```
/home/meep/.bun/bin      # Bun CLI
/home/meep/.fly/bin      # Fly.io CLI
/home/meep/.local/bin    # Local binaries
/home/meep/.config/      # App configs
```

## Environment Variables
- `BUN_INSTALL`
- `FLYCTL_INSTALL`
- `VITE_CONVEX_URL`
- `VITE_SUPABASE_URL`
- `VITE_SUPABASE_ANON_KEY`
- `VERCEL_PROJECT_ID`
