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
    'https://github.com/dgagn/diagflow.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/chomosuke/typst-preview.nvim',
    'https://github.com/nvim-mini/mini.pick',
    'https://github.com/nvim-mini/mini.extra',
    'https://github.com/Saghen/blink.cmp',
    'https://github.com/WTFox/jellybeans.nvim',
    'https://github.com/m4xshen/hardtime.nvim',
    'https://github.com/MunifTanjim/nui.nvim',
    'https://github.com/tris203/precognition.nvim',
    -- 'https://github.com/Olical/conjure',
})

vim.cmd.colorscheme("myzenbones")

require('mason').setup()
require('diagflow').setup()
-- require('hardtime').setup()
-- require('precognition').setup()
-- require("precognition").hide()

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

local map = vim.keymap.set
map('n', '<leader>e', ':Oil<CR>')
map('n', '<leader>pp', ':Precognition toggle<CR>')
map('n', '<leader>ff', ':Pick files<CR>')
map('n', '<leader>fb', ':Pick buffers<CR>')
map('n', 'z=', ':Pick spellsuggest<CR>')
map('n', '<leader>ot', '<C-w>v<C-w>l:term<CR>i')
map('n', 'gre', vim.diagnostic.open_float)
map('n', 'grf',  vim.lsp.buf.format)
map('n', 'grd', vim.lsp.buf.definition, { noremap = true, silent = true })
map('n', '<leader>bn', ':bn<CR>')
map('n', '<ESC>', ':nohl<CR>')
map('n', '<leader>q', ':q!<CR>')
map('n', '<leader>w', ':up<CR>')
map('n', '<C-h>', '<C-w><C-h>')
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')
map('n', '<C-l>', '<C-w><C-l>')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('t', '<ESC>', '<C-\\><C-n>')
vim.keymap.set("n", "<leader>t", function()
    vim.cmd("belowright split")
    vim.cmd("resize -5")
    vim.cmd("terminal")
end)

local lsps = {
    'tinymist',
    'ocamllsp',
    'pyright',
    'hls',
    'ruff',
    'clangd',
    'rust_analyzer',
    'revo',
    'clojure_lsp',
    'fennel_language_server'
}

vim.lsp.config('clangd', {
    cmd = { '/opt/homebrew/opt/llvm/bin/clangd' },
})

vim.lsp.config('rust_analyzer', {
    assist = {
        importEnforceGranularity = true,
        importPrefix = 'crate',
    },
    cargo = {
        allFeatures = true,
    },
    checkOnSave = {
        command = 'clippy',
    },
    inlayHints = { locationLinks = false },
    diagnostics = {
        enable = true,
        experimental = {
            enable = true,
        },
    },
})

vim.lsp.config("hls", {
    settings = {
        haskell = {
            formattingProvider = "fourmolu",
        },
    },
})

vim.lsp.config("ocamllsp", {
    settings = {
        ocaml = {
            formattingProvider = "ocamlformat",
        },
    },
})

for _, lsp in ipairs(lsps) do
    vim.lsp.enable(lsp)
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function(args)
        if vim.bo[args.buf].filetype ~= 'markdown' then
            pcall(vim.treesitter.start, args.buf)
        end
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

vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
    callback = function()
        vim.opt.guicursor = ""
        io.write("\x1b[ q")
        io.flush()
    end,
})
