" coc-solargraph: Ruby language server.
let g:coc_global_extensions = ['coc-solargraph']

" In Devbox, use the global node, since per-project nodes may be too old for coc.nvim.
if exists('$DEVBOX')
  let g:coc_node_path = '/devbox/tmp/devbox/binwrappers/node'
endif

" Rename symbol in project.
nmap <leader>s <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
