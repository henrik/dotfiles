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

function! s:paste_below()
  exe "normal o"
  call <SID>setup_paste()
  startinsert
endfunction

function! s:paste_above()
  exe "normal O"
  call <SID>setup_paste()
  startinsert
endfunction

if <SID>is_over_ssh()
  noremap <leader>y :echoerr "Can't yank to OS X clipboard :("<CR>

  " Paste from OS X pasteboard without messing up indent.
  noremap <leader>p :call <SID>paste_below()<CR>
  noremap <leader>P :call <SID>paste_above()<CR>
else
  " Yank to OS X pasteboard.
  noremap <leader>y "*y

  " Paste from OS X pasteboard without messing up indent.
  noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
  noremap <leader>P :set paste<CR>:put! *<CR>:set nopaste<CR>
endif
