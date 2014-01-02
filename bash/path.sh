# Dotfile bins.
export PATH=~/.bin:$PATH

# So homebrew /usr/local/bin is preferrable to /usr/bin.
export PATH=/usr/local/bin:$PATH

# Ubuntu Ruby gem binaries
export PATH=/var/lib/gems/1.8/bin:$PATH

# MySQL
export PATH=/usr/local/mysql/bin:$PATH

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Make autojump's "j" available.
# brew install autojump
# https://github.com/joelthelion/autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Barsoom
[[ -s "$HOME/.bs/profile" ]] && source "$HOME/.bs/profile"
