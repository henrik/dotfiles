set nocompatible
set encoding=utf-8
let mapleader = ","

set number
set ruler
set scrolloff=3  " minimum lines of context
syntax on

" Whitespace stuff
" Would use lbr for nicer linebreaks, but can't combine with listchars.
set wrap
set softtabstop=2
set shiftwidth=2
set expandtab

set list!
set listchars=nbsp:·,tab:▸\ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault  " global search by default; /g for first match.

nnoremap <leader><leader> :noh<cr>" ,, to un-highlight matches.


" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Always show status bar
set laststatus=2

" Show partially typed command sequences
set showcmd

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Command-T configuration
let g:CommandTMaxHeight=20
let g:CommandTMatchWindowAtTop=1

" Ack/Quickfix windows
map <Leader>q :cclose<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

if !exists("*s:setupWrapping")
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=72
  endfunction
endif

if !exists("*s:setupMarkup")
  function s:setupMarkup()
    call s:setupWrapping()
    map <buffer> <Leader>p :Mm <CR>
  endfunction
endif

" make and python use real tabs
au FileType make                                     set noexpandtab
au FileType python                                   set noexpandtab

" Thorfile, Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" Uncomment to have txt files hard-wrap automatically.
"au BufRead,BufNewFile *.txt call s:setupWrapping()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Move by screen lines instead of file lines.
" http://vim.wikia.com/wiki/Moving_by_screen_lines_instead_of_file_lines
:noremap <Up> gk
:noremap <Down> gj
:noremap k gk
:noremap j gj

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Create a split on the given side.
" From http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/ via joakimk.
nmap <leader><left>   :leftabove  vsp<CR>
nmap <leader><right>  :rightbelow vsp<CR>
nmap <leader><up>     :leftabove  sp<CR>
nmap <leader><down>   :rightbelow sp<CR>

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
color blackboard

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup
