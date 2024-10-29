" Configuring Vim

" User interface {{{

" Use 24-bit colors if the terminal supports it
if &t_Co == 256
    set termguicolors
endif

" Enable syntax highlighting
syntax on

" NOTE: Color scheme is installed via package manager later if using Neovim
if !has('nvim')
    colorscheme lunarperche
endif

" Mark the nth vertical column (80 is the standard for most coding styles)
set colorcolumn=80

" Set the height of the command line. Even for commands that write only one
" line, they usually count as two due to the newline. Larger values are useful
" for avoiding the 'Press <ENTER> to continue' message
set cmdheight=2

" Display the cursor's position in the bottom right corner
set ruler

" Show line numbers
set number

" The numbers directly above/below the cursor will start 1 and increase the
" further they get from the current line. This is useful for navigating around
" using Vim motions (e.g., like using `5j` to move down 5 lines)
set relativenumber

" Set the minimum width of the line number column
set numberwidth=1

" An additional column to the left to mark folds (see `:help folds`)
set foldcolumn=1

" Show the current move by the command line (e.g., "INSERT", "VISUAL", etc.)
set showmode

" Don't highlight previous search result matches
set nohlsearch

" When searching, show matches as you type
set incsearch

" For case-insensitive searching (except if pattern contains MixedCase)
set ignorecase
set smartcase

" Enable the `/g` flag by default when using search and replace
set gdefault

" Keep at least n lines above and below the cursor when scrolling
set scrolloff=8

" Do not redraw the motions while executing macros
set lazyredraw

" Enable mouse support
set mouse=a

" Create folds automatically wherever there are markers (i.e., `{{{` and `}}}`)
set foldmethod=marker

" }}}

" Backups and swap files {{{

" For me, this gets in the way more than it is helpful... besides, most things
" are already in some form of version control, so this isn't all that useful
set nobackup
set noswapfile

" }}}

" Text, tabs and indentation {{{

" Configure the backspace key to work as expected
set backspace=indent,eol,start

" Enable the system clipboard
if system('uname -s') == 'Linux\n'
    set clipboard=unnamedplus  " Linux
else
    set clipboard=unnamed  " OSX, Windows(?)
endif

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

