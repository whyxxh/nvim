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
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                ensure_installed = { "clangd", "pyright", "asm_lsp", "marksman" }
            })

            local lspconfig = require("lspconfig")
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
                local opts = {
                    capabilities = capabilities
                }

                -- Customize clangd setup separately
                if server_name == "clangd" then
                    opts.init_options = {
                        fallbackFlags = {'--std=c99', '-xc', '-Wall', '-Wunused-variables', '-Wunused-functions'}
                    }
                end

                lspconfig[server_name].setup(opts)
            end
        end
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = { 'saghen/blink.cmp' },
        opts = {},
        config = function(_, opts)
            vim.g.winborders = 'rounded'

	
            vim.keymap.set('n', '<leader>ch', function() vim.lsp.buf.hover({ border = 'rounded'}) end, {})
            vim.keymap.set('n', '<leader>cd', function() vim.lsp.buf.definition({ border = 'rounded'}) end, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        end,
    },
}
