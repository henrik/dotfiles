set encoding=utf-8                    " In case $LANG doesn't have a sensible value.

syntax on                             " Syntax highlighting.
set background=dark                   " Inquiring plugins want to know.
color blackboard                      " Default color scheme.

set backspace=indent,eol,start        " Allow backspacing over everything in insert mode.
set fillchars=vert:\                  " No pipes in vertical split separators.
set laststatus=2                      " Always show status bar.
set listchars=nbsp:·,tab:▸\ ,trail:·  " Configure how invisibles appear.
set list                              " Show invisibles.
set modelines=3                       " Use modeline overrides.
set nojoinspaces                      " 1 space, not 2, when joining sentences.
set number                            " Show gutter with line numbers.
set scrolloff=1                       " Minimum number of lines to always show above/below the caret.
set showcmd                           " Show partially typed command sequences.
set visualbell                        " Don't beep.
set wildmode=longest,list             " Autocompleting files: prompt, don't autopick.
set wrap                              " Soft wrap.

" Indentation.
set expandtab                         " Replace tabs with spaces.
set shiftwidth=2                      " Spaces used for autoindent and commands like >>.
set softtabstop=2                     " Spaces inserted by <Tab>.

" Searching.
set gdefault                          " Global search by default (/g turns it off).
set hlsearch                          " Highlight results.
set incsearch                         " Search-as-you-type.
set ignorecase smartcase              " Case-insensitive unless we include uppercase.

" Can autocomplete CSS classes etc with dashes.
" Also changes the "w" small word motion not to stop at dashes,
" but use https://github.com/henrik/CamelCaseMotion for that.
set iskeyword+=-

" More persistent command history.
set history=10000

" Hide away backup and swap files.
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Reload file without prompting if it has changed on disk.
" Will still prompt if there is unsaved text in the buffer.
set autoread
" MacVim checks for autoread when it gains focus; terminal Vim
" must trigger checks. Do so when switching buffers, or after
" 2 secs (the value of updatetime) of pressing nothing.
set updatetime=2000
au WinEnter,BufWinEnter,CursorHold * silent! checktime

" Automatically save changes before switching buffer with some
" commands, like :cnfile.
set autowrite

" Autosave.
" http://vim.wikia.com/wiki/Auto_save_files_when_focus_is_lost
au BufLeave,FocusLost * silent! wa

set exrc   " Enable per-directory .vimrc files.
set secure " Disable unsafe commands in per-directory .vimrc files.
