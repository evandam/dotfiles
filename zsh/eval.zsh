eval "$(jump shell)"
eval "$(rbenv init -)"

test -e "$DOTFILES/zsh/secrets/eval.zsh" && source $DOTFILES/zsh/secrets/eval.zsh
