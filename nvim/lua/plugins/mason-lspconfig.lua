return {
    "williamboman/mason-lspconfig.nvim",

    -- Ensure these dependencies are loaded first.
    dependencies = {
        "williamboman/mason.nvim",
    },

    opts = function()
        local lspconfig = require("lspconfig")

        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        )

        return {
            -- A list of servers to automatically install.
            ---@type string[]
            ensure_installed = {
                "lua_ls",
                "arduino_language_server",
                "clangd",
            },

            -- Whether to automatically install servers set up via `lspconfig`.
            ---@type boolean
            automatic_installation = false,

            -- See `:h mason-lspconfig.setup_handlers()`
            ---@type table<string, fun(server_name: string)>?
            handlers = {
                -- Default handler (optional).
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

                -- TODO: Move this to separate file?
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = {
                                        "bit",
                                        "vim",
                                        "it",
                                        "describe",
                                        "before_each",
                                        "after_each",
                                    },
                                },
                            },
                        },
                    })
                end,
            },
        }
    end,
}
