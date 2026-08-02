#!/usr/bin/env bash

echo "Setting up dotfiles..."

# symlinks
# zsh
ln -sf "$HOME/dotfiles/zsh/plugins.txt" "$HOME/.zsh_plugins.txt" # antidote .zsh_plugins.txt file

mkdir -p "$HOME/.config"

# starship
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml # starship config file

# git
ln -sfn "$HOME/dotfiles/git" "$HOME/.config/git"

# mise
ln -sfn "$HOME/dotfiles/mise" "$HOME/.config/mise"

# kitty
ln -sfn "$HOME/dotfiles/kitty" "$HOME/.config/kitty"

# nvim
ln -sfn "$HOME/dotfiles/nvim" "$HOME/.config/nvim"

# aerospace
ln -sf ~/dotfiles/aerospace.toml ~/.aerospace.toml

echo "Done."
