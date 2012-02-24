# Management
alias dots="cd ~/.dotfiles && vim"
alias reload='source ~/.bash_profile && echo "sourced ~/.bash_profile"'
alias redot='cd ~/.dotfiles && gpp && rake install; cd -'

# OS X: open pwd in Finder.
alias o="open ."

# http://www.hogbaysoftware.com/products/plaintext
alias text='cd ~/Dropbox/PlainText && vim'

# Shell
alias c='clear'
alias la='ls -alh'
alias cdd='cd -'  # back to last directory
alias pg='ps aux | grep '
alias tf='tail -F -n200'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Portable ls with colors
if ls --color -d . >/dev/null 2>&1; then
  alias ls='ls --color=auto'  # Linux
elif ls -G -d . >/dev/null 2>&1; then
  alias ls='ls -G'  # BSD/OS X
fi

# Ruby on Rails
alias sc="[ -f script/console ] && script/console || bundle exec rails console"
alias sdb="[ -f script/dbconsole ] && script/console --include-password || bundle exec rails dbconsole --include-password"
alias ss="[ -f script/server ] && script/server || rails server"
alias mig='rake db:migrate && rake db:test:clone'
alias rsp="bundle exec specjour"
# The bare essentials, for slower machines like MacBook Airs.
alias f="bundle exec foreman start -f=Procfile.lite"
# Everything, when we need it, or on faster machines.
alias ff="bundle exec foreman start"

# Git
alias gl="git log --stat"
alias gs="git status"
alias gw="git show"
alias gd="git diff"  # What's changed but not yet added?
alias gdc="git diff --cached"  # What's added but not yet committed?
alias gc="git commit -a -m"
alias gco="git commit -m"  # "only"
alias gca="git add --all && git commit -m"  # "all"
alias gp='git push'
alias gpp='git pull --rebase && git push'
alias go="git checkout"
alias gb="git checkout -b"
alias got="git checkout -"
alias gom="git checkout master"
alias gr="git branch -d"
alias grr="git branch -D"
alias gcp="git cherry-pick"
alias gam="git commit --amend"
alias gamm="git add --all && git commit --amend -C HEAD"
alias gg="git log --grep"
alias gba="git rebase --abort"
alias gbc="git rebase --continue"
alias gbcc="git add -A && git rebase --continue"
alias gbm="git fetch origin master && git rebase origin/master"

# Guard
alias g="bundle exec guard"
alias gpdf="VIEW_PDF=true bundle exec guard"

# Xcode versioning
# http://www.blog.montgomerie.net/easy-iphone-application-versioning-with-agvtool
alias xv="agvtool what-version; agvtool what-marketing-version"  # Show versions.
alias xvbump="agvtool bump -all"  # Bump build number.
alias xvset="agvtool new-marketing-version"  # Set user-visible version: xvset 2.0

# Servers
alias grace='sudo apachectl graceful'
alias rst="touch tmp/restart.txt && echo touched tmp/restart.txt"  # Passenger

alias hosts='sudo vim /etc/hosts'

# Home network
# On gf's computer, quiet music and disconnect Airfoil from speakers (to free them up for me).
alias hush="cat ~/.bash/lib/hush.scpt | ssh heli osascript; echo hushed."

# Work
# Straight into console-in-screen.
# Assumes there is only one screen running.
alias prodc="ssh prod -t screen -RD"
