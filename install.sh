#!/usr/bin/env bash

set -e

echo "start dotfiles setup..."

echo "create symlinks..."
ln -sf ~/.dotfiles/alacritty ~/.config/alacritty
ln -sf ~/.dotfiles/nvim ~/.config/nvim
ln -sf ~/.dotfiles/config/rofi ~/.config/rofi
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/tmux/.tmux-cht-command ~/.tmux-cht-command
ln -sf ~/.dotfiles/tmux/.tmux-cht-language ~/.tmux-cht-language

ln -sf ~/.dotfiles/bin/ ~/.local/bin
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/zsh/.zsh_profile ~/.zsh_profile

echo "create path variables..."

SHELL_RC="$HOME/.bashrc"
[ -n "$ZSH_VERSION" ] && SHELL_RC="$HOME/.zshrc"

if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$SHELL_RC"; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_RC"
    echo "✅ PATH hinzugefügt zu $SHELL_RC"
fi

echo "finished"

