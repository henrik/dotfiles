" :Reveal to reveal in OS X Finder.

function! s:RevealInFinder()
  :silent! ! open -R %
endfunction

command! Reveal call <SID>RevealInFinder()
