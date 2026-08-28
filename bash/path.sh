# Dotfile bins.
export PATH=~/.bin:$PATH

# Homebrew.
[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf.
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Ubuntu Ruby gem binaries.
export PATH=/var/lib/gems/1.8/bin:$PATH

# MySQL.
export PATH=/usr/local/mysql/bin:$PATH

# Make autojump's "j" available.
# brew install autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
