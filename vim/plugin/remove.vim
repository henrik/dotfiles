" http://vim.wikia.com/wiki/Delete_files_with_a_Vim_command
function! s:DeleteFile(...)
  if(exists('a:1'))
    let theFile=a:1
  else
    let theFile=expand('%:p')
  endif
  let delStatus=delete(theFile)
  if(delStatus == 0)
    bw!
    echo "Deleted " . theFile
  else
    echohl WarningMsg
    echo "Failed to delete " . theFile
    echohl None
  endif
  return delStatus
endfunction

com! Remove call <SID>DeleteFile()
