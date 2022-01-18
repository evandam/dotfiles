#!/bin/sh

set -e

eval $(/opt/homebrew/bin/brew shellenv)

brew install asdf neovim exa vivid jump bat git-delta

create_link() {
  if [ ! -f "$2" ]; then
    ln -s "$1" "$2"
  else
    echo "$2 already exists"
  fi
}

create_link ~/dotfiles/zshrc ~/.zshrc
create_link ~/dotfiles/gitconfig ~/.gitconfig
create_link ~/dotfiles/gitignore_global ~/.gitignore_global

echo "Install fonts for p10k here: https://github.com/romkatv/powerlevel10k#manual-font-installation"

echo "Open VSCode and run 'Install code command in PATH"