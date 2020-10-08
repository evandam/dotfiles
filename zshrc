# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export ZSH_CONF=$HOME/.zsh
export ZSH_CACHE=$ZSH_CONF/cache
export ZSH_CACHE_DIR=$ZSH_CACHE
export ZSH_COMPDUMP="${ZSH_CACHE}/.zcompdump-${(%):-%m}-${ZSH_VERSION}"

autoload -Uz compinit && compinit -C -d $ZSH_COMPDUMP

source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then
  zgen load romkatv/powerlevel10k powerlevel10k

  zgen load zsh-users/zsh-syntax-highlighting

  zgen load djui/alias-tips
  zgen load unixorn/autoupdate-zgen
  zgen load unixorn/fzf-zsh-plugin
  zgen load zsh-users/zsh-completions
  zgen load qoomon/zsh-lazyload

  zgen oh-my-zsh plugins/colored-man-pages
  # zgen oh-my-zsh plugins/colorize
  zgen oh-my-zsh plugins/cp
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/docker-compose
  # zgen oh-my-zsh plugins/docker-machine
  zgen oh-my-zsh plugins/extract
  zgen oh-my-zsh plugins/fasd
  zgen oh-my-zsh plugins/fd
  # zgen oh-my-zsh plugins/kitchen
  # zgen oh-my-zsh plugins/knife
  # zgen oh-my-zsh plugins/nomad
  # zgen oh-my-zsh plugins/pyenv
  # zgen oh-my-zsh plugins/rbenv
  zgen oh-my-zsh plugins/redis-cli
  zgen oh-my-zsh plugins/safe-paste
  # zgen oh-my-zsh plugins/terraform
  zgen oh-my-zsh plugins/vscode

  # zgen load zsh-users/zsh-syntax-highlighting
  zgen load zdharma/fast-syntax-highlighting
  zgen save
fi

ZSH_CONF=$HOME/.zsh
ZSH_CACHE=$ZSH_CONF/cache

source "${ZSH_CONF}/eval.zsh"
source "${ZSH_CONF}/alias.zsh"
source "${ZSH_CONF}/history.zsh"
source "${ZSH_CONF}/functions.zsh"
source "${ZSH_CONF}/exports.zsh"
source "${ZSH_CONF}/sources.zsh"
source "${ZSH_CONF}/completions.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f "${ZSH_CONF}/p10k.zsh" ]] || source "${ZSH_CONF}/p10k.zsh"

[[ -f /usr/local/opt/asdf/asdf.sh ]] && . /usr/local/opt/asdf/asdf.sh
