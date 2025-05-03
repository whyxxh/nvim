-- Telescope
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>' )
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fc', ':Telescope colorscheme<CR>')
vim.keymap.set('n', '<leader>fn', ':Telescope notify<CR>')

-- Markdown
vim.keymap.set("n", "<nn>", "':e <c-r><c-w>.md'", { expr = true }) -- create link if nonexistent
vim.keymap.set("n", "<nl>", "2saiw]", { expr = true }) -- create link if nonexistent

-- harpoon (does not work in keymaps.lua)

-- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

-- other
vim.keymap.set('n', '<leader>bn', ':bn<CR>')
