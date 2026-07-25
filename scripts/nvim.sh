#!/usr/bin/env bash
# desc: Neovim 
set -e

REPO_DIR="$HOME/Projects/repos/nvim"
GITHUB_USERNAME="nolanwinsman"
REPO_NAME="nvim"

echo "Cloning Nvim config..."
if [ ! -d "$REPO_DIR" ]; then
  git clone git@github.com:$GITHUB_USERNAME/$REPO_NAME.git "$REPO_DIR"
else
  echo "Already cloned, skipping."
fi

chmod +x "$REPO_DIR/setup.sh"
"$REPO_DIR/setup.sh"

