" <leader>r to open HTML file in browser while keeping focus in Vim.
map <buffer> <leader>r :call system("open -g " . shellescape(expand("%")))<cr>:echo "Opened in background browser."<cr>

" <leader>R to reload the active Chrome tab.
map <buffer> <leader>R :call system("osascript -e 'tell app \"Google Chrome\" to tell the active tab of the first window to reload'")<cr>:echo "Reloaded in background browser."<cr>
