return {
    "typescript-language-server/typescript-language-server",

    -- Ensure these plugins are loaded first.
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },

    config = function()
        local lspconfig = require("lspconfig")

        lspconfig.ts_ls.setup({
            root_dir = lspconfig.util.root_pattern("package.json"),
            single_file_support = false,
        })
    end,
}
