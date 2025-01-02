return {
    "tailwindlabs/tailwindcss-intellisense",

    -- Ensure these plugins are loaded first.
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },

    config = function()
        local lspconfig = require("lspconfig")

        lspconfig.tailwindcss.setup({
            filetypes = {
                "html",
                "css",
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                -- Maud (HTML templating engine in Rust)
                "rust",
                -- Jinja (Python) or minijinja (Rust)
                "htmldjango.jinja",
            },
            init_options = {
                userLanguages = {
                    -- Maud
                    rust = "html",
                    -- minijinja
                    ["htmldjango.jinja"] = "html",
                },
            },
            root_dir = lspconfig.util.root_pattern(
                "tailwind.config.js",
                "postcss.config.js",
                ".git"
            ),
            settings = {
                tailwindCSS = {
                    experimental = {
                        classRegex = "class\\s*=\\s*['\"]([^'\"]+)['\"]",
                    },
                },
            },
        })
    end,
}
