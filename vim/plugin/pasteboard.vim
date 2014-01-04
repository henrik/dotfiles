function! s:is_over_ssh()
  return !empty($SSH_CLIENT) || !empty($SSH_TTY)
endfunction

" Much stolen from
" https://github.com/tpope/vim-unimpaired/commit/cabf4b79b1c0cd9c9a8beec303c2e6172c82d19f

function! s:setup_paste()
  let s:paste = &paste
  set paste
endfunction

augroup pasteboard
  autocmd!
  autocmd InsertLeave *
        \ if exists('s:paste') |
        \   let &paste = s:paste |
        \   unlet s:paste |
        \ endif
augroup END

if <SID>is_over_ssh()
  nnoremap <leader>y :echoerr "Can't yank to OS X pasteboard :("<CR>
  vnoremap <leader>y :echoerr "Can't yank to OS X pasteboard :("<CR>

  " Paste from OS X pasteboard without messing up indent.
  " Stores away current paste/nopaste, sets "paste", goes into insert mode.
  " After you leave insert mode, it restores that old paste/nopaste state.
  noremap <leader>p :call <SID>setup_paste()<CR>o
  noremap <leader>P :call <SID>setup_paste()<CR>O
else
  " Yank to OS X pasteboard.
  nnoremap <leader>y "*yy
  vnoremap <leader>y "*y

  " Paste from OS X pasteboard without messing up indent.
  noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
  noremap <leader>P :set paste<CR>:put! *<CR>:set nopaste<CR>
endif
