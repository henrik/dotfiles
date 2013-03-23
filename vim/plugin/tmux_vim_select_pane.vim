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
" OS X may overload these; uncheck them in OS X prefs.
" You may also need to map them in iTerm2 prefs to escape
" sequences [1;5A (up) B (down) C (right) and D (left).
noremap <C-Up> :call TmuxWinCmd('k')<cr>
noremap <C-Down> :call TmuxWinCmd('j')<cr>
noremap <C-Right> :call TmuxWinCmd('l')<cr>
noremap <C-Left> :call TmuxWinCmd('h')<cr>
