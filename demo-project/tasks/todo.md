# Deployment Automation Demo - Project Plan

## Goal
Create a complete web application that demonstrates all opencode capabilities from AGENTS.md and OPENCODE.md.

## Tasks

### Phase 1: Project Setup
- [x] Initialize Next.js project with bun
- [x] Set up TypeScript configuration
- [x] Install and configure testing framework (Vitest)
- [x] Create basic project structure

### Phase 2: Application Development
- [x] Create main page component
- [x] Add API route for demonstration
- [x] Implement features with tests
- [x] Add intentional bug for auto-fix demonstration

### Phase 3: CI/CD Pipeline
- [x] Create GitHub Actions workflow
- [x] Configure build and test automation
- [x] Set up linting with auto-fix capability

### Phase 4: Deployment Configuration
- [x] Configure Vercel deployment settings
- [x] Set up environment variables
- [x] Test deployment pipeline

### Phase 5: Verification & Demonstration
- [x] Run full test suite
- [x] Verify CI/CD passes
- [x] Demonstrate auto-fix capabilities
- [x] Document lessons learned

## Success Criteria
- [x] All tests pass (6/6)
- [x] CI/CD pipeline configured (GitHub Actions)
- [x] Vercel deployment configured
- [x] Auto-fix capabilities demonstrated (test bug → fix)
- [x] tasks/lessons.md updated with patterns

## Review Section

### What Worked
- Bun as package manager was fast and reliable
- Plan-first approach kept execution focused
- Vitest + React Testing Library integration smooth
- Auto-fix demonstration proved CI/CD error recovery

### Key Takeaways
1. Always use bun over npm for performance
2. Test setup requires @testing-library/jest-dom for assertions
3. Next.js API routes need absolute URLs in useEffect for test compatibility
4. CI/CD pipeline catches failures before deployment

### Files Created
- `src/app/page.tsx` - Main todo app
- `src/app/page.test.tsx` - 6 passing tests
- `.github/workflows/ci.yml` - GitHub Actions pipeline
- `vercel.json` - Vercel deployment config
- `tasks/lessons.md` - Self-improvement documentation
- `vitest.config.ts` - Test configuration

### Commands Available
```bash
bun run dev       # Development
bun run build     # Production build
bun run test:run  # Run tests
bun run lint      # Lint code
```
