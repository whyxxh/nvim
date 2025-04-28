return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "clangd", "pyright", "asm_lsp", "marksman" }
            })

            require("mason-lspconfig").setup_handlers {
                function (server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = require('blink.cmp').get_lsp_capabilities()
                    }
                    require('lspconfig').clangd.setup {
                        init_options = {
                            fallbackFlags = {'--std=c99'}
                        },
                    }
                end,
            }
        end
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = { 'saghen/blink.cmp' },
        opts = {},
        config = function(_, opts)
            vim.g.winborders = 'rounded'

            vim.keymap.set('n', '<leader>ch', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        end,
    },
}
