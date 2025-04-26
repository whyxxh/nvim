require "config.options"
require "config.keymaps"
require "config.lazy"
require "config.autocmds"

vim.diagnostic.config({
    virtual_text = {
        current_line = true
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "⨯",
            [vim.diagnostic.severity.WARN]  = "⚠",
            [vim.diagnostic.severity.INFO]  = "",
            [vim.diagnostic.severity.HINT]  = "★",
        },
    },
})


vim.o.conceallevel = 0
