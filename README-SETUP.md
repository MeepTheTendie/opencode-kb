# OPENCODE Universal Setup

## What's Configured

- **OPENCODE.md**: Universal configuration file for opencode behavior
- **Git Templates**: Automatic setup for new repositories
- **Shell Functions**: Easy management for existing repositories

## How It Works

### For New Repositories
1. Create a new repository: `git init my-new-repo`
2. Make your first commit
3. OPENCODE.md is automatically added via post-commit hook

### For Existing Repositories
1. Navigate to the repository: `cd existing-repo`
2. Run: `add_opencode_to_repo`
3. OPENCODE.md is added and committed

## Key Features Configured

### Deployment Pipeline
- **GitHub Integration**: Auto-push + CI/CD monitoring + error correction
- **Vercel Integration**: Conditional web UI detection + auto-deployment
- **Package Manager**: bun preferred over npm/deno
- **Self-Healing**: Automatic error fixes and retries

### Automation
- Repository analysis on entry
- Code quality assessment
- Security scanning
- Testing infrastructure check
- Deployment monitoring

## Files Created

- `~/OPENCODE.md` - Main configuration file
- `~/.git-templates/hooks/post-commit` - Automatic addition hook
- `~/.bashrc.d/opencode-setup.sh` - Shell functions
- `~/setup-opencode.sh` - Installation script

## Next Steps

1. Configure your GitHub and Vercel tokens in your environment
2. Test with a new repository
3. All future repositories will automatically include the configuration

Ready for automated deployment! 🚀