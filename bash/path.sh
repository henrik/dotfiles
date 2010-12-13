# MacPorts
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export MANPATH=/opt/local/share/man:/usr/local/man:$MANPATH

# Homebrew
export PATH=~/.homebrew/bin:~/.homebrew/sbin:$PATH
export MANPATH=~/.homebrew/man:$MANPATH

# Get the Homebrew MacVim version of vim on the command-line too.
# Brew doesn't have a plain Vim recipe and the OS X system Vim doesn't come with Ruby support.
export PATH=~/.homebrew/Cellar/macvim/HEAD/MacVim.app/Contents/MacOS:$PATH

# Ubuntu Ruby gem binaries
export PATH=/var/lib/gems/1.8/bin:$PATH

# MySQL
export PATH=/usr/local/mysql/bin:$PATH

# Jekyll (use dev version, not gem)
export PATH=~/Code/jekyll/bin:$PATH

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
