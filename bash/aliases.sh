# Management
alias dots="cd ~/.dotfiles && vim"
alias reload='source ~/.bash_profile && echo "sourced ~/.bash_profile"'
alias redot='cd ~/.dotfiles && gpp && rake install; cd -'

alias hosts='sudo vim /etc/hosts'
alias vrb='vim -c "setf ruby"'

# http://www.hogbaysoftware.com/products/plaintext
alias text='cd ~/Dropbox/PlainText && vim'

# Shell
alias la='ls -alh'
alias cdd='cd -'  # back to last directory
alias pg='ps aux | head -n1; ps aux | grep -i'
alias tf='tail -F -n200'
alias top='top -ocpu'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ip="ifconfig|grep broadcast"  # List IPs

# Portable ls with colors
if ls --color -d . >/dev/null 2>&1; then
  alias ls='ls --color=auto'  # Linux
elif ls -G -d . >/dev/null 2>&1; then
  alias ls='ls -G'  # BSD/OS X
fi

# I always forget the common options.
alias rsync?="echo 'rsync -az --progress server:/path/ path (Slashes are significant.)'"

# Ruby on Rails
alias sx="[ -f script/console ] && script/console --sandbox || bundle exec rails console --sandbox"
alias sdb="[ -f script/dbconsole ] && script/console --include-password || bundle exec rails dbconsole --include-password"
alias f="script/foreman_turbux"

# Phoenix or Ruby on Rails
alias mig="([ -f mix.exs ] && mix ecto.migrate) || ([ -f Rakefile ] && rake db:migrate)"
alias ss="([ -f mix.exs ] && mix phoenix.server) || ([ -f script/server ] && script/server || rails server)"
alias sc="([ -f mix.exs ] && iex -S mix) || ([ -f script/console ] && script/console || bundle exec rails console)"

# Ruby
alias be="bundle exec"

# Elixir
alias smix="iex -S mix"

# Tests
alias rsua="bundle exec rake spec:unit:all"
alias rsp="rake testbot:spec"

# Git
alias g="git"
alias gs="git status"
alias gw="git show"
alias gw^="git show HEAD^"
alias gw^^="git show HEAD^^"
alias gw^^^="git show HEAD^^^"
alias gw^^^^="git show HEAD^^^^"
alias gd="git diff HEAD"  # What's changed? Both staged and unstaged.
alias gdo="git diff --cached"  # What's changed? Only staged (added) changes.
# for gco ("git commit only") and gca ("git commit all"), see functions.sh.
# for gget (git clone and cd), see functions.sh.
alias gcaf="git add --all && gcof"
alias gcof="git commit --no-verify -m"
alias gcac="gca Cleanup"
alias gcoc="gco Cleanup"
alias gcaw="gca Whitespace"
alias gcow="gco Whitespace"
alias gpp='git pull --rebase && git push'
alias gppp="git push -u"  # Can't pull because you forgot to track? Run this.
alias gps='(git stash --include-untracked | grep -v "No local changes to save") && gpp && git stash pop || echo "Fail!"'
alias go="git checkout"
alias gb="git checkout -b"
alias got="git checkout -"
alias gom="git checkout master"
alias grb="git rebase -i origin/master"
alias gr="git branch -d"
alias grr="git branch -D"
alias gcp="git cherry-pick"
alias gcpp="git cherry-pick -"  # "cherry-pick previous", e.g. the head of the branch we just left
alias gam="git commit --amend"
alias gamm="git add --all && git commit --amend -C HEAD"
alias gammf="gamm --no-verify"
alias gba="git rebase --abort"
alias gbc="git add -A && git rebase --continue"
alias gbm="git fetch origin master && git rebase origin/master"

# Heroku
alias h="heroku"
alias hmig="heroku run rake db:migrate"
alias ho="heroku open"
alias hsc="heroku run rails console -r heroku"  # Explicit remote, for apps with a staging as well.
alias hlog="heroku logs -t -r heroku"

# tmux
alias ta="tmux attach"
# With tmux mouse mode on, just select text in a pane to copy.
# Then run tcopy to put it in the OS X clipboard (assuming reattach-to-user-namespace).
alias tcopy="tmux show-buffer | pbcopy"

# Servers
alias rst="touch tmp/restart.txt && echo touched tmp/restart.txt"  # Passenger

# Work

# Straight into console-in-screen.
# Assumes there is only one screen running.
alias prodc="ssh anpa -t screen -RD"
