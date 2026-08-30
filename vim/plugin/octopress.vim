" Octopress blog engine (http://octopress.org/) stuff for Vim.
" Some commands assume you have vim/plugin/herdr.vim.
"
" By Henrik Nyh <http://henrik.nyh.se> under the MIT license.

" Override in ~/.vimrc if you like.
" But you'll need to modify s:OPbrowse if the path format is different from mine.
if !exists("g:octopress_url")
  let g:octopress_url = "http://octopress.dev"
endif

" :OPonly to generate only the current post.
command! OPonly call HerdrRunCommand("rake generate_only[".expand("%:t:r")."]")
nmap <leader>oo :OPonly<CR>

" :OPgenerate to generate everything.
command! OPgenerate call HerdrRunCommand("rake generate")
nmap <leader>ogg :OPgenerate<CR>

" :OPdeploy to deploy.
command! OPdeploy call HerdrRunCommand("rake deploy")
nmap <leader>od :OPdeploy<CR>

" :OPgendep to generate everything and deploy.
command! OPgendep call HerdrRunCommand("rake gen_deploy")
nmap <leader>ogd :OPgendep<CR>


" :OPwatch to regenerate changed CSS.
command! OPwatch call HerdrRunCommand("compass watch")
nmap <leader>ow :OPwatch<CR>

" If you need to ctrl+c from OPwatch.
nmap <leader>oc :HerdrInterruptRunner<CR>

" :OPbrowse to open in a browser.
" Opens the current post if you're editing one, otherwise the root.
" Uses s:base_url, defined above.
command! OPbrowse call <SID>OPbrowse()
nmap <leader>ob :OPbrowse<CR>


function! s:OPbrowse()
  let l:url = g:octopress_url."/"
  if match(expand("%"), "source/_posts/") == 0
    let l:url .= substitute(expand("%:t:r"), "\\v(\\d{4})-(\\d{2})-\\d{2}-(.+)", "\\1/\\2/\\3/", "")
  endif

  exe "silent! ! open '".l:url."'"
  redraw!
endfunction
