#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"
BACKUP_MADE=0

backup() {
  local dst="$1"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    if [ "$BACKUP_MADE" -eq 0 ]; then
      mkdir -p "$BACKUP_DIR"
      echo "Backup directory: $BACKUP_DIR"
      BACKUP_MADE=1
    fi
    local rel="${dst#$HOME/}"
    mkdir -p "$BACKUP_DIR/$(dirname "$rel")"
    mv "$dst" "$BACKUP_DIR/$rel"
    echo "  backed up $dst"
  fi
}

link() {
  local src="$DOTFILES/$1" dst="$HOME/$2"
  if [ ! -e "$src" ]; then
    echo "  skip: source missing $src" >&2
    return
  fi
  mkdir -p "$(dirname "$dst")"
  backup "$dst"
  ln -snf "$src" "$dst"
  echo "  linked $dst -> $src"
}

echo "Installing dotfiles from $DOTFILES"

# Directories under ~/.config
link nvim       .config/nvim
link alacritty  .config/alacritty
link fastfetch  .config/fastfetch

# Files in $HOME
link bash/bashrc      .bashrc
link zsh/zshrc        .zshrc
link tmux/tmux.conf   .tmux.conf
link tmux/plugins     .tmux/plugins

# Executable scripts -> ~/.local/bin
if [ -d "$DOTFILES/scripts/bin" ]; then
  for script in "$DOTFILES"/scripts/bin/*; do
    [ -e "$script" ] || continue
    link "scripts/bin/$(basename "$script")" ".local/bin/$(basename "$script")"
  done
fi

echo ""
if [ "$BACKUP_MADE" -eq 1 ]; then
  echo "Existing files backed up to: $BACKUP_DIR"
fi
echo "Done."
