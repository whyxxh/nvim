return {
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- Trigger early to ensure sessions are available
        opts = {}, -- Use default options
    }
}
