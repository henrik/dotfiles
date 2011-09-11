# So Homebrew /usr/local/bin is preferrable to /usr/bin.
export PATH=/usr/local/bin:$PATH

# Ubuntu Ruby gem binaries
export PATH=/var/lib/gems/1.8/bin:$PATH

# MySQL
export PATH=/usr/local/mysql/bin:$PATH

# Jekyll (use dev version, not gem)
export PATH=~/Projects/jekyll/bin:$PATH

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# brew install autojump
# https://github.com/joelthelion/autojump
if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

# To get the GUI-less Vim from MacVim:
# ln -s /usr/local/bin/mvim ~/usr/local/bin/vim

# Barsoom
[[ -s "$HOME/.bs/profile" ]] && source "$HOME/.bs/profile"

# Trying out custom build of MacVim.
# https://github.com/b4winckler/macvim/wiki/Building
export VIM_APP_DIR=~/Projects/macvim/src/MacVim/build/Release
# The Homebrew version of CLI "mvim" hard-codes VIM_APP_DIR, so use the one from this dir instead.
export PATH=~/Projects/macvim/src/MacVim:$PATH
