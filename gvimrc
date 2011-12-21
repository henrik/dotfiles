if has("gui_macvim")

  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-T for CommandT
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>
  imap <D-t> <Esc>:CommandT<CR>

  " Command-Shift-F for Ack
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<nop>
  map <D-F> :Ack<space>

  function! TabClose()
    " Delete all buffers in tabpage.
    :windo bd
  endfunction

  " Command+w closes tab, not file.
  macmenu &File.Close key=<nop>
  map <D-w> :call TabClose()<CR>

  " Terminal.app shortcuts for tab navigation.
  macmenu &File.New\ Tab key=<D-T>
  macmenu Window.Select\ Next\ Tab key=<D-S-Right>
  macmenu Window.Select\ Previous\ Tab key=<D-S-Left>

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<C-D-f>

  " Go to previous/next quickfix file. Also see .vimrc.
  map <C-D--> :cpfile<CR> zz
  map <C-D-+> :cnfile<CR> zz

endif

" Start without the toolbar
set guioptions-=T

set guifont=Monaco:h11
