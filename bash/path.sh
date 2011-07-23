# MacPorts
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export MANPATH=/opt/local/share/man:/usr/local/man:$MANPATH

# Homebrew
export PATH=~/.homebrew/bin:~/.homebrew/sbin:$PATH
export MANPATH=~/.homebrew/man:$MANPATH

# Ubuntu Ruby gem binaries
export PATH=/var/lib/gems/1.8/bin:$PATH

# MySQL
export PATH=/usr/local/mysql/bin:$PATH

# Jekyll (use dev version, not gem)
export PATH=~/Code/jekyll/bin:$PATH

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# brew install autojump
# https://github.com/joelthelion/autojump
if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

# To get the GUI-less Vim from MacVim:
# ln -s ~/.homebrew/bin/mvim ~/.homebrew/bin/vim

# node.js
export NODE_PATH=~/.homebrew/lib/node
