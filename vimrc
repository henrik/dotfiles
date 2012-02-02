set nocompatible                " Don't sacrifice anything for Vi compatibility.

" Vundle for plugin management.
" https://github.com/gmarik/vundle
" filetype off and then on again afterwards for ftdetect files to work properly.
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" These must be loaded before turning filetype back on.
source ~/.vim/config/plugins.vim
" Load plugin and indent settings for the detected filetype.
filetype plugin indent on

source ~/.vim/config/settings.vim
source ~/.vim/config/statusline.vim
source ~/.vim/config/autocommands.vim
source ~/.vim/config/commands.vim
source ~/.vim/config/mappings.vim

" Snippets that are too long for .vimrc, too short for plugins.

source ~/.vim/shorts/edit_rails_locales.vim
source ~/.vim/shorts/focus_toggle.vim
