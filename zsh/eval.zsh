eval "$(jump shell)"
eval "$(zoxide init zsh)"
# eval "$(rbenv init -)"
# eval "$(pyenv init -)"
#

test -e "$DOTFILES/zsh/secrets/eval.zsh" && source $DOTFILES/zsh/secrets/eval.zsh

ulimit -n 2048
