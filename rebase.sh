#!/usr/bin/env bash
set -e

sudo nixos-rebuild switch --flake "$(dirname "${BASH_SOURCE[0]}")#nixDesk"
