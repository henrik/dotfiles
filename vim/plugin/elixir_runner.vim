" By Henrik Nyh 2015-06-24 under the MIT license.

au FileType elixir map <buffer> <leader>r :RunElixir<CR>

command! RunElixir call <SID>RunElixir()

function! s:RunElixir()
  exe "! elixir -e " . shellescape(join(getline(1, "$"), "\n"))
endfunction

