return {
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        enabled = true,
        init = false,
        opts = function()
            local dashboard = require("alpha.themes.dashboard")

            local uID = string.format("0x%x", math.random(0, 0xFFFFFF))

            dashboard.section.header.val = {
                [[ +---------------------------------+ ]],
                [[ | > NEOVIM v0.11.0                | ]],
                [[ | [ OK ] PREPARING ENVIRONMENT... | ]],
                [[ | [ OK ] ENVIRONMENT READY.       | ]],
                [[ | uID: ]] .. uID .. [[                   | ]],-- Display the unique uID here
                [[ +---------------------------------+ ]],
                [[            Welcome uRubs            ]],
            }

            dashboard.section.buttons.val = {
                dashboard.button("f", "  [ F ] Find file",       "<cmd> Telescope find_files <cr>"),
                dashboard.button("n", "  [ N ] New file",        "<cmd> ene <BAR> startinsert <cr>"),
                dashboard.button("g", "  [ G ] Grep files",    "<cmd> Telescope live_grep <cr>"),
                dashboard.button("s", "  [ S ] Restore Session", "<cmd> lua require('persistence').load() <cr>"),
                dashboard.button("q", "  [ Q ] Quit",            "<cmd> qa <cr>"),
            }

            for _, button in ipairs(dashboard.section.buttons.val) do
                button.opts.hl = "AlphaButtons"
                button.opts.hl_shortcut = "AlphaShortcut"
            end

            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.buttons.opts.hl = "AlphaButtons"
            dashboard.section.footer.opts.hl = "AlphaFooter"


            dashboard.opts.layout = {
                { type = "padding", val = 4 },  -- Increased space for retro feel
                dashboard.section.header,
                { type = "padding", val = 2 },
                dashboard.section.buttons,
                { type = "padding", val = 1 },
                dashboard.section.footer,
            }

            return dashboard
        end,
        config = function(_, dashboard)
            -- Close Lazy and re-open when the dashboard is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    once = true,
                    pattern = "AlphaReady",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            require("alpha").setup(dashboard.opts)

            vim.api.nvim_create_autocmd("User", {
                once = true,
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    dashboard.section.footer.val = "]] LOADED "
                    .. stats.loaded
                    .. "/"
                    .. stats.count
                    .. " PLUGINS IN "
                    .. ms
                    .. "ms "
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })
        end,
    },
}
