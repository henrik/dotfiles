" :Lab to open an Elixir buffer with some boilerplate to experiment with stuff.
" By Henrik Nyh <http://henrik.nyh.se> under the MIT license.

command! Lab call <SID>Lab()

function! s:Lab()
  tabe
  set filetype=elixir

  " Make it a scratch (temporary) buffer.
  setlocal buftype=nofile bufhidden=wipe noswapfile

  " Close on q.
  "map <buffer> q ZZ

  " Some boilerplate please.
  " Lab + Run so you can e.g. implement a macro in Lab and require it in Run.
  call append(0, ["defmodule Lab do", "end", "", "defmodule Run do", "  def run do", "  end", "end", "", "Run.run"])

  " Delete blank line at end.
  $d

  " Jump to first line.
  1
endfunction
