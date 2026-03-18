local M = {}

--- Accent colors
M.accents = {
	red = '#e85a4f',
	coral = '#ff6b6b',
	rose = '#ff758f',
	pink = '#e57aa4',
	lavender = '#c9a0ff',
	violet = '#a998f0',
	blue = '#5b82c7',
	cyan = '#64b8b4',
	mint = '#7ce0c2',
	green = '#5fb36a',
	lime = '#9acd5a',
	yellow = '#f6ce4e',
	peach = '#ffb07c',
	orange = '#ff8e29',
}

--- @class Colors
M.colors = {
	accent = M.accents.yellow,
	white = '#d2d2d2',
	light_gray = '#999999',
	gray = '#737373',
    sorta_dark_gray = '#444444',
	dark_gray = '#282828',
	dark = '#151515',
	diff_add = '#273c29',
	diff_change = '#4d4322',
	diff_delete = '#492523',
	diff_text = '#857131',
}

--- Convenience `vim.api.nvim_set_hl()` wrapper
--- @param name string
--- @param val vim.api.keyset.highlight
local function hl(name, val)
	vim.api.nvim_set_hl(0, name, val)
end

function M.colorscheme()
	vim.o.background = 'dark'
	vim.g.colors_name = 'silentium'
	vim.cmd.highlight('clear')
	if vim.fn.has('syntax_on') then
		vim.cmd.syntax('reset')
	end

	hl('@constant.html', { fg = M.colors.light_gray })
	hl('@tag', { fg = M.colors.accent })
	hl('@tag.attribute', {})
	hl('@tag.builtin', { fg = M.colors.accent })
	hl('@tag.delimiter', {})
	hl('@type.builtin.c', { link = 'Type' })
	hl('@markup.list.markdown', { fg = M.colors.gray, bold = true })
	hl('@variable', {})
	hl('Added', { fg = M.accents.green })
	hl('Changed', { fg = M.accents.yellow })
	hl('Comment', { fg = M.colors.gray })
	hl('Constant', {})
	hl('CursorColumn', { bg = M.colors.dark_gray })
	hl('CursorLine', { bg = M.colors.dark_gray })
	hl('Delimiter', {})
	hl('DiagnosticError', { fg = M.accents.red })
	hl('DiagnosticHint', { fg = M.accents.blue })
	hl('DiagnosticInfo', { fg = M.accents.cyan })
	hl('DiagnosticOk', { fg = M.accents.green })
	hl('DiagnosticWarn', { fg = M.accents.yellow })
	hl('DiagnosticUnderlineError', { underline = true, sp = M.accents.red })
	hl('DiffAdd', { bg = M.colors.diff_add })
	hl('DiffChange', { bg = M.colors.diff_change })
	hl('DiffDelete', { bg = M.colors.diff_delete })
	hl('DiffText', { bg = M.colors.diff_text })
	hl('Directory', { fg = M.colors.accent })
	hl('Error', { bg = M.accents.red })
	hl('ErrorMsg', { fg = M.accents.red })
	hl('Folded', { bg = M.colors.dark_gray, fg = M.colors.gray })
	hl('Function', { fg = M.colors.white })
	hl('Identifier', {})
	hl('Keyword', { fg = M.colors.accent })
	hl('LineNr', { fg = M.colors.white, bold = true })
	hl('LineNrBelow', { fg = M.colors.sorta_dark_gray })
	hl('LineNrAbove', { fg = M.colors.sorta_dark_gray })
	hl('MatchParen', { bg = M.colors.dark_gray })
	hl('ModeMsg', { fg = M.accents.green })
	hl('MoreMsg', { fg = M.accents.blue })
	hl('NonText', { fg = M.colors.dark_gray })
	hl('Normal', { bg = nil, fg = M.colors.white })
	hl('NormalFloat', { link = Normal })
	hl('OkMsg', { fg = M.accents.green })
	hl('Operator', {})
	hl('Pmenu', {})
	hl('PmenuMatch', { fg = M.colors.accent })
	hl('PmenuMatchSel', { fg = M.colors.dark })
	hl('PmenuSel', { bg = M.colors.gray, fg = M.colors.dark })
	hl('PmenuShadow', { bg = M.colors.gray })
	hl('PmenuThumb', { bg = M.colors.gray })
	hl('PreProc', {})
	hl('Question', { fg = M.colors.accent })
	hl('QuickFixLine', { bg = M.colors.dark_gray })
	hl('Removed', { fg = M.accents.red })
	hl('SignColumn', { fg = M.colors.light_gray })
	hl('Special', {})
	hl('SpecialKey', { fg = M.colors.dark_gray })
	hl('SpellBad', { undercurl = true, sp = M.accents.red })
	hl('SpellCap', { undercurl = true, sp = M.accents.yellow })
	hl('SpellLocal', { undercurl = true, sp = M.accents.green })
	hl('SpellRare', { undercurl = true, sp = M.accents.blue })
	hl('Statement', { fg = M.colors.accent })
	hl('StatusLine', {})
	hl('StatusLineNC', {})
	hl('String', { fg = M.colors.light_gray })
	hl('Title', { fg = M.colors.accent })
	hl('Todo', {})
	hl('Type', { fg = M.colors.light_gray })
	hl('Visual', { bg = M.colors.dark_gray })
	hl('WarningMsg', { fg = M.accents.yellow })
	hl('WinBar', { bg = M.colors.accent, fg = M.colors.dark })
	hl('WinBarNC', { bg = M.colors.accent, fg = M.colors.dark })
	hl('WinSeparator', { fg = M.colors.gray })
	-- Plugins
	hl('NeoTreeDirectoryIcon', {})
	hl('NeoTreeDirectoryName', {})
	hl('NeoTreeGitAdded', { fg = M.colors.accent })
	hl('NeoTreeGitIgnored', { fg = M.colors.gray })
	hl('NeoTreeGitModified', { fg = M.colors.accent })
	hl('NeoTreeGitUntracked', { fg = M.colors.accent })

	vim.g.terminal_color_0 = M.colors.dark_gray
	vim.g.terminal_color_1 = M.accents.red
	vim.g.terminal_color_2 = M.accents.green
	vim.g.terminal_color_3 = M.accents.yellow
	vim.g.terminal_color_4 = M.accents.blue
	vim.g.terminal_color_5 = M.accents.pink
	vim.g.terminal_color_6 = M.accents.cyan
	vim.g.terminal_color_7 = M.colors.white
	vim.g.terminal_color_8 = M.colors.gray
	vim.g.terminal_color_9 = '#FF6A6A'
	vim.g.terminal_color_10 = '#7AD48A'
	vim.g.terminal_color_11 = '#FFE07A'
	vim.g.terminal_color_12 = '#7FA2E6'
	vim.g.terminal_color_13 = '#F29BC1'
	vim.g.terminal_color_14 = '#7FD9D4'
	vim.g.terminal_color_15 = '#FFFFFF'
end

--- Configure colorscheme
--- @param colors? Colors
function M.setup(colors)
	if colors ~= nil then
		M.colors = vim.tbl_extend('force', M.colors, colors)
	end
end

M.colorscheme()
