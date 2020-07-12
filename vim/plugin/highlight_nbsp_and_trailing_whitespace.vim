" https://github.com/aalin/dotfiles/blob/master/vimrc
"
" NOTE: Can only have three of these, using match/2match/3match:
" http://stackoverflow.com/a/18167529/6962

augroup highlight_nbsp_and_trailing_ws
  autocmd!

  autocmd BufNewFile,BufRead * highlight nbsp ctermbg=Red
  autocmd BufNewFile,BufRead * match nbsp "[\xc2\xa0]"

  autocmd BufNewFile,BufRead * highlight trailing_spaces ctermbg=Red
  autocmd BufNewFile,BufRead * 2match trailing_spaces "\s\+$"
augroup END
