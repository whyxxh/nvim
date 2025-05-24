require("lsp-format").setup {}

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    require("lsp-format").on_attach(client, args.buf)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "tex" },
    callback = function()
        vim.cmd("PencilSoft")
        vim.o.number = false
        vim.o.conceallevel = 0
        vim.o.relativenumber = false
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "h" },
    callback = function()
        vim.o.tabstop = 8
        vim.o.shiftwidth = 8
        vim.o.softtabstop = 8
    end
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    callback = function()
        local path = vim.fn.expand("%:p")
        if path:match("^" .. vim.fn.expand("$HOME") .. "/Documents/code/clang/compiler/.*%.c$") or
           path:match("^" .. vim.fn.expand("$HOME") .. "/Documents/code/clang/compiler/.*%.h$") then
            vim.bo.tabstop = 8
            vim.bo.shiftwidth = 8
            vim.bo.softtabstop = 8
        end
    end,
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
