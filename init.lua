vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.clipboard = 'unnamedplus'
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
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
vim.o.winborder = 'rounded'
vim.o.undofile = true
vim.o.cursorline = true

vim.diagnostic.config({ virtual_text = { current_line = true } })

vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/chomosuke/typst-preview.nvim',
    'https://github.com/nvim-mini/mini.pick',
    'https://github.com/nvim-mini/mini.extra',
    'https://github.com/Saghen/blink.cmp',
    'https://github.com/neovimhaskell/haskell-vim',
    -- colorschemes
    'https://github.com/rktjmp/lush.nvim',
    'https://github.com/zenbones-theme/zenbones.nvim',
    'https://github.com/bettervim/yugen.nvim'
})

-- NOTE: Maybe make a colorscheme myself
vim.g.zenbones = { 
    italic_comments = false, italic_strings = false,
    transparent_background = true,
}
local edits = {
    Constant = { bold = false },
    LineNr = { fg = '#373737' },
    CursorLine = { bg = '#1a1a1a' },
    NormalFloat = { link = 'Normal' },
    BlinkCmpMenu = { link = 'NormalFloat' },
    BlinkCmpMenuBorder = { link = 'NormalFloat' },
    BlinkCmpMenuSelection = { bg = '#252525' },
}
vim.cmd('colorscheme zenbones')
for group, opts in pairs(edits) do
    vim.api.nvim_set_hl(0, group, opts) 
end

require('oil').setup({
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = { show_hidden = true, natural_order = true, },
    columns = { 'icon' },
})

require('mini.extra').setup({})
require('mini.pick').setup({
    source = { show = require('mini.pick').default_show },
    window = { prompt_prefix = ' > ', },
})

require('blink.cmp').setup({
    signature = { enabled = true },
    keymap = { preset = 'enter' },
    fuzzy = { implementation = 'lua', },
    completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        menu = {
            scrollbar = false,
            auto_show = true,
            draw = {
                treesitter = { 'lsp' },
                columns = { { 'label', 'label_description', gap = 1 } },
            },
        },
    },
})

require('nvim-treesitter').setup({
    ensure_installed = { 'haskell', 'c', 'python', 'ocaml' },
    highlight = { enable = true },
})

vim.keymap.set('n', '<leader>e', ':Oil<CR>')
vim.keymap.set('n', '<leader>ff', ':Pick files<CR>')
vim.keymap.set('n', 'z=', ':Pick spellsuggest<CR>')
vim.keymap.set('n', 'gre', function() vim.diagnostic.open_float() end)
vim.keymap.set('n', 'grf', function() vim.lsp.buf.format() end)
vim.keymap.set('n', 'grd', function() vim.lsp.buf.definition() end)
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

-- particular
vim.lsp.config('clangd', {
    cmd = { "/opt/homebrew/opt/llvm/bin/clangd" },
})
-- general
for _, lsp in ipairs(lsps) do
    vim.lsp.config(lsp, {})
    vim.lsp.enable(lsp)
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ timeout = 50 })
    end,
    group = highlight_group,
})
