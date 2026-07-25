#!/usr/bin/env bash
# desc: Doom Emacs
set -e

REPO_DIR="$HOME/Projects/repos/doom-emacs-config"
GITHUB_USERNAME="nolanwinsman"
REPO_NAME="doom-emacs-config"

echo "Cloning Doom config..."
if [ ! -d "$REPO_DIR" ]; then
  git clone git@github.com:$GITHUB_USERNAME/$REPO_NAME.git "$REPO_DIR"
else
  echo "Already cloned, skipping."
fi

chmod +x "$REPO_DIR/setup.sh"
"$REPO_DIR/setup.sh"
