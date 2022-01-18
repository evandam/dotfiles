#!/usr/bin/env zsh

autoload -Uz compinit
compinit -d $ZSH_CACHE/zcompdump

if [[ -f "/usr/local/bin/aws_zsh_completer.sh" ]]; then
  source "/usr/local/bin/aws_zsh_completer.sh"
fi