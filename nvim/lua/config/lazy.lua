-- `mapleader` and `maplocalleader` need to be set before loading lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
    spec = {
        -- Import your plugins
        { import = "plugins" },
    },

    git = {
        timeout = 300,
    },
})
