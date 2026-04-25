#!/usr/bin/env bash

echo "Setting up dotfiles..."

# symlinks
# zsh
ln -sf "$HOME/dotfiles/zsh/plugins.txt" "$HOME/.zsh_plugins.txt" # antidote .zsh_plugins.txt file

# starship
mkdir -p "$HOME/.config"
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml # starship config file

# git
ln -sfn "$HOME/dotfiles/git" "$HOME/.config/git"

# mise
mkdir -p "$HOME/.config/mise"
ln -sf "$HOME/dotfiles/mise/config.toml" "$HOME/.config/mise/config.toml"

echo "Done."
