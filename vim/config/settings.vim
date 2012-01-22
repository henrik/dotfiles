set nocompatible                " Don't sacrifice anything for Vi compatibility.
set encoding=utf-8              " In case $LANG doesn't have a sensible value.

" pathogem.vim lets us keep plugins etc in their own folders under ~/.vim/bundle.
" http://www.vim.org/scripts/script.php?script_id=2332
" filetype off and then on again afterwards for ftdetect files to work properly.
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on       " Load plugin and indent settings for the detected filetype.
syntax on                       " Syntax highlighting.
color blackboard                " Default color scheme.

set backspace=indent,eol,start  " Allow backspacing over everything in insert mode.
set fillchars=vert:\            " No pipes in vertical split separators.
set laststatus=2                " Always show status bar.
"set lbr                        " Linebreak between words. Not compatible with listchars.
set listchars=nbsp:·,tab:▸\ ,trail:·  " Configure how invisibles appear.
set list!                       " Show invisibles.
set modelines=1                 " Use modeline overrides.
set nojoinspaces                " 1 space, not 2, when joining sentences.
set number                      " Show gutter with line numbers.
set ruler                       " Show line, column and scroll info in status line.
set scrolloff=3                 " Minimal number of lines to always show above/below the caret.
set showcmd                     " Show partially typed command sequences.
set visualbell                  " Don't beep.
set wildmode=longest,list       " Autocompleting files: prompt, don't autopick.
set wrap                        " Soft wrap.

" Indentation.
set expandtab                   " Replace tabs with spaces.
set shiftwidth=2                " Spaces used for autoindent and commands like >>.
set softtabstop=2               " Spaces inserted by <Tab>

" Searching.
set gdefault                    " Global search by default (/g turns it off).
set hlsearch                    " Highlight results.
set incsearch                   " Search-as-you-type.
set ignorecase                  " Case-insensitive…
set smartcase                   " …unless phrase includes uppercase.

" Hide away backup and swap files.
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Reload file without prompting if it has changed on disk.
" Will still prompt if there is unsaved text in the buffer.
" Works in MacVim but not in terminal Vim :/
set autoread

" Automatically save changes before switching buffer with some
" commands, like :cnfile (mapped to g+) etc.
set autowrite

" Leader.
let mapleader = ","

" iTerm2.
" Change cursor shape in insert mode.
" http://www.iterm2.com/#/section/documentation/escape_codes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
