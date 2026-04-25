# Antidote plugin manager bootstrap
# Uses ~/.zsh_plugins.txt as the standard entry point
# and auto-regenerates the static plugin bundle only
# when the plugin list changes.

zsh_plugins="${ZDOTDIR:-$HOME}/.zsh_plugins"

# Rebuild static plugin bundle only if needed
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  (
    # make sure that antidote is installed through brew
    source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"
    antidote bundle < "${zsh_plugins}.txt" > "${zsh_plugins}.zsh"
  )
fi

# Load compiled plugins
source "${zsh_plugins}.zsh"
