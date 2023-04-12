# export EDITOR=nvim
export EDITOR=hx
export VISUAL="code -- ${@}"
export PAGER=less
# export LESS="-X"
export LANG="en_US.UTF-8"
export LC_ALL=en_US.UTF-8

# Don’t clear the screen after quitting a manual page.
export MANPAGER="less -XR"

# export GIT_PAGER="less -X"

# Simply type the name of a directory, and it will become the current directory
setopt AUTOCD

# Turns on interactive comments, ex: "date # this is a comment"
setopt INTERACTIVECOMMENTS

# Prevents from accidentally overwriting an existing file
setopt NOCLOBBER

# Use a more elegant method for including single quotes in a singly quoted string
setopt RCQUOTES

# Stop zsh from allowing flow control and hence restoring the use of the keys \C-s and \C-q
unsetopt FLOW_CONTROL

export HOMEBREW_NO_ANALYTICS=1

# export BAT_PAGER=""

export TLDR_PARAM='yellow'

export AWS_PAGER=

export PYTHONIOENCODING='UTF-8';

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# see https://stackoverflow.com/questions/39494631/gpg-failed-to-sign-the-data-fatal-failed-to-write-commit-object-git-2-10-0/42265848#42265848
export GPG_TTY=$(tty)

export LS_COLORS="$(vivid generate snazzy)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"

export PATH="$(brew --prefix libpq)/bin:$PATH"
export PATH="${PATH}:${HOME}/.krew/bin"

if [[ -d "${HOME}/.rd/bin" ]]; then
  export PATH="${PATH}:${HOME}/.rd/bin"
fi

export KUBECTL_EXTERNAL_DIFF=kubectl-neat-diff

test -e "$DOTFILES/zsh/secrets/exports.zsh" && source $DOTFILES/zsh/secrets/exports.zsh
