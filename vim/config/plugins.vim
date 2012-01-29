" Install with Vundle:
"   :BundleInstall

" Without this, :BundleClean removes Vundle.
Bundle 'gmarik/vundle'

Bundle 'bkad/CamelCaseMotion'
Bundle 'ervandew/supertab'
Bundle 'henrik/ack.vim'
Bundle 'henrik/vim-indexed-search'
Bundle 'henrik/vim-markdown-preview'
Bundle 'henrik/vim-ruby-runner'
Bundle 'henrik/vim-yaml-flattener'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'taq/vim-rspec'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'argtextobj.vim'
Bundle 'YankRing.vim'
Bundle 'git://git.wincent.com/command-t.git'

" Quarantine - remove if not missed.
"Bundle 'michaeljsmith/vim-indent-object'
"Bundle 'timcharper/textile.vim'
"Bundle 'tpope/vim-cucumber'
"Bundle 'tpope/vim-ragtag'
"Bundle 'hallison/vim-ruby-sinatra'
"Bundle 'ZoomWin'


" :BI to re-source this file and then install bundles.
cabbrev BI :source ~/.vim/config/plugins.vim<CR> :BundleInstall<CR>


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

" NERDCommenter
" Get rid of all mappings except one.
let g:NERDCreateDefaultMappings=0
map <leader>c <Plug>NERDCommenterToggle
