set nocompatible                " Don't sacrifice anything for Vi compatibility.
let mapleader = ","

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
source ~/.vim/shorts/prune_buffers.vim
source ~/.vim/shorts/run_html.vim
source ~/.vim/shorts/saveas_bang_to_mkdir_p.vim

" Fix some keyboard shortcuts in Vim with screen-256color (=in tmux).
" http://blog.yjl.im/2010/01/key-control-code-issue-in-between-vim.html
map [1;5A <C-Up>
map [1;5B <C-Down>
map [1;2D <S-Left>
map [1;2C <S-Right>
