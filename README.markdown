# My dotfiles

## Install

Clone this repo into `~/.dotfiles`:

    git clone git@github.com:henrik/dotfiles.git ~/.dotfiles

Then install the dotfiles:

    cd .dotfiles
    rake

This rake task will not replace existing files, but it will replace existing symlinks.

The dotfiles will be symlinked, e.g. `~/.bash_profile` symlinked to `~/.dotfiles/bash_profile`.

In Vim, run this to install plugins:

    :PlugInstall

Don't forget to **replace the name and email in gitconfig** if you're not Henrik :p


## Vim

Uses [vim-plug](https://github.com/junegunn/vim-plug) for plugins.

To add plugins:

* Edit `~/.vim/config/plugins.vim`
* `:source ~/.vimrc`
* `:PlugInstall`

To remove plugins:

* Edit `~/.vim/config/plugins.vim`
* `:source ~/.vimrc`
* `:PlugClean`


## tmux

Make it integrate with the OS X system clipboard:

    brew install reattach-to-user-namespace


## Extras

The `extras` directory contains additional configuration files that are not dotfiles:

 * `VibrantInk.itermcolors` is a colorscheme for [iTerm2](http://www.iterm2.com/) ([source](https://github.com/asanghi/vibrantinklion)).

 * On a new Mac:
   * Run `brew bundle --file ~/.dotfiles/extras/Brewfile` to install the apps I want.
   * Run `~/.dotfiles/extras/os_x_defaults.sh` in the Terminal to change some silly defaults.
