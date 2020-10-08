lazyload pyenv -- 'eval "$(pyenv init -)"'

lazyload rbenv -- 'eval "$(rbenv init -)"'

test -e "$ZSH_CONF/secrets/eval.zsh" && source $ZSH_CONF/secrets/eval.zsh
