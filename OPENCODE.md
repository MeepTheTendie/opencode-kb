# OPENCODE Universal Configuration

This file defines opencode's behavior across all codebases with automated deployment pipeline management and error correction capabilities.

## Purpose

- Universal opencode configuration for any codebase
- Automated deployment to GitHub with CI/CD error correction
- Conditional Vercel deployment for web UI applications
- Self-healing deployment pipelines
- Package manager preference: **bun** over npm and deno

## Automatic Startup Behaviors

When entering any codebase, opencode will automatically:

1. **Repository Analysis**
   - Detect technology stack
   - Identify package managers (prioritize bun)
   - Analyze code structure and quality
   - Check for existing remote repositories

2. **Code Quality Assessment**
   - Security vulnerability scanning
   - Dependency audit (using bun audit)
   - Code style validation
   - Performance bottleneck identification

3. **Testing Infrastructure Check**
   - Verify testing setup
   - Check test coverage
   - Identify missing tests

## Deployment Pipeline Configuration

### GitHub Integration

#### Auto-Push Behavior
- Automatically push all code changes to GitHub
- Set up GitHub remote if not configured
- Commit with descriptive messages

#### CI/CD Monitoring
- Monitor GitHub Actions or other CI/CD pipelines
- Detect build failures, test failures, linting errors
- Track deployment status in real-time

#### Error Correction & Recovery
- **Auto-fix all CI/CD failures**:
  - Test failures: Fix broken tests, update test cases
  - Build errors: Resolve import issues, fix syntax errors
  - Linting errors: Apply code formatting fixes
  - Missing dependencies: Install using bun install
- Automatically retry deployment after fixes
- Loop until CI/CD pipeline passes completely

### Vercel Integration

#### Web UI Detection
Detect web applications using combined approach:
- **Framework Detection**: React, Next.js, Vue, Angular, Svelte, etc.
- **Package.json Scripts**: Look for build, start, dev, export scripts
- **File Structure Analysis**: Check for typical web app directories
  - `public/`, `src/`, `components/`, `pages/`, `assets/`
  - Framework-specific files (next.config.js, vue.config.js, etc.)

#### Conditional Deployment Sequence
1. **Prerequisite**: GitHub CI/CD pipeline must pass successfully
2. **Trigger**: Only if web UI is detected
3. **Deploy**: Automatically deploy to Vercel
4. **Monitor**: Track deployment status and runtime errors

#### Vercel Error Correction
- Auto-fix build failures (resolve dependency issues, fix configurations)
- Correct runtime errors (fix import paths, resolve missing assets)
- Handle configuration errors (update vercel.json, environment variables)
- Retry deployment until success

## Package Manager Hierarchy

**Priority Order**:
1. **bun** (primary preference)
2. npm (fallback)
3. deno (if bun/npm unavailable)

### bun-Specific Behaviors
- Use `bun install` for dependencies
- Use `bun run` for scripts
- Use `bun test` for testing
- Use `bun build` for bundling when applicable

## Automation Execution Order

### Complete Pipeline Flow

1. **Repository Entry**
   - Analyze codebase structure
   - Detect package managers (prefer bun)
   - Identify remote configurations

2. **Initial Analysis**
   - Code quality assessment
   - Security scanning
   - Dependency audit using bun
   - Testing infrastructure check

3. **GitHub Deployment**
   - Auto-push changes to GitHub
   - Monitor CI/CD pipeline
   - Auto-fix any failures
   - Retry until successful

4. **Web UI Detection**
   - Framework analysis
   - Package.json script examination
   - File structure validation

5. **Vercel Deployment** (Conditional)
   - Only if web UI detected AND GitHub CI/CD passed
   - Deploy to Vercel
   - Monitor for errors
   - Auto-fix and retry if needed

## Error Correction Capabilities

### CI/CD Error Types
- **Test Failures**: Fix broken assertions, update test cases
- **Build Errors**: Resolve import issues, fix TypeScript errors
- **Linting Errors**: Apply automatic formatting, fix style violations
- **Missing Dependencies**: Install using bun install
- **Configuration Issues**: Fix package.json, tsconfig.json, etc.

### Vercel Error Types
- **Build Failures**: Resolve dependency conflicts, fix build scripts
- **Runtime Errors**: Fix import paths, resolve missing assets
- **Configuration Problems**: Update vercel.json, set environment variables

## Authentication & Configuration

### Required Credentials
- GitHub token with repository access
- Vercel API token for deployments
- Repository permissions for commits and deployments

### Auto-Detection
- Automatically detect GitHub repository URLs
- Identify Vercel project configurations
- Set up necessary API connections

## Monitoring & Reporting

### Status Tracking
- Real-time deployment status updates
- Error detection and resolution logging
- Success notifications for both GitHub and Vercel

### Error Logging
- Detailed error reports
- Automated fix descriptions
- Retry attempt tracking

### Success Confirmation
- GitHub deployment success confirmation
- Vercel deployment URL notification (when applicable)

## Default Behaviors

### On Any Code Change
1. Push to GitHub automatically
2. Wait for CI/CD completion
3. Fix any failures that occur
4. Deploy to Vercel if web UI detected
5. Monitor and fix Vercel deployment issues

### On Repository Initialization
1. Set up GitHub remote if missing
2. Configure Vercel project if web UI detected
3. Establish monitoring pipelines
4. Run initial deployment sequence

## Special Instructions

- Always prefer bun over npm and deno for package management
- Never deploy to Vercel if GitHub CI/CD has not passed
- Continue error correction loops until both deployments succeed
- Maintain detailed logs of all automated fixes and deployments
- Respect repository-specific configurations when they exist

---

**This configuration file ensures opencode acts as a complete, self-healing deployment automation system for all your codebases.**