" Quicker filetype setting:
"   :F html
" instead of
"   :set ft=html
" Can tab-complete filetype.
command! -nargs=1 -complete=filetype F set filetype=<args>

" Even quicker setting often-used filetypes.
command! FC set filetype=coffee
command! FH set filetype=haml
command! FR set filetype=ruby
command! FV set filetype=vim

" Strip trailing whitespace (including that in blank lines).
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
command! Strip let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl

" Because I often accidentally :W when I mean to :w.
command! W w

" Save a file as root.
cabbrev w!! w !sudo tee % > /dev/null<CR>:e!<CR><CR>

" Snippets schmippets.
iabbrev ddate <C-r>=strftime("%F")<CR>
iabbrev mit By Henrik Nyh <http://henrik.nyh.se> <C-r>=strftime("%F")<CR> under the MIT license.
iabbrev lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
