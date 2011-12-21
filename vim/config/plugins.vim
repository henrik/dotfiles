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
