return {
   "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons" -- optional, for file icons
    },
    opts = {
        disable_netrw = false, -- Disabling netrw again
        hijack_cursor = true,  -- Keeps cursor on the first letter of filename while navigating
        filters = {
            dotfiles = true, -- Hide dotfiles by default (toggle with H)
        },
        view = {
            side = "right",
            width = 40,
        },
        renderer = {
            highlight_git = true,
            -- Root folder customization
            root_folder_label = function(path)
                local project = vim.fn.fnamemodify(path, ":t")
                return string.lower(project)
            end,
            icons = {
                web_devicons = {
                    file = {
                        enable = false,
                        color = false,
                    },
                    folder = {
                        enable = false,
                        color = false,
                    },
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    bookmark = "",
                    git = {
                        unstaged = "!",      -- Modified but not staged
                        staged = "+",        -- Staged for commit
                        unmerged = "✗",      -- Merge conflicts
                        renamed = "➜",       -- Renamed files
                        deleted = "✖",       -- Deleted files
                        untracked = "?",     -- Untracked files
                        ignored = "◌",       -- Ignored files
                    },
                    folder = {
                        default = "",
                        open = "",
                        symlink = "",
                        arrow_closed = "",
                        arrow_open = "",
                    },
                },
            },
            special_files = { "README.md", "LICENSE", "CONTRIBUTING.md" },
        },

    }
}


