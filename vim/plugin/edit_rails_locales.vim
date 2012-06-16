" :Loc to open locales in splits in a tab.
" By Henrik Nyh <http://henrik.nyh.se> under the MIT license.

function! s:EditLocales()
  tabe
  args config/locales/*.yml | vertical all
endfunction

command! Loc call <SID>EditLocales()
