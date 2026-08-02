#!/usr/bin/env bash

echo "Setting up dotfiles..."

mkdir -p "$HOME/.config"

# symlinks

# zsh
rm -f "$HOME/.zsh_plugins.txt"
ln -sf "$HOME/dotfiles/zsh/plugins.txt" "$HOME/.zsh_plugins.txt" # antidote .zsh_plugins.txt file

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
rm -f ~/.aerospace.toml
ln -sf ~/dotfiles/aerospace.toml ~/.aerospace.toml

# starship
rm -f ~/.config/starship.toml
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml

# tmux
rm -f ~/.tmux.conf
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

echo "Done."
