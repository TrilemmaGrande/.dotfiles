# Lines configured by zsh-newuser-install
# ~/.zshrc

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"  #
plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

# Source .zsh_profile oder eigene Umgebungsvariablen
[ -f "$HOME/.zsh_profile" ] && source "$HOME/.zsh_profile"

# fzf Bindings (für EndeavourOS / Arch)
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# Language & Editor Settings
export LANG="en_US.UTF-8"
export EDITOR="nvim"

# Node, Bun, pnpm, Deno etc.
export BUN_INSTALL="$HOME/.bun"
export PNPM_HOME="$HOME/.local/share/pnpm"
export DENO_INSTALL="$HOME/.deno"
export PATH="$BUN_INSTALL/bin:$PNPM_HOME:$DENO_INSTALL/bin:$PATH"

source ~/.zsh_profile
alias dots="cd ~/.dotfiles && nvim ."
alias config="nvim ~/.config"
alias ll="ls -al"
# End of lines added by compinstall
