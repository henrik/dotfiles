" Hit S in command mode to save, as :w<CR> is a mouthful and MacVim
" Command-S is a bad habit when using terminal Vim.
" We overload a command, but use 'cc' for that anyway.
noremap S :w<CR>

" Make Q useful and avoid the confusing Ex mode.
noremap Q <nop>
" Close window.
noremap QQ :q<CR>
" Close a full tab page.
noremap QW :windo bd<CR>
" Close all.
noremap QA :qa<CR>

" Repeat last substitution, including flags, with &.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" In command-line mode, C-a jumps to beginning (to match C-e).
cnoremap <C-a> <Home>

" Select the text that was last edited/pasted.
" http://vimcasts.org/episodes/bubbling-text/
nmap gV `[v`]

" Move by screen lines instead of file lines.
" http://vim.wikia.com/wiki/Moving_by_screen_lines_instead_of_file_lines
noremap <Up> gk
noremap <Down> gj
noremap k gk
noremap j gj
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Shift + left/right to switch tabs.
" You may need to map these in iTerm2 prefs to escape
" sequences [1;2C (right) and D (left).
noremap <S-Left> :tabp<CR>
noremap <S-Right> :tabn<CR>

" Un-highlight search matches
nnoremap <leader><leader> :noh<CR>

" Open URL from this line (OS X only).
map <leader>u :call OpenURI()<CR>

" Ack/Quickfix windows
map <leader>q :cclose<CR>
" Center line on previous/next fix.
map - :cprev<CR> zz
map + :cnext<CR> zz
" Center line in previous/next file.
map g- :cpfile<CR> zz
map g+ :cnfile<CR> zz

" Create a split on the given side.
" From http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/ via joakimk.
nmap <leader><left>   :leftabove  vsp<CR>
nmap <leader><right>  :rightbelow vsp<CR>
nmap <leader><up>     :leftabove  sp<CR>
nmap <leader><down>   :rightbelow sp<CR>

" Tab/shift-tab to indent/outdent in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Keep selection when indenting/outdenting.
vnoremap > >gv
vnoremap < <gv

" I constantly hit "u" in visual mode when I mean to "y". Use "gu" for those rare occasions.
vnoremap u <nop>
vnoremap gu u

" Because I often accidentally :W when I mean to :w.
command! W w

" In command mode, type %% to insert the path of the currently edited file, as a shortcut for %:h<tab>.
cmap %% <C-R>=expand("%:h") . "/" <CR>

" Run tests in tmux.
nmap § :call VimuxRunCommand("rake")<cr>
autocmd BufNewFile,BufRead /Users/henrik/Dropbox/Code/exercism/* nmap § :ExercismTest<cr>

" Tell other tmux pane to ctrl+c.
nmap <leader>§ :VimuxInterruptRunner<CR>
