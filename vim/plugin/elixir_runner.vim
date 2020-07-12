" <leader>,r to run the current buffer as Elixir (even if it's not written to a file).
" Only enabled when the filetype is 'elixir'.
"
" By Henrik Nyh 2015-06-24 under the MIT license.

augroup run_elixir
  autocmd!
  autocmd FileType elixir map <buffer> <leader>r :RunElixir<CR>
augroup END

command! RunElixir call <SID>RunElixir()

function! s:RunElixir()
  exe "! elixir -e " . shellescape(join(getline(1, "$"), "\n"), 1)
endfunction
