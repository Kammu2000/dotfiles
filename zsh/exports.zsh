# editor
export EDITOR=dv
export VISUAL=dv

# Add user-level CLI tools (claude, cursor)
# to PATH so commands installed in ~/.local/bin can be run globally
export PATH="$HOME/.local/bin:$PATH"
export PATH="$(brew --prefix vim)/bin:$PATH"
