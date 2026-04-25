# dotfiles

My personal macOS development setup — designed for fast startup, reproducibility, and minimal friction.
This setup powers my workflow for C++, WebAssembly and other web based systems.

---

## ⚙️ What this config manages

### Shell
- zsh (custom modular setup, no oh-my-zsh so blazingly fast startup time (~0.5 seconds))
- antidote plugin manager
- starship prompt

### Terminal
- kitty

### Version/runtime management
- mise (Node, Python, etc.)

### Editor
- Neovim (LazyVim-based setup)

### System tools
- git
- ripgrep
- fd
- fzf
- bat
- neovim

### GUI apps
- Chrome
- Alfred
- AltTab
- Notion

---

## 🚀 Bootstrap a new machine

```bash
git clone git@github.com:Kammu2000/dotfiles.git

cd ~/dotfiles
chmod +x scripts/install.sh
chmod +x scripts/setup.sh
./scripts/install.sh
./scripts/setup.sh
