-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clipboard and mouse behavior
vim.o.clipboard = "unnamedplus"  -- Use system clipboard
vim.o.mouse = ""                 -- Disable mouse support

-- Cursor and line numbers
vim.o.cursorline = false         -- Don't highlight current line
vim.o.number = true              -- Show absolute line numbers
vim.o.relativenumber = true      -- Show relative line numbers

-- Sign column and diagnostics
vim.o.signcolumn = "yes"                     -- Always show sign column
vim.cmd("hi! link SignColumn Normal")        -- Match sign column color with normal background
vim.diagnostic.config({ signs = false })     -- Disable diagnostic signs

-- Indentation and tabs
vim.o.expandtab = true          -- Use spaces instead of tabs
vim.o.tabstop = 4               -- Number of spaces per tab
vim.o.shiftwidth = 4            -- Indent size for << and >>
vim.o.softtabstop = 4           -- Spaces a tab feels like in insert mode

-- Wrapping and scrolling
vim.o.wrap = false              -- Disable line wrapping
vim.o.scrolloff = 8             -- Keep 8 lines above/below cursor when scrolling

-- Statusline and command display
vim.o.laststatus = 2            -- Always show statusline
vim.o.statusline = ""           -- Empty custom statusline
vim.o.showmode = false          -- Don't show mode (like -- INSERT --)

-- UI and performance tweaks
vim.o.termguicolors = true      -- Enable 24-bit RGB colors
vim.o.updatetime = 300          -- Faster update time for CursorHold events
-- vim.o.winborder = 'rounded'
vim.g.netrw_banner = 0

-- Persistent undo
vim.o.undofile = true           -- Enable persistent undo

