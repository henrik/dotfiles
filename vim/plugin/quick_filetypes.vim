" Quicker filetype setting:
"   :F html
" instead of
"   :setf html
" Can tab-complete filetype.
command! -nargs=1 -complete=filetype F set filetype=<args>

" Even quicker setting often-used filetypes.
command! FC set filetype=coffee
command! FH set filetype=haml
command! FS set filetype=slim
command! FR set filetype=ruby
command! FV set filetype=vim
command! FM set filetype=markdown
