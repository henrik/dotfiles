" Ruby: https://github.com/neoclide/coc-solargraph
" ESLint: https://github.com/neoclide/coc-eslint
" TypeScript: https://github.com/neoclide/coc-tsserver
let g:coc_global_extensions = ['coc-solargraph', 'coc-eslint', 'coc-tsserver']

" Fix buggy behaviour where cursor disappears: https://github.com/neoclide/coc.nvim/issues/1775#issuecomment-757764053
let g:coc_disable_transparent_cursor = 1

" In Devbox, use the global node, since per-project nodes may be too old for coc.nvim.
if exists('$DEVBOX')
  let g:coc_node_path = '/devbox/tmp/devbox/binwrappers/node'
endif

" Rename symbol in project.
nmap <leader>s <Plug>(coc-rename)
