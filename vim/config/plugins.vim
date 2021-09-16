call plug#begin('~/.vim/vim-plug-plugins')
" Make sure you use single quotes.

Plug 'AndrewRadev/splitjoin.vim'    " Language-aware toggle between single-line and multi-line versions.
Plug 'barsoom/vim-turbux'           " Lets you run the current test in a tmux split via Vimux.
Plug 'benmills/vimux'               " Lets you run commands in a tmux split.
Plug 'bogado/file-line'             " Can open myfile.xy:123 to jump to that line.
Plug 'henrik/CamelCaseMotion'       " Motions like ,w and ,b for camelCase and snake_case sub-words.
Plug 'henrik/git-grep-vim'          " Adds :GitGrep.
Plug 'henrik/vim-indexed-search'    " Show e.g. 'match 1 of 3' in searches.
Plug 'henrik/vim-open-url'          " Open URLs.
Plug 'henrik/vim-reveal-in-finder'  " Adds :Reveal to reveal the current file in macOS Finder.
Plug 'henrik/rename.vim'            " 'Rename newname.txt' and 'Rename! newdir/newname.txt'
Plug 'henrik/vim-ruby-runner'       " Execute Ruby into an output buffer.
Plug 'henrik/vim-yaml-helper'       " YAML utilities like :YamlFullPath and :YAMLGoToKey.
Plug 'henrik/vim-qargs'             " https://thepugautomatic.com/2012/07/project-wide-search-and-replace-in-vim-with-qdo/
Plug 'junegunn/fzf'                 " Dependency of fzf.vim.
Plug 'junegunn/fzf.vim'             " File navigation.
Plug 'preservim/nerdtree'           " File tree drawer.
Plug 'tpope/vim-commentary'         " Toggle comments.
Plug 'tpope/vim-endwise'            " Add 'end' automatically to Ruby and Elixir blocks etc.
Plug 'tpope/vim-fugitive'           " Vim commands like :Gwrite and :Gblame.
Plug 'tpope/vim-projectionist'      " :A alternate file navigation.
Plug 'tpope/vim-rake'               " vim-projectionist support in non-Rails Ruby projects.
Plug 'tpope/vim-repeat'             " Lets you use '.' to repeat vim-surround commands.
Plug 'tpope/vim-surround'           " Change, add or remove surrounding characters like quotes or brackets.
Plug 'vim-scripts/argtextobj.vim'   " Argument text objects, like daa to delete a function argument.
Plug 'ap/vim-css-color'             " Color name highlighter.
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Supports VSCode features, language servers etc.

" Languages/frameworks.
Plug 'elixir-editors/vim-elixir'
Plug 'elmcast/elm-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'keith/swift.vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-rails'
Plug 'slim-template/vim-slim'
Plug 'vim-ruby/vim-ruby'

call plug#end()

" fzf (fuzzy file finder)

let g:fzf_history_dir = '~/.local/share/fzf-history'

" Only files not excluded by .gitignore, for speed. This means it won't show non-version-controlled files.
" Ideally we'd use wildignore. See: https://github.com/junegunn/fzf.vim/issues/133
map <C-p> :GFiles<CR>

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
" Using 'a' because it used to be :Ack.
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

" vim-coffee-script
let g:coffee_compile_vert = 1

" vim-markdown
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

" elm-vim
let g:elm_format_autosave = 1

" coc.nvim

" coc-solargraph: Ruby language server.
let g:coc_global_extensions = ['coc-solargraph']

" In Devbox, use the global node, since per-project nodes may be too old for coc.nvim.
if exists('$DEVBOX')
  let g:coc_node_path = '/devbox/tmp/devbox/binwrappers/node'
endif
