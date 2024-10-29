return {
    {
        "catppuccin/nvim",
        -- The name to use in the command (e.g. `:colorscheme <name>`)
        name = "catppuccin",
        -- Load this during startup
        lazy = false,
        -- Ensure this loads before all other startup plugins
        priority = 1000,
        -- Setting the colorscheme
        config = function()
            vim.cmd.colorscheme("catppuccin")
        end
    }
}
