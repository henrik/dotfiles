" <leader>r to open HTML file in browser while keeping focus in Vim.
au FileType html map <buffer> <leader>r :silent! ! open -g %<cr>:redraw!<cr>
" <leader>R to reload the active Chrome tab.
au FileType html map <buffer> <leader>R :silent! ! osascript -e 'tell app "Google Chrome" to tell the active tab of the first window to reload'<cr>:redraw!<cr>
