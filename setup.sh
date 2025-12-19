#!/bin/bash

# setup.sh - Setup script for dotsh configurations
# This script sets up tmux, vim, and iTerm configurations

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${SCRIPT_DIR}/configs"

echo -e "${GREEN}=== dotsh Configuration Setup ===${NC}"
echo "Script directory: ${SCRIPT_DIR}"
echo "Config directory: ${CONFIG_DIR}"
echo ""

# Function to backup existing file
backup_file() {
    local file=$1
    if [ -f "$file" ] || [ -L "$file" ]; then
        local backup="${file}.backup.$(date +%Y%m%d_%H%M%S)"
        echo -e "${YELLOW}Backing up existing $file to $backup${NC}"
        mv "$file" "$backup"
    fi
}

# Function to create symlink
create_symlink() {
    local source=$1
    local target=$2

    if [ ! -f "$source" ]; then
        echo -e "${RED}Error: Source file $source not found${NC}"
        return 1
    fi

    backup_file "$target"

    echo -e "${GREEN}Creating symlink: $target -> $source${NC}"
    ln -s "$source" "$target"
}

# Setup tmux configuration
echo -e "\n${GREEN}Setting up tmux configuration...${NC}"
if [ -f "${CONFIG_DIR}/tmux.conf" ]; then
    create_symlink "${CONFIG_DIR}/tmux.conf" "$HOME/.tmux.conf"
    echo -e "${GREEN}✓ tmux configuration installed${NC}"
else
    echo -e "${RED}✗ tmux.conf not found in ${CONFIG_DIR}${NC}"
fi

# Setup vim configuration
echo -e "\n${GREEN}Setting up vim configuration...${NC}"
if [ -f "${CONFIG_DIR}/vimrc" ]; then
    create_symlink "${CONFIG_DIR}/vimrc" "$HOME/.vimrc"
    echo -e "${GREEN}✓ vim configuration installed${NC}"
else
    echo -e "${RED}✗ vimrc not found in ${CONFIG_DIR}${NC}"
fi

# iTerm2 profile setup instructions
echo -e "\n${GREEN}Setting up iTerm2 configuration...${NC}"
if [ -f "${CONFIG_DIR}/iterm_profile.json" ]; then
    echo -e "${YELLOW}iTerm2 profile found at: ${CONFIG_DIR}/iterm_profile.json${NC}"
    echo -e "${YELLOW}To import the iTerm2 profile:${NC}"
    echo -e "  1. Open iTerm2"
    echo -e "  2. Go to: Preferences > Profiles"
    echo -e "  3. Click 'Other Actions...' (bottom left)"
    echo -e "  4. Select 'Import JSON Profiles...'"
    echo -e "  5. Navigate to: ${CONFIG_DIR}/iterm_profile.json"
    echo -e "  6. Import the profile"
else
    echo -e "${RED}✗ iterm_profile.json not found in ${CONFIG_DIR}${NC}"
fi

# Summary
echo -e "\n${GREEN}=== Setup Complete ===${NC}"
echo -e "${GREEN}Configurations have been installed to:${NC}"
[ -L "$HOME/.tmux.conf" ] && echo -e "  ${GREEN}✓${NC} ~/.tmux.conf"
[ -L "$HOME/.vimrc" ] && echo -e "  ${GREEN}✓${NC} ~/.vimrc"
echo ""
echo -e "${YELLOW}Note: Any existing configuration files have been backed up with a timestamp.${NC}"
echo ""
echo -e "${GREEN}Next steps:${NC}"
echo -e "  • Start a new tmux session: ${YELLOW}tmux${NC}"
echo -e "  • Open vim to test configuration: ${YELLOW}vim${NC}"
echo -e "  • Import iTerm2 profile manually (see instructions above)"
echo ""
