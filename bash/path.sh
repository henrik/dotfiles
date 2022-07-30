# Dotfile bins.
export PATH=~/.bin:$PATH

# Homebrew.
export PATH=/opt/homebrew/bin:$PATH

# Ubuntu Ruby gem binaries.
export PATH=/var/lib/gems/1.8/bin:$PATH

# MySQL.
export PATH=/usr/local/mysql/bin:$PATH

# Make autojump's "j" available.
# brew install autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
