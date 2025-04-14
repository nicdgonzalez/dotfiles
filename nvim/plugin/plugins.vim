" Plugins
" =======
"
" This file is mainly used for managing plugins for Vim.

if has("nvim")
    finish
endif

" Plugins {{{

call plug#begin('~/.vim/plugged')

Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'wellle/context.vim'
" Plug 'othree/html5.vim'
" Plug 'pangloss/vim-javascript'
" Plug 'mattn/emmet-vim'

call plug#end()

" }}}
