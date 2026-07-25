#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for script in "$SCRIPT_DIR"/scripts/*.sh; do
  name=$(basename "$script" .sh)

  # Optional friendly name via a "# desc: ..." comment at the top of the script
  desc=$(grep -m1 '^# desc:' "$script" | sed 's/^# desc: //')
  desc=${desc:-$name}

  read -rp "Do you want to set up $desc? [Y/n] " answer
  answer=${answer:-Y}

  if [[ "$answer" =~ ^[Yy]$ ]]; then
    echo "==> Running $desc..."
    bash "$script"
  else
    echo "==> Skipping $desc."
  fi
  echo
done

echo "All done."
