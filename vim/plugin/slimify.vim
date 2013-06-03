function! s:SlimifyHaml()
  call system("haml2slim " . shellescape(expand("%")))
  vsp
  exe "e " . expand("%:r") . ".slim"
endfunction

command! SlimifyHaml call <SID>SlimifyHaml()
