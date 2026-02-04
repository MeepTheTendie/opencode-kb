#!/bin/bash

# OPENCODE Universal Configuration Setup Script
# This script ensures every new repository gets the OPENCODE.md configuration

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
OPENCODE_FILE="$HOME/OPENCODE.md"
GIT_TEMPLATE_DIR="$HOME/.git-templates"
HOOKS_DIR="$GIT_TEMPLATE_DIR/hooks"

echo -e "${BLUE}🔧 Setting up OPENCODE universal configuration...${NC}"

# Check if OPENCODE.md exists
if [ ! -f "$OPENCODE_FILE" ]; then
    echo -e "${RED}❌ OPENCODE.md not found at $OPENCODE_FILE${NC}"
    echo -e "${YELLOW}Please ensure the file exists before running this script.${NC}"
    exit 1
fi

# Create git templates directory if it doesn't exist
mkdir -p "$GIT_TEMPLATE_DIR"
mkdir -p "$HOOKS_DIR"

# Create post-commit hook to copy OPENCODE.md to new repos
cat > "$HOOKS_DIR/post-commit" << 'EOF'
#!/bin/bash

# Check if OPENCODE.md exists in the repository
if [ ! -f "OPENCODE.md" ]; then
    # Copy from the universal location if it exists
    UNIVERSAL_OPENCODE="$HOME/OPENCODE.md"
    if [ -f "$UNIVERSAL_OPENCODE" ]; then
        cp "$UNIVERSAL_OPENCODE" "OPENCODE.md"
        git add OPENCODE.md
        git config user.name "opencode-automation"
        git config user.email "opencode@automation.local"
        git commit -m "Add OPENCODE universal configuration"
        echo "✅ OPENCODE.md added to repository"
    fi
fi
EOF

# Make hook executable
chmod +x "$HOOKS_DIR/post-commit"

# Configure git to use the template directory
git config --global init.templateDir "$GIT_TEMPLATE_DIR"

# Create a function for manual addition to existing repos
cat > "$HOME/.bashrc.d/opencode-setup.sh" << 'EOF'
# OPENCODE setup function
add_opencode_to_repo() {
    if [ ! -d ".git" ]; then
        echo "❌ Not in a git repository"
        return 1
    fi
    
    if [ -f "OPENCODE.md" ]; then
        echo "ℹ️ OPENCODE.md already exists in repository"
        return 0
    fi
    
    UNIVERSAL_OPENCODE="$HOME/OPENCODE.md"
    if [ -f "$UNIVERSAL_OPENCODE" ]; then
        cp "$UNIVERSAL_OPENCODE" "OPENCODE.md"
        git add OPENCODE.md
        git commit -m "Add OPENCODE universal configuration"
        echo "✅ OPENCODE.md added to current repository"
    else
        echo "❌ Universal OPENCODE.md not found at $UNIVERSAL_OPENCODE"
    fi
}
EOF

# Create the .bashrc.d directory if it doesn't exist
mkdir -p "$HOME/.bashrc.d"

# Source the new function in .bashrc if not already there
if ! grep -q "opencode-setup.sh" "$HOME/.bashrc"; then
    echo "" >> "$HOME/.bashrc"
    echo "# OPENCODE universal configuration" >> "$HOME/.bashrc"
    echo "if [ -f ~/.bashrc.d/opencode-setup.sh ]; then" >> "$HOME/.bashrc"
    echo "    source ~/.bashrc.d/opencode-setup.sh" >> "$HOME/.bashrc"
    echo "fi" >> "$HOME/.bashrc"
fi

echo -e "${GREEN}✅ OPENCODE universal configuration setup complete!${NC}"
echo ""
echo -e "${BLUE}What was configured:${NC}"
echo "  • Git templates directory: $GIT_TEMPLATE_DIR"
echo "  • Post-commit hook: Automatically adds OPENCODE.md to new repos"
echo "  • Global git configuration updated"
echo "  • Function 'add_opencode_to_repo' added for existing repos"
echo ""
echo -e "${YELLOW}Usage:${NC}"
echo "  • New repositories will automatically get OPENCODE.md on first commit"
echo "  • For existing repos, run: ${BLUE}add_opencode_to_repo${NC}"
echo ""
echo -e "${BLUE}🚀 Your OPENCODE configuration will now be available in all repositories!${NC}"