" :SaveAs! with a bang creates directories if they don't exist.
" By Henrik Nyh <http://henrik.nyh.se> under the MIT license.

command! -nargs=1 -complete=file -bang SaveAs :call SaveAs(<f-args>, '<bang>')

function! SaveAs(filename, bang)
  if a:bang == "!"
    let l:dir = fnamemodify(a:filename, ":p:h")
    if !isdirectory(l:dir)
      call mkdir(l:dir, "p")
    end
  endif
  exe "saveas" . a:bang . " " . a:filename
endfunction


" http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev

function! s:CommandCabbr(abbreviation, expansion)
  execute 'cabbr ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
endfunction

command! -nargs=+ CommandCabbr call <SID>CommandCabbr(<f-args>)

" :saveas calls :SaveAs
CommandCabbr saveas SaveAs
