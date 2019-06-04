# Dotfile bins.
export PATH=~/.bin:$PATH

# So homebrew /usr/local/bin is preferrable to /usr/bin.
export PATH=/usr/local/bin:$PATH

# Ubuntu Ruby gem binaries
export PATH=/var/lib/gems/1.8/bin:$PATH

# MySQL
export PATH=/usr/local/mysql/bin:$PATH

# Make autojump's "j" available.
# brew install autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
