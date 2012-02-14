" <leader>r to open HTML file in browser while keeping focus in Vim.
au FileType html map <buffer> <leader>r :silent! ! open -g %<cr>:redraw!<cr>
