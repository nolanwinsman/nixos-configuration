#!/usr/bin/env bash
# desc: NixOS config symlinks
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NIXOS_DIR="/etc/nixos"

# Only these belong in /etc/nixos
NIX_FILES=("configuration.nix" "flake.nix")

echo "Linking Nix config files into $NIXOS_DIR..."

for file in "${NIX_FILES[@]}"; do
  src="$REPO_DIR/$file"
  dest="$NIXOS_DIR/$file"

  if [ ! -f "$src" ]; then
    echo "Warning: $src not found in repo, skipping."
    continue
  fi

  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "Backing up existing $dest to $dest.backup..."
    sudo mv "$dest" "$dest.backup"
  fi

  echo "Linking $file..."
  sudo ln -sfn "$src" "$dest"
done

echo "Linking modules directory..."
if [ -d "$REPO_DIR/modules" ]; then
  if [ -e "$NIXOS_DIR/modules" ] && [ ! -L "$NIXOS_DIR/modules" ]; then
    echo "Backing up existing $NIXOS_DIR/modules..."
    sudo mv "$NIXOS_DIR/modules" "$NIXOS_DIR/modules.backup"
  fi
  sudo ln -sfn "$REPO_DIR/modules" "$NIXOS_DIR/modules"
fi

echo "Nix config symlinks complete."
