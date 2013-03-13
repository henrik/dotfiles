" Yank to OS X pasteboard in iTerm2 with <leader>y.
" Works even over SSH and in tmux.
" FIXME: Actually works over SSH but not yet in tmux, locally or not :((
"
" By Henrik Nyh <http://henrik.nyh.se> 2013-03-13 under the MIT license.
"
" Uses iTerm2 escape sequences to copy to host clipboard.
"
" NOTE: This iTerm2 pref must be checked:
" General > Selection > Allow clipboard access to terminal apps
"
" Further reading:
" https://code.google.com/p/iterm2/issues/detail?id=1468
" https://code.google.com/p/iterm2/issues/detail?id=2094
" http://git.chromium.org/gitweb/?p=chromiumos/platform/assets.git;a=blob;f=chromeapps/hterm/etc/osc52.vim;h=1cb6931d4f8ad028ca0a1c400389047e1b67228b;hb=HEAD

noremap <leader>y "cy:call <SID>iterm_copy(@c)<CR>

function! s:iterm_copy(str)
  call <SID>rawecho("\\e]50;CopyToClipboard\\a". a:str . "\\e]50;EndCopy\\a")
endfunction

function! s:rawecho(str)
  " Welcome to escape hell!
  " We need to escape arguments for the shell.
  " And % -> %% so printf doesn't treat them as format specifiers.
  " And % -> \% so Vim doesn't expand % to the buffer name.
  exec("silent! !printf " . escape(substitute(shellescape(a:str), "%", "%%", "g"), "%"))
  redraw!
endfunction
