" Remember last location in file, but not for commit messages.
augroup remember_last_file_loc
  autocmd!
  autocmd BufReadPost *
    \ if &filetype !~ 'commit\c' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
augroup END
