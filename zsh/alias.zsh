alias xi='exit'
# alias htop='sudo htop'
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; mas upgrade'
alias upgrade=update
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
alias flush="sudo killall -HUP mDNSResponder"
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""type -t md5sum > /dev/null || alias md5sum="md5"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias killosx='echo "Kill affected applications" ; for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done'
alias stoptime='sudo tmutil disablelocal'
alias starttime='sudo tmutil enablelocal'
alias gti=git
alias ogc='open -a Google\ Chrome --args --disable-web-security'
alias pipu='pip3 freeze | xargs pip install --upgrade'
alias rmv='rvm use 2.7.1 --install --create'
alias chefdk='eval "$(chef shell-init $PYENV_SHELL)"'
alias dockerinit='eval "$(docker-machine env default)"; export DOCKER_IP=$(docker-machine ip default)'
alias cat='bat -p --paging=never'
alias sssh='ssh -v -o ConnectTimeout=3 -o ConnectionAttempts=999 @'
alias week='date +%V'
alias path='echo -e ${PATH//:/\\n}'
alias rm='safe-rm'
alias lwd='cd $OLDPWD'
alias vim='nvim'

alias vsc="code ."
alias vsca="code --add"
alias vscd="code --diff"
alias vscg="code --goto"
alias vscn="code --new-window"
alias vscr="code --reuse-window"
alias vscw="code --wait"
alias vscu="code --user-data-dir"

alias vsced="code --extensions-dir"
alias vscie="code --install-extension"
alias vscue="code --uninstall-extension"

alias vscv="code --verbose"
alias vscl="code --log"
alias vscde="code --disable-extensions"

alias curl="curl -sLf"

alias dendron="code ~/Dendron/dendron.code-workspace"
alias notes="dendron"

# alias kd='DOCKER_HOST=$(docker context inspect colima -f {{.Endpoints.docker.Host}}) KITCHEN_YAML=.kitchen.dokken.yml kitchen'

alias k='kubectl'

alias k9sro='k9s --readonly'

# NOTE: docker run aws-vault
drav() {
  AWS_PROFILE="$1"; shift
  aws-vault exec "$AWS_PROFILE" -- docker run --rm -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN "$@"
}

test -e "$DOTFILES/zsh/secrets/alias.zsh" && source $DOTFILES/zsh/secrets/alias.zsh
