" By default, mapleader is "\" (the most popular alternative is ",")
let mapleader = ' '

" Paste the current date and time into the current buffer in ISO 8601 format
nmap <leader>dt "=strftime('%Y-%m-%dT%H:%M:%S%z')<CR>p

" Move the current line up or down.
" (This also helps new Vim users break the habit of using the arrow keys :)
map <down> :m .+1<CR>==
map <up> :m .-2<CR>==

imap <down> <ESC>:m .+1<CR>==gi
imap <up> <ESC>:m .-2<CR>==gi

vmap <down> :m '>+1<CR>gv=gv
vmap <up> :m '<-2<CR>gv=gv

" Switch the current working directory to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" Switch between tmux sessions.
nmap <C-f> :!orbit<CR>

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

vnoremap <leader>$[ <ESC>`>a]<ESC>`<i[<ESC>
vnoremap <leader>$( <ESC>`>a)<ESC>`<i(<ESC>
vnoremap <leader>${ <ESC>`>a}<ESC>`<i{<ESC>
vnoremap <leader>$>{ ><ESC>`>o}<ESC><<`<O{<ESC>
vnoremap <leader>$" <ESC>`>a"<ESC>`<i"<ESC>
vnoremap <leader>$' <ESC>`>a'<ESC>`<i'<ESC>
vnoremap <leader>$` <ESC>`>a`<ESC>`<i`<ESC>
vnoremap <leader>$* <ESC>`>a*<ESC>`<i*<ESC>
