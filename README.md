# dotfiles

My personal macOS development setup — designed for fast startup, reproducibility, and minimal friction.
This setup powers my workflow for C++, WebAssembly and other web based systems.

---

## ⚙️ What this config manages

### Shell
- zsh (custom modular setup, no oh-my-zsh — blazingly fast startup ~0.15s)
- antidote plugin manager
- starship prompt

### Terminal
- kitty (with Tokyo Night Moon theme, JetBrains Mono NL font)

### Version/runtime management
- mise (Node 22, Python 3.10)

### Editor
- Neovim (LazyVim — auto-installs all plugins on first launch)

### CLI tools
- git, ripgrep, fd, fzf, bat, zoxide, lazygit, yazi, jq

### GUI apps
- Chrome, Alfred, AltTab, Notion

### Fonts
- JetBrains Mono (includes NL/No Ligatures variant)

---

## 🚀 Bootstrap a new machine

**1. Clone the repo into your home directory**

```bash
git clone git@github.com:Kammu2000/dotfiles.git ~/dotfiles
```

**2. Install Homebrew + all packages**

```bash
chmod +x ~/dotfiles/scripts/install.sh
~/dotfiles/scripts/install.sh
```

**3. Create all symlinks**

```bash
chmod +x ~/dotfiles/scripts/setup.sh
~/dotfiles/scripts/setup.sh
```

This symlinks: zsh plugins, starship, git, mise, kitty, and nvim configs.

**4. Hook up zsh**

Add this line to your `~/.zshrc`:

```zsh
source ~/dotfiles/zsh/main.zsh
```

**5. Open Neovim**

```bash
nvim
```

LazyVim and all plugins will auto-install on first launch.

