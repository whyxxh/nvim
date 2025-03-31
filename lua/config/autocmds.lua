
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "norg", "markdown", "tex" },
    callback = function()
        -- Check if the file contains 'lang = fr' or 'lang=fr'
        local lang_fr_found = false
        for _, line in ipairs(vim.fn.getline(1, '$')) do
            if line:match("lang%s*=%s*fr") then
                lang_fr_found = true
                break
            end
        end

        -- Set spell based on whether 'lang = fr' is found
        if lang_fr_found then
            vim.o.spell = false
        else
            vim.o.spell = true
            vim.o.spelllang = "en"
        end

        -- General settings
        vim.cmd("PencilSoft")
        vim.o.number = false
        vim.o.conceallevel = 0
        vim.o.relativenumber = false
    end
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
