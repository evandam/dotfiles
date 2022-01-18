#!/bin/sh

set -ex

eval $(/opt/homebrew/bin/brew shellenv)

brew install asdf neovim exa vivid jump

if [ ! -f ~/.zshrc ]; then
  ln -s ~/dotfiles/zshrc ~/.zshrc
fi

if [ ! -f ~/.gitconfig ]; then
  ln -s ~/dotfiles/gitconfig ~/.gitconfig
fi