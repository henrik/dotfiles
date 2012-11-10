" I too often trigger NERDTreeFind after opening a project, which reveals
" the project dir and thus shows the parent dir, when I wanted to just
" show the tree. This plugin fixes that.
"
" By Henrik Nyh <http://henrik.nyh.se> under the MIT license.

function! s:NERDTreeFindIfFindable()
  if len(expand("%"))
    " If current buffer has name, find it.
    NERDTreeFind
  else
    " If current buffer is unsaved, just show tree.
    NERDTree
  endif
endfunction

command! NERDTreeFindIfFindable call <SID>NERDTreeFindIfFindable()
