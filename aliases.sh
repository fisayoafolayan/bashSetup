# ------------------------------------------------------------
# Linux commands
# ------------------------------------------------------------
alias §="cd ~"
alias ali='cd ~/Bash && subl .'
alias c="cd"
alias cdnginx="cd /usr/local/etc/nginx"
alias clr="clear"
alias cls="clear"
alias n="nano"
alias sshconfig="subl ~/.ssh/"
alias tinker="psysh"
alias untrustedenable="sudo spctl --master-disable"
alias untrusteddisable="sudo spctl --master-enable"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"


# ------------------------------------------------------------
# PHP commands
# ------------------------------------------------------------
alias a="php artisan"
alias composer='/usr/local/bin/composer'
alias cdu="composer dump-autoload -o"
alias phpserve="php -S localhost:8888"


# ------------------------------------------------------------
# Git Commands
# ------------------------------------------------------------
alias ga="git add"
alias gac="git add . && git commit -m"
alias gc="git commit -m"
alias gcln="git clone"
alias gcob="git checkout -b"
alias gi="git init && commit 'Initial commit.'"
alias gitnah="git reset --hard; git clean -df"
alias gitremote="git config --get remote.origin.url"
alias gpom="git push origin master"
alias gs="git status"


# ------------------------------------------------------------
# Docker commands
# ------------------------------------------------------------
alias dc="docker-compose"
alias drmi='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dockersh="dockerSshIn"
alias dockerps="docker ps -a"
alias drmc='docker rm $(docker ps -q -f status=exited)'


# ------------------------------------------------------------
# Apple commands
# ------------------------------------------------------------
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias launch-simulator='open -n /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'


# ------------------------------------------------------------
# Server commands
# ------------------------------------------------------------
alias pegasus="ssh fisayo@IPAddress"


# ------------------------------------------------------------
# Vagrant commands
# ------------------------------------------------------------
alias v="vagrant"
alias vd="vagrant destroy"
alias vr="vagrant reload"
alias vs="vagrant suspend"
alias vsh="vagrant ssh"
alias vu="vagrant up"


# ------------------------------------------------------------
# Project commands
# ------------------------------------------------------------
alias work="cd ~/sites/dept/"
alias side="cd ~/sites/side/"


