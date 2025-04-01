" Key mappings
" ============
"
" Custom key mappings designed to make it easier to navigate within Vim.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" By default, mapleader is "\" (the most popular alternative is ",")
let mapleader = ' '

" Paste the current date and time into the current buffer in ISO 8601 format
nmap <leader>dt "=strftime('%Y-%m-%dT%H:%M:%S%z')<CR>p

" Return the display to the last file explorer window
map <leader>pv :Explore<cr>

" Split the display vertically and open the file explorer to the left
map <C-b> :Sexplore!<cr>

" A better way to switch between active windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Copy/paste to the system clipboard.
map <C-y> "*y
map <C-p> "*p

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

nmap <C-f> :!orbit<cr>

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
