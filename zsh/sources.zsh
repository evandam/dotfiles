#!/usr/bin/env zsh

if [[ -f "/usr/local/bin/aws_zsh_completer.sh" ]]; then
  source "/usr/local/bin/aws_zsh_completer.sh"
fi

source <(/Users/evan/.asdf/shims/kubectl completion zsh)
source <(/opt/homebrew/bin/helm completion zsh)
