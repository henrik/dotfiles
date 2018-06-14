" Pathogen.vim

" Must turn filetype off and then back on.
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

" fzf (fuzzy file finder)

" Include the basic fzf Vim functionality for the fzf.vim plugin to work.
source ~/.fzf/plugin/fzf.vim

let g:fzf_history_dir = '~/.local/share/fzf-history'

" Only files not excluded by .gitignore, for speed. This means it won't show non-version-controlled files.
" Ideally we'd use wildignore. See: https://github.com/junegunn/fzf.vim/issues/133
map <C-p> :GFiles<CR>

" Ctrl-P

let g:ctrlp_map = '<Nop>'

let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 20
let g:ctrlp_show_hidden = 0
let g:ctrlp_max_files = 0
let g:ctrlp_switch_buffer = 0

" Only cache if we're over this number of files.
let g:ctrlp_use_caching = 2000

" Don't let ctrlp change the working directory. Instead it now uses
" the directory where vim was started. This fixes issues with some
" projects that have nested git directories.
let g:ctrlp_working_path_mode = 0

" Files to skip.
" Possibly used by other plugins, like Command-T.
set wildignore+=*.o,*.obj,.git,tmp
set wildignore+=public/uploads,db/sphinx,vim/backup
set wildignore+=.themes  " Octopress.
set wildignore+=deps,node_modules  " Phoenix

map <C-b> :CtrlPBuffer<CR>

" Syntastic

let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
" Slow, so only run on :SyntasticCheck
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }

" NERDTree

let NERDTreeIgnore=['\.rbc$', '\~$']

" Disable menu.
let g:NERDMenuMode=0

map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFindIfFindable<CR>

" Commentary

xmap <leader>c <Plug>Commentary
nmap <leader>c <Plug>Commentary
nmap <leader>cc <Plug>CommentaryLine
nmap <leader>cu <Plug>CommentaryUndo

" Git grep

" Using "a" because it used to be :Ack.
" We need the trailing space.
exe "nnoremap <leader>a :GitGrep "

" vimux

let g:VimuxOrientation = "h"
let g:VimuxUseNearestPane = 1

" turbux

let g:no_turbux_mappings = 1
map M <Plug>SendTestToTmux
map m <Plug>SendFocusedTestToTmux

" CamelCaseMotion

" Make c,w not include the trailing underscore:
" https://github.com/bkad/CamelCaseMotion/issues/10
nmap c,w c,e
nmap ci,w ci,e

" Blockle

" ,b is taken by CamelCaseMotion.
let g:blockle_mapping = '<leader>B'

" Ack.vim

" Use The Silver Searcher.
let g:ackprg = 'ag --nogroup --nocolor --column'

" vim-coffee-script
let g:coffee_compile_vert = 1

" exercism

map § :ExercismTest<CR>

" Shift+§ to run additional tests inlined in the exercise file.
map ° :! ruby %<CR>

" vim-markdown

let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

" Rainbow Parentheses Improved

let g:rainbow_active = 0
