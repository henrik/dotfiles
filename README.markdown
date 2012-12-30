# My dotfiles

## Install

Clone this repo into `~/.dotfiles`:

    git clone git@github.com:henrik/dotfiles.git ~/.dotfiles

Then install the dotfiles:

    rake

This rake task will not replace existing files, but it will replace existing symlinks.

The dotfiles will be symlinked, e.g. `~/.bash_profile` symlinked to `~/.dotfiles/bash_profile`.


## Vim

I'm assuming MacVim (`brew install macvim`) and at least Vim 7.

Install plugins from submodules:

    git submodule update --init

The Command-T plugin needs to be compiled:

    cd ~/.vim/bundle/command-t
    rvm system  # If you use rvm
    rake make


## tmux

Make it integrate with the OS X system clipboard:

    brew install reattach-to-user-namespace


## Ruby

Get colors in irb:

    gem install wirble

Or just use [pry](http://pry.github.com/) instead of irb, for colors and more:

    gem install pry


## Extras

The `extras` directory contains additional configuration files that are not dotfiles:

 * `VibrantInk.itermcolors` is a colorscheme for [iTerm2](http://www.iterm2.com/) ([source](https://github.com/asanghi/vibrantinklion)).

 * On a new Mac, run `~/.dotfiles/extras/os_x_defaults.sh` in the Terminal to change some silly defaults.


## Apps and utilities

\* means installed through the App Store.

 * [1Password](https://agilebits.com/onepassword)
 * [Adium](http://adium.im/)
 * [Airfoil](http://www.rogueamoeba.com/airfoil/) – Stream audio between machines
 * \*[Alfred](http://www.alfredapp.com/) – Launcher etc
 * \*[Carousel](http://carousel.mobelux.com/) – Instagram client
 * \*[Cloud.app](http://getcloudapp.com/) – Quick screenshot uploads
 * [Colors](http://mattpatenaude.com/#colors) – Color picker
 * [Crashplan](http://www.crashplan.com/) – Backup
 * \*[DaisyDisk](http://daisydiskapp.com/) – Disk usage
 * \*[Divvy](http://mizage.com/#macdivvy) – Window management
 * [Dropbox](https://www.dropbox.com)
 * \*[Fantastical](http://flexibits.com/fantastical) – Calendar UI
 * [Flickr Uploadr](http://www.flickr.com/tools/uploadr/)
 * [Google Chrome](https://www.google.com/chrome)
   * ["Test" instead of "Deliver" on Pivotal Tracker buttons](https://gist.github.com/1037501)
   * [1Password](http://blog.agilebits.com/2011/04/06/1password-mac-new-chrome-extension-beta/)
   * [Empty New Tab Page](https://chrome.google.com/webstore/detail/dpjamkmjmigaoobjbekmfgabipmfilij)
   * [Fittr Flickr](https://chrome.google.com/webstore/detail/fhaledancjhefginmkkondfjpnkhdglh)
   * [FlashBlock](https://chrome.google.com/webstore/detail/gofhjkjmkpinhpoiabjplobcaignabnl)
   * [Hide "Sponsored" from Etsy search results](http://userscripts.org/scripts/show/118177)
   * [Humans.txt](https://chrome.google.com/webstore/detail/pocdghmbbodjiclginddlaimdaholhfk)
   * [ICA-banken Autologin](https://chrome.google.com/webstore/detail/labmanhplgelgmjkdiinlbppkkokchao)
   * [RSS Subscription](https://chrome.google.com/webstore/detail/nlbjncdgjeocebhnmkbbbdekmmmcbfjd)
   * [WhatFont](http://chengyinliu.com/whatfont.html)
 * [iPhoto Library Manager](http://www.fatcatsoftware.com/iplm/)
 * [iStat Menus](http://bjango.com/mac/istatmenus/)
 * [iTerm2](http://www.iterm2.com) - Keyboard shortcuts should be xterm defaults
 * [KeyRemap4MacBook](http://pqrs.org/macosx/keyremap4macbook/) – Bind right-Option to Enter
 * [Little Snapper](http://www.realmacsoftware.com/littlesnapper/) – UI inspiration bin
 * [Mailplane](http://mailplaneapp.com/)
 * \*[Reeder](http://reederapp.com/)
 * [SuperDuper](http://www.shirt-pocket.com/SuperDuper/)
 * [Spotify](http://www.spotify.com)
 * \*[The Unarchiver](http://itunes.apple.com/app/the-unarchiver/id425424353)
 * [Transmission](http://www.transmissionbt.com/)

For development; not endorsed:

 * [Firefox](http://www.mozilla.org/firefox)
 * [VirtualBox](https://www.virtualbox.org/)
