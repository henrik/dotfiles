" Bar cursor in insert mode, block otherwise.
" Neovim does this on its own via 'guicursor' and ignores t_SI/t_EI entirely.

let &t_SI = "\<Esc>[6 q"
let &t_EI = "\<Esc>[2 q"
