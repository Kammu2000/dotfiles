#!/usr/bin/env bash

echo "Setting up dotfiles..."

# symlinks

# zsh
ln -sf "$HOME/dotfiles/zsh/plugins.txt" "$HOME/.zsh_plugins.txt" # antidote .zsh_plugins.txt file

mkdir -p "$HOME/.config"

# git
rm -rf ~/.config/git
ln -sfn "$HOME/dotfiles/git" "$HOME/.config/git"

# mise
rm -rf ~/.config/mise
ln -sfn "$HOME/dotfiles/mise" "$HOME/.config/mise"

# kitty
rm -rf ~/.config/kitty
ln -sfn "$HOME/dotfiles/kitty" "$HOME/.config/kitty"

# alacritty
rm -rf ~/.config/alacritty
ln -sfn "$HOME/dotfiles/alacritty" "$HOME/.config/alacritty"

# nvim
rm -rf ~/.config/nvim
ln -sfn "$HOME/dotfiles/nvim" "$HOME/.config/nvim"

# aerospace
ln -sf ~/dotfiles/aerospace.toml ~/.aerospace.toml

# starship
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml # starship config file

echo "Done."
