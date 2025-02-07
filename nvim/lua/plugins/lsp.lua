return {
    "neovim/nvim-lspconfig",

    -- Ensure these plugins are loaded first.
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        --#region Maybe not necessary...
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "jose-elias-alvarez/typescript.nvim",
        --#endregion
    },

    ops = {
        servers = {
            rust_analyzer = {
                cargo = {
                    allFeatures = true,
                }
            }
        }
    },

    config = function()
        -- Cmp
        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- For luasnip users.
            }, {
                { name = "buffer" },
            }),
        })

        -- Vim
        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        local lspconfig = require("lspconfig")

        lspconfig.arduino_language_server.setup({
            cmd = {
                "/home/ngonzalez/go/bin/arduino-language-server",
                "-clangd", "/usr/bin/clangd",
                "-cli", "/home/ngonzalez/.local/bin/arduino-cli",
                "-cli-config", "/home/ngonzalez/.arduino15/arduino-cli.yaml",
                "-fqbn", "arduino:avr:uno",
            },
            root_dir = lspconfig.util.root_pattern("*.ino"),
            filetypes = { "arduino" },
            autostart = true,
        })

        -- Cloning of the Deno project always seems to fail when it is in its
        -- own spec file... I can't figure out how to disable the git clone
        -- since I already have Deno installed.
        lspconfig.denols.setup({
            root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
        })
    end,
}
