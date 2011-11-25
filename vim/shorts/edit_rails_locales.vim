" :Loc to open locales in splits in a tab.

function! s:EditLocales()
  tabe
  args config/locales/*.yml | vertical all
endfunction

command! Loc call <SID>EditLocales()
