" Unbreak keyboard shortcuts in tmux.
" http://superuser.com/questions/401926/
if &term =~ '^screen'
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
  " Also unbreak Command-T.
  map <Esc>[B <Down>
endif
