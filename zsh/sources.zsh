#!/usr/bin/env zsh

if [[ -f "/usr/local/bin/aws_zsh_completer.sh" ]]; then
  source "/usr/local/bin/aws_zsh_completer.sh"
fi

if [[ -f "/usr/local/opt/asdf/asdf.sh" ]]; then
  source "/usr/local/opt/asdf/asdf.sh"
fi
