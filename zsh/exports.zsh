# editor
export EDITOR=nvim
export VISUAL=nvim

# Add user-level CLI tools (claude, cursor)
# to PATH so commands installed in ~/.local/bin can be run globally
export PATH="$HOME/.local/bin:$PATH"
export PATH="$(brew --prefix vim)/bin:$PATH"
