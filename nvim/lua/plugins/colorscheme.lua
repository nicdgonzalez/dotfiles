--[[
return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        vim.cmd.colorscheme("tokyonight-night")
    end,
}
--]]

---[[
return {
    "catppuccin/nvim",
    -- The name to use in the command (e.g. `:colorscheme <name>`).
    name = "catppuccin",
    -- Load this plugin at startup.
    lazy = false,
    -- Ensure this loads before all other startup plugins.
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("catppuccin")
    end,
    opts = {
        background = {
            light = "latte",
            dark = "mocha",
        },
    },
}
--]]
