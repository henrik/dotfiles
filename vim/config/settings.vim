set encoding=utf-8                    " In case $LANG doesn't have a sensible value.

syntax on                             " Syntax highlighting.
set background=dark                   " Inquiring plugins want to know.
color blackboard                      " Default color scheme.

set backspace=indent,eol,start        " Allow backspacing over everything in insert mode.
set fillchars=vert:\                  " No pipes in vertical split separators.
set laststatus=2                      " Always show status bar.
set listchars=nbsp:·,tab:▸\ ,trail:·  " Configure how invisibles appear.
set list!                             " Show invisibles.
set modelines=1                       " Use modeline overrides.
set nojoinspaces                      " 1 space, not 2, when joining sentences.
set number                            " Show gutter with line numbers.
set ruler                             " Show line, column and scroll info in status line.
set scrolloff=3                       " Minimum number of lines to always show above/below the caret.
set showcmd                           " Show partially typed command sequences.
set visualbell                        " Don't beep.
set wildmode=longest,list             " Autocompleting files: prompt, don't autopick.
set wrap                              " Soft wrap.

" Indentation.
set expandtab                         " Replace tabs with spaces.
set shiftwidth=2                      " Spaces used for autoindent and commands like >>.
set softtabstop=2                     " Spaces inserted by <Tab>

" Searching.
set gdefault                          " Global search by default (/g turns it off).
set hlsearch                          " Highlight results.
set incsearch                         " Search-as-you-type.
set ignorecase smartcase              " Case-insensitive unless we include uppercase.

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
au WinEnter,BufWinEnter,CursorHold * checktime

" Automatically save changes before switching buffer with some
" commands, like :cnfile (mapped to g+) etc.
set autowrite

" Unbreak keyboard shortcuts in tmux.
" http://superuser.com/questions/401926/
if &term =~ '^screen'
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
  " Also unbreak Command-T.
  map <Esc>[B <Down>
endif

" Different cursor for insert mode in iTerm2, with tmux workaround.
" https://gist.github.com/1195581
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
