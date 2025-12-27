-- The main entry point to the Neovim configuration.

vim.g.mapleader = " "
vim.g.localmapleader = "\\"

-- Bootstrap `lazy.nvim`, a plugin manager for Neovim.
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazy_path) then
    local output = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazy_path,
    })

    if vim.v.shell_error ~= 0 then
        error("failed to clone lazy.nvim:\n" .. output)
    end
end

-- Add lazy.nvim to Vim's runtime path.
vim.opt.rtp:prepend(lazy_path)

-- Initialize lazy.nvim to install all of our plugins.
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
})

vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {},
    -- LSP configuration
    server = {
        default_settings = {
            ["rust-analyzer"] = {
                -- Other Settings ...
                procMacro = {
                    ignored = {
                        leptos_macro = {
                            "component",
                            "server",
                        },
                    },
                },
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            features = "all",
                        },
                    },
                },
            },
        },
    },
}
