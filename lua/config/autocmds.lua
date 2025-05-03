
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "tex" },
    callback = function()
        vim.cmd("PencilSoft")
        vim.o.number = false
        vim.o.conceallevel = 0
        vim.o.relativenumber = false
    end
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.c",
    callback = function()
        vim.fn.matchadd('Error', [[\%>80c]])
    end,
})

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
    group = augroup("autoupdate"),
    callback = function()
        if require("lazy.status").has_updates then
            require("lazy").update({ show = false, })
        end
    end,
})
