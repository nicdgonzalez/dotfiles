-- Automatically format files on save.
return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({
                    async = true,
                    lsp_format = "fallback",
                })
            end,
            mode = "",
            desc = "[F]ormat buffer",
        },
    },
    opts = {
        log_level = vim.log.levels.DEBUG,
        notify_on_error = false,
        format_on_save = function(bufnr)
            local disable_filetypes = {}
            if disable_filetypes[vim.bo[bufnr].filetype] then
                return nil
            else
                return {
                    timeout_ms = 2500,
                    lsp_format = "fallback",
                    lsp_fallback = true,
                }
            end
        end,
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "ruff_format" },
            c = { "clang-format" },
            cpp = { "clang-format" },
            sh = { "shfmt" },
            markdown = { "mdformat" },
            javascript = { "deno_fmt" },
            javascriptreact = { "deno_fmt" },
            typescript = { "deno_fmt" },
            typescriptreact = { "deno_fmt" },
            rust = { "leptosfmt", "rustfmt" },
            astro = { "prettier" },
        },
        formatters = {
            clang_format = {
                prepend_args = { "--style=file" },
            },
            shfmt = {
                prepend_args = {
                    "--indent=4",
                    "--case-indent",
                    "--space-redirects",
                },
            },
            mdformat = {
                prepend_args = { "--wrap=79" },
            },
            leptosfmt = {
                prepend_args = { "./**/*.rs" },
            },
        },
    },
}
