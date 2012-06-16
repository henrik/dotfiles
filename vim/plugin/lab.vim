" :Lab to open a Ruby buffer with some content to experiment with stuff.
" By Henrik Nyh <http://henrik.nyh.se> under the MIT license.

command! Lab call <SID>Lab()

function! s:Lab()
  tabe
  read ~/.vim/plugin/lab.rb
  1d
  set filetype=ruby
  " Make it a scratch (temporary) buffer.
  setlocal buftype=nofile bufhidden=wipe noswapfile
  " Close on q.
  map <buffer> q ZZ
endfunction
