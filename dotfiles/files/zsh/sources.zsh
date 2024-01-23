#!/usr/bin/env zsh

if [[ -f "/opt/homebrew/bin/aws_completer" ]]; then
  complete -C "/opt/homebrew/bin/aws_completer" aws
fi

source <(~/.asdf/shims/kubectl completion zsh)
source <(/opt/homebrew/bin/helm completion zsh)
source <(/opt/homebrew/bin/flux completion zsh)
source <(colima completion zsh)
source <(gh completion -s zsh)
