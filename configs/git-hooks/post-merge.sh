#!/bin/bash

# Get changed files between previous HEAD and current HEAD
CHANGED_FILES=$(git diff-tree -r --name-only --no-commit-id HEAD@{1} HEAD)

# Check if .nvmrc was changed
if echo "$CHANGED_FILES" | grep -q ".nvmrc"; then
    # Read the content of .nvmrc
    NVMRC_VERSION=$(cat .nvmrc | tr -d '[:space:]')
    
    # Print message in red
    echo -e "\033[0;31mFrontend now requires Node ${NVMRC_VERSION}\nSwitch to the latest version using \`nvm use\`, \`fnm use\` or \`asdf install\` (or whatever is appropriate) or download from nodejs.org. Then run \`make reinstall\`.\033[0m"

# Check if yarn.lock was changed
elif echo "$CHANGED_FILES" | grep -q "yarn.lock"; then
    # Print message in red
    echo -e "\033[0;31mThis application has new dependencies. Running \`make install\`...\033[0m"
    
    # Run make install
    make install
    if [ $? -ne 0 ]; then
        echo "Error running make install"
        exit 1
    fi
fi

exit 0