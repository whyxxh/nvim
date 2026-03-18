vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.clipboard = 'unnamedplus'
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.scrolloff = 8
vim.o.textwidth = 120
vim.o.laststatus = 2
vim.o.showmode = false
vim.o.termguicolors = true
vim.o.updatetime = 300
vim.o.winborder = 'rounded'
vim.o.undofile = true

-- vim.diagnostic.enable(false)
vim.diagnostic.config({ virtual_text = { current_line = true } })

vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/chomosuke/typst-preview.nvim',
    'https://github.com/nvim-mini/mini.pick',
    'https://github.com/nvim-mini/mini.extra',
    'https://github.com/Saghen/blink.cmp',
})

vim.cmd('colorscheme myzenbones')

require('mason').setup()

require('oil').setup({
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = { show_hidden = true, natural_order = true, },
    columns = { 
        'icon',
    },
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
        menu = {
            scrollbar = false,
            auto_show = true,
            draw = {
                treesitter = { 'lsp' },
                columns = { { 'label', 'label_description', gap = 1 } },
            },
        },
    },
    sources = {
        providers = {
            buffer = {
                opts = {
                    get_bufnrs = vim.api.nvim_list_bufs,  -- include all loaded buffers
                },
            },
        },
    },
})

require('nvim-treesitter').setup({
    ensure_installed = { 'haskell', 'c', 'python', 'ocaml' },
    highlight = { enable = true },
})

local map = vim.keymap.set
map('n', '<leader>e', ':Oil<CR>')
map('n', '<leader>ff', ':Pick files<CR>')
map('n', 'z=', ':Pick spellsuggest<CR>')
map('n', 'gre', vim.diagnostic.open_float)
map('n', 'dn', function() vim.diagnostic.jump({count=1, float=true}) end)
map('n', 'dp', function() vim.diagnostic.jump({count=-1, float=true}) end )
map('n', 'grf',  vim.lsp.buf.format)
map('n', 'grd', '<C-]>', { noremap = true, silent = true })
map('n', '<leader>bn', ':bn<CR>')
map('n', '<ESC>', ':nohl<CR>')
map('n', '<leader>q', ':q!<CR>')
map('n', '<leader>x', ':wq<CR>')
map('n', '<leader>w', ':up<CR>')
map('n', '<leader>cn', ':cn<CR>')
map('n', '<leader>cp', ':cp<CR>')
map('i', '<C-x><C-o>', function()
    require('blink.cmp').show()
    require('blink.cmp').show_documentation()
    require('blink.cmp').hide_documentation()
end, { silent = false });

local lsps = {
    'clangd',
    'marksman',
    'tinymist',
    'ocamllsp',
    'hls',
    'clojure_lsp',
    'pyright',
    'ltex_ls',
    -- 'ols',
    'ruff',
    'zls',
}

vim.lsp.config('clangd', {
    cmd = { "/opt/homebrew/opt/llvm/bin/clangd" },
})

vim.lsp.config('ltex', {
  settings = {
    ltex = {
      language = "fr",
    },
  },
})

for _, lsp in ipairs(lsps) do
    vim.lsp.config(lsp, {})
    vim.lsp.enable(lsp)
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
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

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

vim.api.nvim_create_user_command("Comp", function(opts)
    if opts.args ~= "" then
        vim.opt.makeprg = opts.args
    end
    vim.cmd("silent make!")
    vim.cmd("copen")
end, {
nargs = "*",   -- accept arguments
})
