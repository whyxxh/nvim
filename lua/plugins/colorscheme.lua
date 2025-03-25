local opts = {
    styles = {
        type = { bold = false },
        lsp = { underline = true },
        match_paren = { underline = false },
        title = { bold = true, fg = "#ff0000" },
    },
    -- vim.api.nvim_set_hl(0, "@markup.heading", {
    --     fg = "#b46958",   -- Yellow foreground
    --     bg = "#171717",   -- Dark background
    --     underline = true, -- Underlined text
    --     italic = false,    -- Italic text
    -- })
}

local function config()
    local plugin = require "no-clown-fiesta"
    plugin.setup(opts)
    return plugin.load()
end

return {
    {
        "aktersnurra/no-clown-fiesta.nvim",
        priority = 1000,
        config = config,
        lazy = false,
    },
    {
        "ellisonleao/gruvbox.nvim",
        -- priority = 1000,
        -- config = function()
        --     require("gruvbox").setup({
        --     })
        --     vim.cmd("colorscheme gruvbox")
        -- end,
    },
    {
        "slugbyte/lackluster.nvim",
        -- lazy = false,
        -- priority = 1000,
        -- init = function()
        --     vim.cmd.colorscheme("lackluster-dark") -- my favorite
        --     vim.api.nvim_set_hl(0, "WhichKeyNormal", { link = "Normal" })
        --     vim.api.nvim_set_hl(0, "WhichKeyBorder", { link = "Normal" })
        --     -- vim.cmd.colorscheme("lackluster-mint")
        -- end,
    },
    {
        'jesseleite/nvim-noirbuddy',
        -- dependencies = {
        --     { 'tjdevries/colorbuddy.nvim' }
        -- },
        -- lazy = false,
        -- priority = 1000,
        -- opts = {
        --     colors = {
        --         primary = '#c88aff',
        --     },
        -- },
    },
}
