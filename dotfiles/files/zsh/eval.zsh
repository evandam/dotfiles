eval "$(jump shell)"
eval "$(zoxide init zsh)"
# eval "$(rbenv init -)"
# eval "$(pyenv init -)"
#

test -e "${HOME}/zsh/secrets/eval.zsh" && source ${HOME}/zsh/secrets/eval.zsh

ulimit -n 2048
