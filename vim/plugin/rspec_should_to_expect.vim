" Turn RSpec 'should' into the new 'expect' style.
" Also turns 'should ==' into 'expect(…).to eq'.
" The command acts on the current line or in a given range (e.g. visual range).

function! s:ShouldToExpect()
  .s/^\(\s\+\)\(.\+\)\.should\>/\1expect(\2).to/e
  .s/^\(\s\+\)\(.\+\)\.should_not\>/\1expect(\2).not_to/e
  .s/\(expect(.\+)\.\(to\|not_to\)\) ==/\1 eq/e
endfunction

command! -range Expect execute '<line1>,<line2>call <SID>ShouldToExpect()'
