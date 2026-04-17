vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.clipboard = 'unnamedplus'
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.signcolumn = 'yes'
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
    'https://github.com/shaunsingh/nord.nvim',
    'https://github.com/kungfusheep/mfd.nvim',
})

vim.cmd.colorscheme("myzenbones")

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
map('n', '<leader>ot', '<C-w>v<C-w>l:term<CR>i')
map('n', 'gre', vim.diagnostic.open_float)
map('n', 'grf',  vim.lsp.buf.format)
map('n', 'grd', vim.lsp.buf.definition, { noremap = true, silent = true })
map('n', '<leader>bn', ':bn<CR>')
map('n', '<ESC>', ':nohl<CR>')
map('n', '<leader>q', ':q!<CR>')
map('n', '<leader>x', ':wq<CR>')
map('n', '<leader>w', ':up<CR>')
map('n', '<C-h>', '<C-w><C-h>')
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')
map('n', '<C-l>', '<C-w><C-l>')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('t', '<ESC>', '<C-\\><C-n>')
map('n', '<leader>t', '<C-]>')
map('n', '<leader>c', ':Comp<CR>')
map('n', '<leader>C', ':Comp')

local lsps = {
    'tinymist',
    'ocamllsp',
    'hls',
    'pyright',
    'ruff',
}

vim.lsp.config('clangd', {
    cmd = { '/opt/homebrew/opt/llvm/bin/clangd' },
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

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

vim.api.nvim_create_user_command('Comp', function(opts)
    if opts.args ~= '' then
        vim.opt.makeprg = opts.args
    end
    vim.cmd('silent make!')
    vim.cmd('copen')
end, {
nargs = '*',
})


function _G.SpellToQuickfix()
  local save = vim.fn.getpos(".")
  local qf = {}

  vim.cmd("normal! gg")

  while true do
    -- jump to next misspelled word
    local ok = pcall(vim.cmd, "normal! ]s")
    if not ok then break end

    local word = vim.fn.spellbadword()[1]
    if word == nil or word == "" then
      break
    end

    table.insert(qf, {
      filename = vim.api.nvim_buf_get_name(0),
      lnum = vim.fn.line("."),
      col = vim.fn.col("."),
      text = word,
    })
  end

  vim.fn.setqflist({}, "r", { items = qf })
  vim.fn.setpos(".", save)
end

vim.api.nvim_create_user_command("SpellQF", function()
  local items = {}

  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  for lnum, line in ipairs(lines) do
    local checks = vim.spell.check(line)

    for _, c in ipairs(checks) do
      local word = c[1]
      local col = c[3]

      table.insert(items, {
        filename = vim.api.nvim_buf_get_name(0),
        lnum = lnum,
        col = col,
        text = word,
      })
    end
  end

  vim.fn.setqflist(items, "r")
  vim.cmd("copen")
end, {})

require('vim._core.ui2').enable({})
