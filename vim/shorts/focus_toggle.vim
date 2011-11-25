" By Henrik Nyh <http://henrik.nyh.se> 2011-11-25 under the MIT license.
"
" <leader>f toggles RSpec :focus on current line, e.g. between
"
"   describe "Foo" do
"
" and
"
"   describe "Foo", :focus do
"
" It handles variations like
"
"   context "Foo", :other, :focus, :flags {
"   it :focus do
"   it :focus { "stuff" }
"
" With a visual selection, <leader>f removes :focus but doesn't dare try to add them.

function! s:FocusRemove()
  silent! s/\v[, ]\s*:focus\s*( do| \{|,)/\1/
endfunction

function! s:FocusToggle()
  try
    s/\v[, ]\s*:focus\s*( do| \{|,)/\1/
  catch /E486:/  " Pattern not found
    silent! s/\v( do\s*$| \{)/, :focus\1/
    silent! s/\v^(\s*(describe|context|it)),/\1/
  endtry
endfunction

nnoremap <leader>f :call <SID>FocusToggle()<CR>
vnoremap <leader>f :call <SID>FocusRemove()<CR>
