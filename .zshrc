# Lines configured by zsh-newuser-install
# ~/.zshrc

export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"

ZSH_THEME="robbyrussell"  #
plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

source ~/.zsh_profile

# fzf Bindings (für EndeavourOS / Arch)

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# Language & Editor Settings
export LANG="en_US.UTF-8"
export EDITOR="nvim"

alias dots="cd ~/.dotfiles && nvim ."
alias config="nvim ~/.config"
alias proj="cd ~/projects/ && nvim ."
alias ll="ls -al"
alias vim="nvim"
alias vi="nvim"
# End of lines added by compinstall
