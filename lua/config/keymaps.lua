-- Telescope
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>' )
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fc', ':Telescope colorscheme<CR>')
vim.keymap.set('n', '<leader>fn', ':Telescope notify<CR>')

-- NvimTree
vim.keymap.set('n', '<leader>e', ':NvimTreeOpen<CR>')

-- Other
vim.keymap.set('n', '<leader>bn', ':bn<CR>')

--Markdown
vim.keymap.set("n", "<nn>", "':e <c-r><c-w>.md'", { expr = true }) -- create link if nonexistent
vim.keymap.set("n", "<nl>", "2saiw]", { expr = true }) -- create link if nonexistent
