function! s:SlimifyHaml()
  silent! ! haml2slim %
  vsp
  exe "e " . expand("%:r") . ".slim"
endfunction

command! SlimifyHaml call <SID>SlimifyHaml()
