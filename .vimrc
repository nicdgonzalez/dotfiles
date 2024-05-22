" __   _____ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|
"
" Author: Nicolas Gonzalez <nicdgonzalez@github>
"
" Feel free to use this file as a starting point or peek at it for ideas.
" Don't just copy-paste it! Vim is all about making it *your* own editor.
"
" If you want to try out this setup, run the following commands:
"
"   git clone https://github.com/nicdgonzalez/dotfiles && cd dotfiles
"   vim -u ./.vimrc

" General {{{

" Ditch Vi defaults so Vim can behave like a more modern editor.
set nocompatible

" }}}

" Plugins {{{
" Plugin Manager: https://github.com/junegunn/vim-plug

call plug#begin()

" The package manager can manage itself
Plug 'junegunn/vim-plug'

" Async LSP support for Vim
Plug 'prabirshrestha/vim-lsp'

" For displaying auto-complete pop-ups
Plug 'prabirshrestha/asyncomplete.vim'

" Enhances auto-completion capabilities for language servers
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Provides default configurations for language servers
Plug 'mattn/vim-lsp-settings'

" Display which function you're in, even when the signature goes out of view
Plug 'wellle/context.vim'

call plug#end()

" }}}

" User Interface {{{

if &t_Co == 256
    " Allow Vim to use 12-bit colors
    set termguicolors
endif

" Enable syntax highlighting
syntax on

" See `:help color-schemes` and `:help new-colorschemes`
try
    colorscheme ndg
catch
    colorscheme lunaperche  " One of Vim's built-in color schemes (Vim 9)
endtry

" Mark the nth vertical column (80 is the standard for most coding styles)
set colorcolumn=80

" Set the height of the command-line. Larger values are useful for avoiding
" the 'Press <ENTER> to continue' message (i.e. there was not enough space
" to display all of the text)
set cmdheight=2

" Display the cursor's position in the bottom right corner
set ruler

" Show line numbers
set number

" The numbers directly above/below the cursor line start at 1 and increase as
" they move away from the current line (0). This is useful for moving around
" using Vim Motions (e.g. using 5j to move down 5 lines)
set relativenumber

" Set the minimum width of the line number column
set numberwidth=1

" See `:help folds`
set foldcolumn=1

" Show the current mode by the command-line
set showmode

" Whether previous search results should be highlighted
set nohlsearch

" When searching, show matches as you type
set incsearch

" For case-insensitive searching (except if pattern contains MixedCase)
set ignorecase
set smartcase

" Enable the '/g' flag by default when using search and replace
set gdefault

" Keep at least n lines above and below the cursor when scrolling
set scrolloff=8

" Do not redraw while executing macros
set lazyredraw

" Enable mouse support
set mouse=a

" Determine how folds are generated
set foldmethod=marker

" Automatically save folds as-is when closing a file
autocmd bufWinLeave * silent! mkview

" Automatically load saved folds when opening a file
autocmd bufWinEnter * silent! loadview

" }}}

" Backup and Swap files {{{

" For me, these get in the way more than they are helpful
set nobackup
set noswapfile

" }}}

" Text, tabs and indentation {{{

" Configure the backspace key to work as expected
set backspace=indent,eol,start

" Enable the system clipboard
" Note: Vim must be compiled with `+clipboard` (see `:version`)
set clipboard^=unnamed,unnamedplus

" Use spaces instead of tabs
set expandtab

" The number of spaces a <Tab> in the file is worth
set tabstop=8

" The number of spaces a tab in the file is worth when editing
set softtabstop=4

" The number of spaces a level of indentation is worth
set shiftwidth=4

" A smarter version of `autoindent` that understands basic C-style syntax
set smartindent

" The maximum characters a line can contain before Vim attempts to break
set textwidth=0

" Whether or not to visually break lines at word boundaries
set nowrap

" Highlight matching brackets when the cursor is hovering over one
set showmatch

" }}}

" Mappings {{{

" By default, mapleader is '\' (the most popular alternative is ',')
let mapleader = " "

" Paste the current date and time into the current buffer
nmap <leader>dt "=strftime('%Y-%m-%d %H:%M%z')<cr>p

" Return the display to the last file explorer window
map <leader>pv :Explore<cr>

" Split the display vertically and open the file explorer to the left
map <C-b> :Sexplore!<cr>

" A better way to switch between active windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Move the current line up or down.
" (This also helps new Vim users break the habit of using the arrow keys :)
map <down> :m .+1<cr>==
map <up> :m .-2<cr>==

imap <down> <esc>:m .+1<cr>==gi
imap <up> <esc>:m .-2<cr>==gi

vmap <down> :m '>+1<cr>gv=gv
vmap <up> :m '<-2<cr>gv=gv

" Switch the current working directory to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to the last edited line when opening a file. (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$")
            \ | exe "normal! g'\""
            \ | endif

function! StripTrailingSpaces()
    let l:save_cursor = getpos(".")
    let l:old_query = getreg("/")
    silent! %s/\s\+$//e
    call setpos(".", l:save_cursor)
    call setreg("/", l:old_query)
endfunction

" Clean up trailing whitespaces on save
autocmd BufWritePre * :call StripTrailingSpaces()

" Automatically resize splits when resizing the terminal window
autocmd VimResized * wincmd =

    " Automatically complete brackets, parentheses, etc.
    vnoremap <leader>$[ <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>$( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>${ <esc>`>a}<esc>`<i{<esc>
vnoremap <leader>$>{ ><esc>`>o}<esc><<`<O{<esc>
vnoremap <leader>$" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>$' <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>$` <esc>`>a`<esc>`<i`<esc>

" }}}
