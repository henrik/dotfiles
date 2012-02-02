" :BI to re-source this file and then install bundles with Vundle.
cabbrev BI :source ~/.vim/config/plugins.vim<CR> :BundleInstall<CR>

Bundle 'bkad/CamelCaseMotion'
Bundle 'henrik/ack.vim'
Bundle 'henrik/vim-indexed-search'
Bundle 'henrik/vim-markdown-preview'
Bundle 'henrik/vim-open-url'
Bundle 'henrik/vim-reveal-in-finder'
Bundle 'henrik/vim-ruby-runner'
Bundle 'henrik/vim-yaml-flattener'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'taq/vim-rspec'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/argtextobj.vim'
Bundle 'vim-scripts/file-line'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'wincent/Command-T'

" Command-T
let g:CommandTMaxHeight=20
let g:CommandTMatchWindowAtTop=1
set wildignore+=*.o,*.obj,.git,tmp
set wildignore+=public/uploads,db/sphinx

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Align.vim
" Disable mapping to ,w= so we can use ,w for CamelCaseMotion.
map <nop> <Plug>AM_w=

" NERDTree
let NERDTreeIgnore=['\.rbc$', '\~$']
" Disable menu
let g:NERDMenuMode=0

" Commentary.
map <leader>c <Plug>Commentary
map <leader>cc <Plug>CommentaryLine

" YankRing
" Don't map gp and gP.
let g:yankring_paste_using_g = 0
let g:yankring_history_dir = '~/.vim/backup'
