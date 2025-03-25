return {
    -- {
    --     "github/copilot.vim",
    --     config = function()
    --         vim.keymap.set('i', '<C-M>', 'copilot#Accept("\\<CR>")', {
    --             expr = true,
    --             replace_keycodes = false
    --         })
    --         vim.g.copilot_no_tab_map = true
    --     end
    -- },
    --
    -- {
    --     "CopilotC-Nvim/CopilotChat.nvim",
    --     dependencies = {
    --         { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
    --         { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    --     },
    --     build = "make tiktoken", -- Only on MacOS or Linux
    --     opts = {
    --         -- See Configuration section for options
    --     },
    --     -- See Commands section for default commands if you want to lazy load on them
    -- },

    {
        "hrsh7th/cmp-nvim-lsp",
    },

    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        }
    },

    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require'cmp'
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered({
                        winhighlight = "Normal:Normal,FloatBorder:Normal",
                    }),
                    documentation = cmp.config.window.bordered({
                        winhighlight = "Normal:Normal,FloatBorder:Normal",
                    }),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif require("luasnip").expand_or_jumpable() then
                            require("luasnip").expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif require("luasnip").jumpable(-1) then
                            require("luasnip").jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
                    { name = 'path' },
                    {
                        name = "spell",
                        option = {
                            keep_all_entries = false,
                            enable_in_context = function()
                                return true
                            end,
                            preselect_correct_word = true,
                        },
                    }
                }, {
                        { name = 'buffer' },
                    }),
            })
        end
    },

    'hrsh7th/cmp-path',
}
