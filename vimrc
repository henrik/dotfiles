set nocompatible                " Don't sacrifice anything for Vi compatibility.
let mapleader = ","

source ~/.vim/config/plugins.vim

source ~/.vim/config/settings.vim
source ~/.vim/config/statusline.vim
source ~/.vim/config/autocommands.vim
source ~/.vim/config/commands.vim
source ~/.vim/config/mappings.vim

" Snippets that are too long for .vimrc, too short for plugins.

source ~/.vim/shorts/edit_rails_locales.vim
source ~/.vim/shorts/focus_toggle.vim
source ~/.vim/shorts/lab.vim
source ~/.vim/shorts/prune_buffers.vim
source ~/.vim/shorts/run_html.vim
source ~/.vim/shorts/saveas_bang_to_mkdir_p.vim
