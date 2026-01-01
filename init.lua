vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.clipboard = "unnamedplus"
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.splitbelow = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.wrap = false
vim.o.scrolloff = 8
vim.o.textwidth = 120
vim.o.laststatus = 1
local statusline = { ' %t', '%r', '%m', '%=', '[%{&filetype}] ', 'l:%l c:%c ', }
vim.o.statusline = table.concat(statusline, '')
vim.o.showmode = false
vim.o.termguicolors = true
vim.o.updatetime = 300
vim.g.netrw_banner = 0
vim.o.conceallevel = 2
vim.o.winborder = "rounded"
vim.o.undofile = true

vim.diagnostic.config({ signs = false })

vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/zenbones-theme/zenbones.nvim',
    'https://github.com/chomosuke/typst-preview.nvim',
    'https://github.com/nvim-mini/mini.pick',
    'https://github.com/Saghen/blink.cmp',
    'https://github.com/neovimhaskell/haskell-vim',
    'https://github.com/y9san9/y9nika.nvim',
    'https://github.com/nvim-mini/mini.extra'
})

vim.g.zenbones_compat = 1
vim.cmd('colorscheme zenbones')
vim.api.nvim_set_hl(0, 'Normal', { bg = nil }) 
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#373737' }) 
vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' }) 
vim.api.nvim_set_hl(0, 'BlinkCmpMenu', { link = 'NormalFloat' }) 
vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', { link = 'NormalFloat' }) 
vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection', { bg = '#252525' }) 

require('oil').setup({
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = { show_hidden = true, natural_order = true, },
    keymaps = { ['<BS>'] = { 'actions.parent', mode = 'n' }, },
    columns = { 'icon' },
})
local pick = require('mini.pick')
pick.setup({
    source = { show = pick.default_show },
    window = {
        prompt_caret = '| ',
        prompt_prefix = ' > ',
    },
})
require('mini.extra').setup({})
require("blink.cmp").setup({
    signature = { enabled = true },
    keymap = { preset = 'enter' },
    fuzzy = {
        implementation = "lua",
    },
    completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        menu = {
            scrollbar = false,
            auto_show = true,
            draw = {
                treesitter = { "lsp" },
                columns = { { "label", "label_description", gap = 1 } },
            },
        },
    },
})
require('nvim-treesitter').setup({
    ensure_installed = { "haskell" },
    highlight = { enable = true },
})

-- Oil
vim.keymap.set('n', '<leader>e', ':Oil<CR>')
-- Pick
vim.keymap.set('n', '<leader>ff', ':Pick files<CR>')
vim.keymap.set('n', 'z=', ':Pick spellsuggest<CR>')
-- Lsp
vim.keymap.set('n', 'gre', function() vim.diagnostic.open_float() end)
vim.keymap.set('n', 'grf', function() vim.lsp.buf.format() end)
vim.keymap.set('n', 'grd', function() vim.lsp.buf.definition() end)
-- Other
vim.keymap.set('n', '<leader>bn', ':bn<CR>')
vim.keymap.set('n', '<ESC>', ':nohl<CR>')
vim.keymap.set('n', '<leader>q', ':q!<CR>')
vim.keymap.set('n', '<leader>x', ':wq<CR>')
vim.keymap.set('n', '<leader>w', ':up<CR>')

local lsps = {
    'clangd',
    'marksman',
    'tinymist',
    'ocamllsp',
    'hls',
}

for _, lsp in ipairs(lsps) do
    vim.lsp.enable(lsp)
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = { '<filetype>' },
    callback = function() vim.treesitter.start() end,
})
