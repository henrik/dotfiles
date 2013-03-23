" https://gist.github.com/mislav/5189704

let g:tmux_is_last_pane = 0
au WinEnter * let g:tmux_is_last_pane = 0

" Like `wincmd` but also change tmux panes instead of vim windows when needed.
function! TmuxWinCmd(direction)
  let nr = winnr()
  let tmux_last_pane = (a:direction == 'p' && g:tmux_is_last_pane)
  if !tmux_last_pane
    " try to switch windows within vim
    exec 'wincmd ' . a:direction
  endif
  " Forward the switch panes command to tmux if:
  " a) we're toggling between the last tmux pane;
  " b) we tried switching windows in vim but it didn't have effect.
  if tmux_last_pane || nr == winnr()
    let cmd = 'tmux select-pane -' . tr(a:direction, 'phjkl', 'lLDUR')
    exec 'silent !'.cmd
    redraw! " because `exec` fucked up the screen. why is this needed?? arrghh
    let g:tmux_is_last_pane = 1
  else
    let g:tmux_is_last_pane = 0
  endif
endfunction

" Ctrl + arrows to jump between windows.
" Can also jump to adjacent tmux panes.
noremap <c-up> :call TmuxWinCmd('k')<cr>
noremap <c-down> :call TmuxWinCmd('j')<cr>
noremap <c-right> :call TmuxWinCmd('l')<cr>
noremap <c-left> :call TmuxWinCmd('h')<cr>
