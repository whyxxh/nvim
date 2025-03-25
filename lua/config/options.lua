vim.g.mapleader = " "
vim.keymap.set('n', '<leader>bn', ':bn')
vim.g.maplocalleader = " "

vim.o.clipboard = "unnamedplus"

vim.o.cursorline = false
vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = "yes"
vim.cmd("hi! link SignColumn Normal")
vim.diagnostic.config({ signs = false })

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

vim.o.wrap = false

vim.o.updatetime = 300

vim.o.termguicolors = true

vim.o.signcolumn = "yes"

vim.o.laststatus = 0

vim.o.undofile = true

vim.o.scrolloff = 8

