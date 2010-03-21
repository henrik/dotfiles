# Dirs
alias a="cd ~/Sites/auktion"
alias i="cd ~/Code/iPhone/AK"

# Management
alias dots="mate ~/.dotfiles"
alias reload='source ~/.bash_profile && echo "sourced ~/.bash_profile"'
alias redot='cd ~/.dotfiles && rake install; cd -'

# Shell
alias ls='ls -G'  # color
alias cdd='cd -'  # back to last directory
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Ruby/Rails
alias sc="script/console"
alias ss="script/server"
alias at="script/autospec -f -c"
alias cu='script/cucumber features -b -s -f progress'
alias cuf='script/cucumber features -b -s -t @focus'

# JRuby
alias jake="jruby --headless -S rake"
alias jem="sudo jruby --headless -S gem"

# Git
alias gl="git log"
alias glm="git log | mate"
alias gs="git status"
alias gw="git show"
alias gd="git diff"
alias gdm="git diff | mate"
alias gc="git commit -a -m"
alias gco="git commit -m"  # "only"
alias gca="git add . && git commit -m"  # "all"
alias gp='git push'
alias gpp='git pull && git push'
alias go="git checkout"
alias gb="git checkout -b"
alias got="git checkout -"
alias gr="git branch -d"
alias grr="git branch -D"
alias gcp="git cherry-pick"

# Servers
alias grace='sudo apachectl graceful'
alias rst="touch tmp/restart.txt && echo touched tmp/restart.txt"  # Passenger

# Work
alias akdb='mysqladmin -u root -f drop ak_dev create ak_dev && mysql -u root ak_dev < ~/Downloads/auction_clean.sql && rake db:migrate'
alias akdbg='scp sdb:~andreas/akdump/dump/auction_clean.sql ~/Downloads/ && akdb'
