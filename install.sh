#!/bin/sh

set -e

eval $(/opt/homebrew/bin/brew shellenv)

brew install asdf neovim exa vivid jump bat git-delta safe-rm

create_link() {
  if [ ! -f "$2" ]; then
    ln -s "$1" "$2"
    echo "Created link $2"
  else
    echo "$2 already exists"
  fi
}

create_link ~/dotfiles/zshrc ~/.zshrc
create_link ~/dotfiles/gitconfig ~/.gitconfig
create_link ~/dotfiles/gitignore_global ~/.gitignore_global
create_link ~/dotfiles/vimrc ~/.vimrc

mkdir -p ~/.config/nvim
create_link ~/dotfiles/init.vim ~/.config/nvim/init.vim

echo "Install fonts for p10k here: https://github.com/romkatv/powerlevel10k#manual-font-installation"

echo "Open VSCode and run 'Install code command in PATH"

if [ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim" ]; then
  echo "Installing vim-plug"
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  echo "vim-plug installed! Be sure to run :PlugInstall in vim"
fi