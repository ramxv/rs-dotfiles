# Dotfiles

My personal Linux configuration files. Installed via a simple `install.sh` that creates symlinks into `~/` — no extra tools required.

## Structure

```
.
├── alacritty/   # Terminal emulator config        -> ~/.config/alacritty/
├── bash/        # Bash shell config               -> ~/.bashrc
├── fastfetch/   # System info display             -> ~/.config/fastfetch/
├── nvim/        # Neovim (LazyVim base)           -> ~/.config/nvim/
├── scripts/     # Personal scripts                -> ~/.local/bin/
├── tmux/        # Terminal multiplexer            -> ~/.tmux.conf, ~/.tmux/plugins
├── zsh/         # Z shell config (optional)       -> ~/.zshrc
└── install.sh   # Symlink installer
```

## Installation

```bash
git clone https://github.com/ramxv/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

`install.sh` creates symlinks from this repo into your home directory. If a target already exists as a real file (not a symlink), it is moved to `~/.dotfiles-backup-YYYYMMDD-HHMMSS/` before being replaced — your existing configs are never silently overwritten.

The script is idempotent: re-running it just refreshes the symlinks.

## Uninstalling

There is no `uninstall.sh` — just remove the symlinks manually:

```bash
rm ~/.bashrc ~/.tmux.conf ~/.zshrc
rm ~/.config/{nvim,alacritty,fastfetch,suckless}
rm ~/.tmux/plugins
rm ~/.local/bin/{cnote,tmux-work}
```

Backups from previous installs live in `~/.dotfiles-backup-*/` if you want to restore them.

## Editing configs

Symlinks mean editing `~/.config/nvim/init.lua` is the same as editing `~/dotfiles/nvim/init.lua`. Commit changes from the repo as usual.
