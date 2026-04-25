# tools
setopt AUTO_CD # don't need to write cd while switching directories
source <(fzf --zsh)

# shell config
source "$HOME/.local/bin/env"
source ~/dotfiles/zsh/plugin-manager.zsh
source ~/dotfiles/zsh/aliases.zsh
source ~/dotfiles/zsh/exports.zsh
source ~/dotfiles/zsh/functions.zsh

# prompt
eval "$(mise activate zsh)"
eval "$(starship init zsh)"
