# Management
alias dots="cd ~/.dotfiles && vim"
alias reload='source ~/.bash_profile && echo "sourced ~/.bash_profile"'
alias redot='cd ~/.dotfiles && gpp && rake install; cd -'

# OS X: open pwd in Finder.
alias o="open ."

# http://www.hogbaysoftware.com/products/plaintext
alias text='cd ~/Dropbox/PlainText && vim'

# Shell
alias la='ls -alh'
alias cdd='cd -'  # back to last directory
alias pg='ps aux | grep '
alias tf='tail -F -n200'
alias top='top -ocpu'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

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
alias gcaf="git add --all && git commit --no-verify -m"
alias gp='git push'
alias gpp='git pull --rebase && git push'
alias gps='git stash && gpp && git stash pop'
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
alias gbc="git add -A && git rebase --continue"
alias gbm="git fetch origin master && git rebase origin/master"

# Heroku
alias h="heroku"
alias hp="git push heroku"
alias ho="heroku open"
alias hc="heroku run console"

# tmux
alias ta="tmux attach"

# Guard
alias g="bundle exec guard -i"
alias gpdf="VIEW_PDF=true bundle exec guard -i"

# Servers
alias rst="touch tmp/restart.txt && echo touched tmp/restart.txt"  # Passenger

alias hosts='sudo vim /etc/hosts'

# Local IP.
alias ip='ifconfig en3 | grep inet | grep -v inet6 | cut -c 7-16'

# Work
# Straight into console-in-screen.
# Assumes there is only one screen running.
alias prodc="ssh prod -t screen -RD"
alias rsu="rake spec:unit"
alias rsua="rake spec:unit:all"
