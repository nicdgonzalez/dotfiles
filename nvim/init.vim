"  _       _ _         _
" (_)     (_) |       (_)
"  _ _ __  _| |___   ___ _ __ ___
" | | '_ \| | __\ \ / / | '_ ` _ \
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|
"
" Author: Nicolas Gonzalez <nicolasdgonzalez@proton.me>
"
" Feel free to use this file as a starting point or peek at it for ideas.
" Don't just copy-paste it! Neovim is all about making it *your* own editor.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ditch Vi defaults so Vim can behave like a more modern editor
set nocompatible

if !has('nvim')
    finish
endif

lua << EOF
local lazy_path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim';

if not (vim.uv or vim.loop).fs_stat(lazy_path) then
    local output = vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        'https://github.com/folke/lazy.nvim.git',
        lazy_path,
    });

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'failed to clone lazy.vim:\n', 'ErrorMsg' },
            { output, 'WarningMsg' },
            { 'Press any key to exit...' }
        }, true, {});
        vim.fn.getchar();
        os.exit(1);
    end
end

vim.opt.rtp:prepend(lazy_path);

require("config")
EOF

