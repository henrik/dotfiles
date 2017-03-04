" A :Squirrel command to quickly make note of things you want to fix, but you
" should probably finish up the current task first.
"
" As in "squirrel it away" or avoiding a "Squirrel!" distraction to maintain focus.
"
" Notes are stored in a .squirrel file in Vim's current directory, with a
" timestamp and a link to the file and line.
"
" By the easily distracted Henrik Nyh <http://henrik.nyh.se> under the MIT license.
"
" # Adding to the list
"
"     :Squirrel Rename this to Bar
"
" This will store a reference to the current file and line, with the comment you
" provided and the current timestamp.
"
" To squirrel something away without a comment, do
"
"     :Squirrel!
"
" # Opening the list
"
"     :Squirrel
"
" All squirreled-away data is stored in a .squirrel file in Vim's current directory.
" (You may want to ignore that file in your VCS, e.g. in .gitignore.)
"
" This command opens the .squirrel file in a new tab.
"
" You can use the "gf" command on a "file/path:123" line to jump straight there.
" Keep in mind that lines may have shifted since.
"
" If you want to remove or change something, just edit the .squirrel file.
"
" Unless you have other commands that start with "Sq" you can probably get
" away with abbreviating them:
"
"     :Sq Rename this to Bar
"     :Sq!
"     :Sq
"
"
" # TODO
"
" - Also store any selected text. README copy for that:
"
"     If you've got text highlighted when you run the command, that text will be
"     squirreled away as well. This means you can write your comment in the buffer
"     instead, or you can make a quick sketch of the change you want.
"
" - Some way to get it in a quickfix list?

command! -nargs=? -bang Squirrel call <SID>Squirrel(<bang>0, "<args>")

function! s:Squirrel(bang, comment)
  if a:comment != "" || a:bang
    call <SID>WriteSquirrel(a:comment)
  else
    call <SID>ViewSquirrel()
  endif
endfunction

function! s:WriteSquirrel(comment)
  let file_exists = filereadable(".squirrel")

  if a:comment == ""
    let comment = "(no comment)"
  else
    let comment = a:comment
  end

  let time = strftime("%F %H:%M:%S")
  let path_and_line = @% . ":" . line(".")

  let prev_lines = file_exists ? readfile(".squirrel") : []
  call writefile([time, path_and_line, comment, ""] + prev_lines, ".squirrel")

  echo "Squirreled away: " . comment
endfunction

function! s:ViewSquirrel()
  let file_exists = filereadable(".squirrel")

  if file_exists
    tabe .squirrel

    " Make regular gf also follow line numbers, as in example.txt:123
    noremap <buffer> gf gF
  else
    echo "No .squirrel file yet! Better start storing up for winter!"
  end
endfunction
