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
alias cdd='cd -'  # Back to last directory
alias cdr='cd $(git rev-parse --show-toplevel)'  # Back to git root - from https://twitter.com/thorstenball/status/1223218245592911878
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

# Ruby on Rails
alias sx="[ -f script/console ] && script/console --sandbox || bundle exec rails console --sandbox"
alias sdb="[ -f script/dbconsole ] && script/console --include-password || bundle exec rails dbconsole --include-password"
alias f="script/foreman_turbux"

# Phoenix or Ruby on Rails
alias mig="if [ -f mix.exs ]; then mix ecto.migrate; elif [ -f Rakefile ]; then bundle exec rake db:migrate; else echo 'Did not detect Phoenix or Rails.'; fi"
alias ss="if [ -f mix.exs ]; then mix phx.server; elif [ -f Rakefile ]; then rails server; else echo 'Did not detect Phoenix or Rails.'; fi"
alias sc="if [ -f mix.exs ]; then iex -S mix; elif [ -f Rakefile ]; then bundle exec rails console; else echo 'Did not detect Phoenix or Rails.'; fi"

# Ruby
alias be="bundle exec"

# Elixir
alias smix="iex -S mix"

# Docker Compose (as seen e.g. in https://thoughtbot.com/blog/rails-on-docker)
alias dew="docker-compose exec web"

# Git

# Determine if the main Git branch is "master" or "main". (Assumes it's one of those two.)
# https://stackoverflow.com/a/66622363/6962
function git_main_branch {
  [ -f "$(git rev-parse --show-toplevel)/.git/refs/heads/master" ] && echo "master" || echo "main"
}

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
alias gcaw="gca $'Whitespace\n\n[skip ci]'"
alias gcow="gco $'Whitespace\n\n[skip ci]'"
alias gl="git pull --rebase"
alias gpp="git pull --rebase && git push"
alias gppp="git push -u"  # Can't pull because you forgot to track? Run this.
alias gps='(git stash --include-untracked | grep -v "No local changes to save") && gpp && git stash pop || echo "Fail!"'
alias go="git checkout"
alias gb="git checkout -b"
alias got="git checkout -"
alias gom='git checkout `git_main_branch`'
alias grb='git rebase -i origin/`git_main_branch`'
alias gr="git branch -d"
alias grr="git branch -D"
alias gcp="git cherry-pick"
alias gcpp="git cherry-pick -"  # "cherry-pick previous", e.g. the head of the branch we just left
alias gam="git commit --amend --allow-empty"
alias gamm="git add --all && git commit --amend --allow-empty --no-edit"
alias gammf="gamm --no-verify"
alias gba="git rebase --abort"
alias gbc="git add -A && git rebase --continue"
alias gbm='git fetch origin `git_main_branch` && git rebase origin/`git_main_branch`'
alias gap="git add --intent-to-add . && git add -p"  # Like "git add -p" but also ask about any newly added files.

# Pairing (via https://github.com/barsoom/devbox/blob/master/bin/pair)
alias pairo="pair olle"
alias pairp="pair peter"

# Heroku
alias h="heroku"
alias hdep="git push heroku"
alias hmig="heroku run rake db:migrate"
alias ho="heroku open"
alias hsc="heroku run rails console -r heroku"  # Explicit remote, for apps with a staging as well.
alias hscs="heroku run rails console -r staging"
alias hlog="heroku logs -t -r heroku"

# tmux
alias ta="tmux attach"
# With tmux mouse mode on, just select text in a pane to copy.
# Then run tcopy to put it in the OS X clipboard (assuming reattach-to-user-namespace).
alias tcopy="tmux show-buffer | pbcopy"

# WTI (translation service)

# Push to WTI until it sticks.
# It tends to refuse pushes of a target language until it's processed the source language push.
alias wpus="ruby -e 'loop { x = \`wti push; wti push -l en; wti push -l de; wti push -l es; wti push -l da; wti push -l fi\`; puts x; break unless x.include?(%{Locked}); puts; puts %{#{Time.now.strftime(%{%H:%M:%S})}: Retrying in a bit…}; puts; sleep 15 }'"

# Work

# Sometimes the camera in my Cinema Display stops working. This fixes it.
alias fixcam="sudo killall VDCAssistant"

# Sometimes the time in my VM is off. This fixes it.
alias fixtime="sudo service ntp stop; sudo ntpd -gq; sudo service ntp start"
