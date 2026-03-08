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
vim.o.laststatus = 2
local statusline = { ' %t', '%r', '%m', '%=', '[%{&filetype}] ', 'l:%l c:%c ', }
vim.o.statusline = table.concat(statusline, '')
vim.o.showmode = false
vim.o.termguicolors = true
vim.o.updatetime = 300
vim.g.netrw_banner = 0
vim.o.conceallevel = 2
vim.o.winborder = 'rounded'
vim.o.undofile = true
vim.o.cursorline = false

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
    -- colorschemes
    'https://github.com/rktjmp/lush.nvim',
    'https://github.com/zenbones-theme/zenbones.nvim',
    'https://github.com/blazkowolf/gruber-darker.nvim',
})

local c = 'zenbones'
vim.g.zenbones = { 
    italic_comments = false, italic_strings = false,
    transparent_background = true,
}
local edits = {
    Constant = { bold = false },
    StatusLine = { bg = nil },
    StatusLineNC = { bg = nil },
    LineNrAbove = { fg = '#444444' },
    LineNrBelow = { fg = '#444444' },
    LineNr = { fg = '#b4bdc3', bold = true },
    NonText = { fg = '#1a1a1a' },
    CursorLine = { bg = '#1a1a1a' },
    NormalFloat = { link = 'Normal' },
    BlinkCmpMenu = { link = 'NormalFloat' },
    BlinkCmpMenuBorder = { link = 'NormalFloat' },
    BlinkCmpMenuSelection = { bg = '#252525' },
    -- DiagnosticUnderlineHint = { link = 'Normal' }
}
vim.cmd('colorscheme ' .. c)
if c == 'zenbones' then
	for group, opts in pairs(edits) do
	    vim.api.nvim_set_hl(0, group, opts) 
	end
end


require('mason').setup()

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
vim.keymap.set('n', '<leader>cn', ':cn<CR>')
vim.keymap.set('n', '<leader>cp', ':cp<CR>')
vim.keymap.set('i', '<C-x><C-o>', function()
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
    'ols',
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

vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
  callback = function()
    vim.opt.guicursor =
      "n-v-c:block," ..
      "i-ci-ve:ver25," ..
      "r-cr:hor20," ..
      "o:hor50," ..
      "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor," ..
      "sm:block-blinkwait175-blinkoff150-blinkon175"
  end,
})

vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
  callback = function()
    vim.opt.guicursor = "a:ver25-blinkon0"
  end,
})

vim.api.nvim_create_user_command("Comp", function(opts)
    if opts.args ~= "" then
        vim.opt.makeprg = opts.args
    end
    vim.cmd("silent make")
    vim.cmd("copen")
end, {
nargs = "*",   -- accept arguments
})
