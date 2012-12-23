" Remember last location in file, but not for commit messages.
au BufReadPost *
  \ if &filetype !~ 'commit\c' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
