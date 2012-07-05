" Promote variable to RSpec let.
" Based on
" https://github.com/myronmarston/vim_files/commit/ed60919f1857359da617491a7d7c14e8d4befae0
"
" Given either of
"
"   foo = x
"   @foo = x
"
" on the current line or in a given range (e.g. visual range),
" this command moves the assignments out to an RSpec let:
"
"   let(:foo) { x }
"
function! s:PromoteToLet()
  .s/@\?\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
endfunction

command! -range Let execute '<line1>,<line2>call <SID>PromoteToLet()'
