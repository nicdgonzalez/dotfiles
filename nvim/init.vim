" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|
"
" The main entry point to my Vim configuration.

if !has("nvim")
    finish
endif

lua << EOF

-- See `./lua/config` for Neovim configuration.
require("config")

EOF
