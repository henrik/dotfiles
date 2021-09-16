" https://github.com/neoclide/coc-solargraph (Ruby)
" https://github.com/neoclide/coc-eslint
" https://github.com/neoclide/coc-tsserver
let g:coc_global_extensions = ['coc-solargraph', 'coc-eslint', 'coc-tsserver']

" In Devbox, use the global node, since per-project nodes may be too old for coc.nvim.
if exists('$DEVBOX')
  let g:coc_node_path = '/devbox/tmp/devbox/binwrappers/node'
endif

" Rename symbol in project.
nmap <leader>s <Plug>(coc-rename)
