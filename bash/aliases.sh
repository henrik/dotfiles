# Dirs
alias a="cd ~/Sites/auktion"
alias i="cd ~/Code/iPhone/AK"

# TODO dir
alias todo='mate ~/Dropbox/TODO'

# Management
alias dots="mate ~/.dotfiles"
alias reload='source ~/.bash_profile && echo "sourced ~/.bash_profile"'
alias redot='cd ~/.dotfiles && rake install; cd -'

# Shell
alias c='clear'
alias ls='ls -G'  # color
alias la='ls -al'
alias cdd='cd -'  # back to last directory
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Ruby on Rails
alias sc="[ -f script/cconsole ] && script/cconsole || script/console"  # cconsole is for MRI console (boots faster) in JRuby projects.
alias ss="script/server"
alias at="script/autospec -f -c"
alias cu='script/cucumber features -b -s -f progress'
alias cuf='script/cucumber features -b -s -t @focus'
alias mig='rake db:migrate'

# JRuby
alias jake="jruby --headless -S rake"
alias jem="sudo jruby --headless -S gem"

# Git
alias gl="git log"
alias glm="git log | mate"
alias gs="git status"
alias gw="git show"
alias gd="git diff"  # What's changed but not yet added?
alias gdc="git diff --cached"  # What's added but not yet committed?
alias gdm="git diff | mate"
alias gc="git commit -a -m"
alias gco="git commit -m"  # "only"
alias gca="git add . && git commit -a -m"  # "all"
alias gp='git push'
alias gpp='git pull && git push'
alias go="git checkout"
alias gb="git checkout -b"
alias got="git checkout -"
alias gom="git checkout master"
alias gr="git branch -d"
alias grr="git branch -D"
alias gcp="git cherry-pick"
alias gam="git commit --amend"

# Xcode versioning
# http://www.blog.montgomerie.net/easy-iphone-application-versioning-with-agvtool
alias xv="agvtool what-version; agvtool what-marketing-version"  # Show versions.
alias xvbump="agvtool bump -all"  # Bump build number.
alias xvset="agvtool new-marketing-version"  # Set user-visible version: xvset 2.0

# Servers
alias grace='sudo apachectl graceful'
alias rst="touch tmp/restart.txt && echo touched tmp/restart.txt"  # Passenger

# Home network
# On gf's computer, quiet music and disconnect Airfoil from speakers (to free them up for me).
alias hush="cat ~/.bash/lib/hush.scpt | ssh heli osascript; echo hushed."

# Work

alias akdb='mysqladmin -u root -f drop ak_dev create ak_dev && mysql -u root ak_dev < ~/Downloads/auction_clean.sql && rake db:migrate'
alias akdbg='scp sdb:~andreas/akdump/dump/auction_clean.sql ~/Downloads/ && akdb'
# Use with autologin Greasemonkey script: http://gist.github.com/raw/487186/ccf2c203741c1e39eb45416d02bc58b2728427fc/basefarm_auto.user.js
alias vpn='open -a Firefox "https://ssl-vpn.sth.basefarm.net/ssl"; sleep 5; killall firefox-bin'
