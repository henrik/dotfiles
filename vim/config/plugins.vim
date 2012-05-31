" Pathogen.vim.
" Must turn filetype off and then back on.
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

" Command-T
let g:CommandTMaxHeight=20
let g:CommandTMatchWindowAtTop=1
set wildignore+=*.o,*.obj,.git,tmp
set wildignore+=public/uploads,db/sphinx,vim/backup

map <leader>T :CommandTFlush<CR>

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

map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>

" Commentary.
map <leader>c <Plug>Commentary
map <leader>cc <Plug>CommentaryLine

" Git grep.
" Using "a" because it used to be :Ack.
" We need the trailing space.
nnoremap <leader>a :GitGrep 

" Buffergator
let g:buffergator_suppress_keymaps = 1
let g:buffergator_sort_regime = 'mru'

map <leader>g :BuffergatorToggle<CR>
