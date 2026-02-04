# Opencode Lessons Learned

## Patterns to Remember

### 1. Plan First
- Always write a plan to `tasks/todo.md` for any task with 3+ steps
- Get user verification before implementing

### 2. Package Manager: Bun
- Use `bun install`, `bun run`, `bun test`
- Prioritize bun over npm and deno

### 3. Testing with Vitest + React Testing Library
- Install: `bun add -D vitest @testing-library/react jsdom @testing-library/jest-dom`
- Setup file: import `@testing-library/jest-dom` in `src/test/setup.ts`
- Config: `vitest.config.ts` with jsdom environment

### 4. Next.js App Router Structure
```
src/app/
  layout.tsx      # Root layout with metadata
  page.tsx        # Main page component
  api/route.ts    # API endpoints
```

### 5. CI/CD Pipeline
- GitHub Actions: `.github/workflows/ci.yml`
- Vercel deployment only after CI passes
- Use `bun run lint`, `bun run test:run`, `bun run build`

### 6. Auto-Fix Errors
- Test failures: Fix assertions, update test cases
- Build errors: Resolve imports, fix TypeScript
- Linting: Run `bun run lint --fix`

### 7. Git Workflow
- Initialize git before first commit
- Commit with descriptive messages
- Pre-commit hooks will scan for secrets

## Global Knowledge Base

**Also see:** `/home/meep/` for cross-session knowledge base with:
- `kbase` - Show all resources
- `ksearch <query>` - Search lessons
- `ktemplate <name>` - Copy template
- `ksetup <script>` - Run setup script

## Commands Reference

```bash
bun install           # Install dependencies
bun run dev           # Development server
bun run build         # Production build
bun run test:run      # Run tests once
bun run lint          # Lint code
```
