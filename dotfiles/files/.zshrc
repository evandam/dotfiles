#!/usr/bin/env zsh

PATH="${PATH}:${HOME}/.bin"
PATH="${PATH}:${HOME}/.local/bin"
export PATH

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH_CONF=$HOME/.zsh
export ZSH_CACHE=$ZSH_CONF/cache
export ZSH_CACHE_DIR=$ZSH_CACHE
export ZSH_COMPDUMP="${ZSH_CACHE}/.zcompdump-${(%):-%m}-${ZSH_VERSION}"

# zmodload zsh/zprof

ZSH_CACHE=$HOME/.zsh/cache

declare -A ZINIT
ZINIT_HOME=$HOME/.zinit
ZINIT[HOME_DIR]=$ZINIT_HOME
ZINIT[ZCOMPDUMP_PATH]=$ZSH_CACHE/zcompdump

if [[ ! -f $ZINIT_HOME/bin/zinit.zsh ]]; then
	git clone git@github.com:zdharma-continuum/zinit.git $ZINIT_HOME/bin
	zcompile $ZINIT_HOME/bin/zinit.zsh
fi

source $ZINIT_HOME/bin/zinit.zsh
# NOTE: Let zoxide use zi
unalias zi

autoload -Uz compinit bashcompinit
compinit
bashcompinit

eval $(/opt/homebrew/bin/brew shellenv)

# NOTE: make prompt faster
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

zinit wait lucid for \
  OMZL::directories.zsh \
  OMZL::functions.zsh \
  OMZL::completion.zsh \
  OMZL::termsupport.zsh \
  OMZL::compfix.zsh \
  OMZP::asdf

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit wait lucid for \
  light-mode unixorn/fzf-zsh-plugin \
  light-mode unixorn/git-extra-commands \
  light-mode paoloantinori/hhighlighter \
  light-mode hlissner/zsh-autopair \
  light-mode rtuin/zsh-case \
  light-mode ChrisPenner/copy-pasta \
  light-mode peterhurford/git-it-on.zsh \
  light-mode caarlos0-graveyard/zsh-git-sync \
  light-mode rummik/zsh-ing \
  light-mode supercrabtree/k \
  light-mode micrenda/zsh-nohup \
  light-mode robertzk/send.zsh \
  light-mode zdharma-continuum/fast-syntax-highlighting \
  light-mode djui/alias-tips \
  light-mode romulomachado/title-tab \
  light-mode DarrinTisdale/zsh-aliases-exa \
  light-mode darvid/zsh-poetry \
  light-mode agkozak/zsh-z \
  OMZP::cp \
  OMZP::colored-man-pages \
  OMZP::safe-paste \
  OMZP::urltools \
  OMZP::rbenv \
  macunha1/zsh-terraform \
  light-mode atuinsh/atuin \

zinit snippet "${HOME}/zsh/alias.zsh"
zinit snippet "${HOME}/zsh/functions.zsh"
zinit snippet "${HOME}/zsh/history.zsh"
zinit ice wait lucid; zinit snippet "${HOME}/zsh/exports.zsh"

# NOTE: See https://github.com/zdharma-continuum/zinit#calling-compinit-with-turbo-mode
# zinit ice wait lucid atload"autoload -Uz compinit && compinit -d $ZSH_CACHE/zcompdump"; zinit snippet "${HOME}/zsh/sources.zsh"
zinit ice wait lucid atload"zicompinit; zicdreplay"; zinit snippet "${HOME}/zsh/sources.zsh"
zinit ice wait lucid atload"zicompinit; zicdreplay"; zinit snippet "${HOME}/zsh/eval.zsh"

zinit ice wait:0 lucid atload'
	zstyle ":notify:*" error-title "Command failed (in #{time_elapsed} seconds)"
	zstyle ":notify:*" success-title "Command finished (in #{time_elapsed} seconds)"
	zstyle ":notify:*" command-complete-timeout 2
	zstyle ":notify:*" enable-on-ssh yes'
zinit light marzocchi/zsh-notify

zstyle ':completion:*' menu select
fpath+=~/.zfunc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zinit cdreplay -q
