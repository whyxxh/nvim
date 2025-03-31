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
                ensure_installed = { "lua_ls", "clangd", "pyright", "asm_lsp" }
            })
        end
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup{
                settings = {
                    Lua = {
                        workspace = {
                            checkThirdParty = false,
                            telemetry = { enable = false },
                            library = {
                                "${3rd}/love2d/library"
                            }
                        }
                    }
                },
            }
            lspconfig.clangd.setup{ capabilities = capabilities, }
            lspconfig.pyright.setup{ capabilities = capabilities, }
            lspconfig.texlab.setup{ capabilities = capabilities, }
            lspconfig.marksman.setup{}

            local hover_opts = {
                border = {
                    {"╭", "FloatBorder"}, {"─", "FloatBorder"},
                    {"╮", "FloatBorder"}, {"│", "FloatBorder"},
                    {"╯", "FloatBorder"}, {"─", "FloatBorder"},
                    {"╰", "FloatBorder"}, {"│", "FloatBorder"}
                }
            }
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, hover_opts)
            local gruvbox_bg = "#282828"
            vim.api.nvim_set_hl(0, "FloatBorder", { bg = gruvbox_bg })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = gruvbox_bg })

            vim.keymap.set('n', '<leader>ch', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        end,
    },
}
