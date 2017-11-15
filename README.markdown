# My dotfiles

## Install

Clone this repo into `~/.dotfiles`:

    git clone git@github.com:henrik/dotfiles.git ~/.dotfiles

Then install the dotfiles:

    cd .dotfiles
    rake

This rake task will not replace existing files, but it will replace existing symlinks.

The dotfiles will be symlinked, e.g. `~/.bash_profile` symlinked to `~/.dotfiles/bash_profile`.

To use [fzf](https://github.com/junegunn/fzf) in Vim (or the shell), install it with:

    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install

At the time of writing, Vim will complain without fzf. TODO: Make it optional?

Don't forget to **replace the name and email in gitconfig** if you're not Henrik :p


## Vim

Add a new plugin:

    # E.g.:
    git submodule add https://github.com/keith/swift.vim.git vim/bundle/vim-swift

Install plugins from submodules:

    git submodule update --init

Update all plugins to latest:

    git submodule update --recursive --remote


## tmux

Make it integrate with the OS X system clipboard:

    brew install reattach-to-user-namespace


## Extras

The `extras` directory contains additional configuration files that are not dotfiles:

 * `VibrantInk.itermcolors` is a colorscheme for [iTerm2](http://www.iterm2.com/) ([source](https://github.com/asanghi/vibrantinklion)).

 * On a new Mac, run `~/.dotfiles/extras/os_x_defaults.sh` in the Terminal to change some silly defaults.
