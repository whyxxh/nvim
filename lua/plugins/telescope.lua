return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim", "MunifTanjim/nui.nvim" },
        config = function()
            -- Telescope configuration
            require('telescope').setup({
                defaults = {
                    color_devicons = false,
                    disable_devicons = true,
                    mappings = {
                        i = {
                            ["<esc>"] = require('telescope.actions').close
                        },
                    },
                    layout_config = {
                        width = 0.7,
                        height = 0.7,
                    },
                    prompt_prefix = "   ", -- Sets the magnifying glass icon
                    selection_caret = "|> ", -- Sets the arrow icon for selected item
                },
                -- Extensions (fzf)
                extensions = {
                    fzf = {
                        fuzzy = true,                    -- Enable fuzzy matching
                        override_generic_sorter = true,  -- Override the generic sorter
                        override_file_sorter = true,     -- Override the file sorter
                        case_mode = "smart_case",        -- Smart case sensitivity for matching
                    }
                }
            })

            -- Load the fzf extension
            require('telescope').load_extension('fzf')
        end
    },

    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {},
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    }
}
