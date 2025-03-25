require "config.options"
require "config.keymaps"
require "config.lazy"
require "config.autocmds"
require "config.custom_scripts.neorg_to_pdf"

-- Register the :cpdf command
vim.api.nvim_create_user_command('Cpdf', function()
  require('config.custom_scripts.neorg_to_pdf').export_and_convert_to_pdf()  -- Call the function from your Lua script
end, {desc = "Export Neorg files to PDF"})

-- temporary
vim.api.nvim_set_hl(0, "Function", { fg = "#83a598" , bold = false })
vim.api.nvim_set_hl(0, "SignColumn", { link = "Normal" })
vim.diagnostic.config({
  signs = false,
})


vim.api.nvim_set_hl(0, "WhichKeyNormal", { link = "Normal" })
vim.api.nvim_set_hl(0, "WhichKeyBorder", { link = "Normal" })

vim.api.nvim_set_hl(0, "DiagnosticError", {link = "Error"})
vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" } )

-- vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { link = "GruvboxRed"})
-- vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { link = "GruvboxOrange"})
-- vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { link = "GruvboxYellow"})
-- vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { link = "GruvboxGreen"})
-- vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { link = "GruvboxAqua"})
-- vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { link = "GruvboxBlue"})
--
vim.api.nvim_set_hl(0, "RenderMarkdownBullet", { link = "DiagnosticInfo" })
vim.api.nvim_set_hl(0, "@markup.list", { link = "DiagnosticInfo" })
vim.api.nvim_set_hl(0, "RenderMarkdownChecked", { link = "DiagnosticInfo" })


