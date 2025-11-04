return {
    "tailwindlabs/tailwindcss-intellisense",
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
                "rust",
            },
            init_options = {
                userLanguages = {
                    rust = "html",
                },
            },
            root_dir = lspconfig.util.root_pattern(
                "postcss.config.js",
                ".git"
            ),
            settings = {
                tailwindCSS = {
                    experimental = {
                        classRegex = {
                            "class\\s*=\\s*['\"]([^'\"]+)['\"]",
                            "tw_merge!\\(\\s*['\"]([^'\"]+)['\"]",
                        },
                    },
                },
            },
        })
    end,
}
