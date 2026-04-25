#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$HOME/dotfiles"
BREWFILE="$DOTFILES_DIR/Brewfile"

echo "🍺 Checking Homebrew..."

if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "📦 Updating Homebrew..."
brew update

echo "📄 Using Brewfile at: $BREWFILE"

if [[ ! -f "$BREWFILE" ]]; then
  echo "❌ Brewfile not found at $BREWFILE"
  exit 1
fi

echo "⚙️ Installing everything from Brewfile..."
brew bundle --file="$BREWFILE"

echo "🧹 Cleaning up..."
brew cleanup

echo "✅ Brew setup complete!"
