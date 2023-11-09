# My dotfiles

## Install

On a Mac, switch the shell to bash:

    chsh -s /bin/bash

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

I intentionally do not install fzf via Vim, because I couldn't get it working well when sharing dotfiles beteeen a macOS host and a Linux guest.

You are expected to have Node installed with a new-enough version to make [coc.nvim](https://github.com/neoclide/coc.nvim) happy.

You are expected to have the `solargraph` gem installed to use coc.nvim with Ruby. If you use [asdf](https://asdf-vm.com/), you should get this automatically when you install a new Ruby version via [.default-gems](https://github.com/asdf-vm/asdf-ruby#default-gems). Otherwise use `gem install solargraph`.

In Vim, run this to install plugins:

    :PlugInstall

Don't forget to **replace the name and email in gitconfig** if you're not Henrik :p


## Vim

Uses [vim-plug](https://github.com/junegunn/vim-plug) for plugins.

To add plugins:

* Edit `~/.vim/config/plugins.vim`
* `:so %`
* `:PlugInstall`

To remove plugins:

* Edit `~/.vim/config/plugins.vim`
* `:so %`
* `:PlugClean`


## tmux

Make it integrate with the OS X system clipboard:

    brew install reattach-to-user-namespace


## Extras

The `extras` directory contains additional configuration files that are not dotfiles:

 * `VibrantInk.itermcolors` is a colorscheme for [iTerm2](http://www.iterm2.com/) ([source](https://github.com/asanghi/vibrantinklion)).

 * On a new Mac:
   * Run `brew bundle --file ~/.dotfiles/extras/Brewfile` to install the apps I want.
   * Run `~/.dotfiles/extras/mac_os_defaults.sh` in the Terminal to change some silly defaults.
