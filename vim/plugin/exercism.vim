" Run exercism.io tests.
"
" By Henrik Nyh <http://henrik.nyh.se> under the MIT license.

function! s:ExercismTest()
  if &filetype == "ruby"
    ! ruby %:h/*_test.rb
  elseif &filetype == "javascript"
    ! jasmine-node %:h
  elseif &filetype == "coffee"
    ! jasmine-node --coffee %:h
  elseif &filetype == "python"
    ! python %:h/*_test.py
  endif
endfunction

command! ExercismTest call <SID>ExercismTest()
command! ExercismSubmit ! exercism submit %
command! ExercismOpen ! exercism open
