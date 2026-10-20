#!/usr/bin/env bash
set -euo pipefail

KEY="$HOME/.ssh/id_ed25519"

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

if [[ -f "$KEY" ]]; then
    echo "An existing SSH key was found. Skipping key generation."
else
    read -rp "Enter your GitHub email address: " EMAIL
    ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY"
fi

echo
echo "=== Public key to add to GitHub ==="
cat "${KEY}.pub"
echo
echo "Add this key at: https://github.com/settings/keys"
