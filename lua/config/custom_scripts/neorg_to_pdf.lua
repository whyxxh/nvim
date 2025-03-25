local M = {}

M.export_and_convert_to_pdf = function()
  local source_dir = "~/notes/school/francais"
  local dest_dir = "~/Documents/notes/francais-a-imprimer"
  local pdf_dir = dest_dir .. "/pdf"
  -- Create PDF directory if it doesn't exist
  vim.fn.mkdir(pdf_dir, "p")

  -- Iterate through all Neorg files in the source directory
  local handle = io.popen('find ' .. vim.fn.expand(source_dir) .. ' -type f -name "*.norg"')
  local files = handle:lines()
  for file in files do
    -- Extract the directory and file name
    local dir_name = file:match(vim.fn.expand(source_dir) .. '/(.+)')
    local file_name = file:match("([^/]+)%.norg$")
    local md_file = dest_dir .. "/" .. dir_name .. "/" .. file_name .. ".md"

    -- Create destination directory for Markdown file
    vim.fn.mkdir(vim.fn.fnamemodify(md_file, ":p:h"), "p")

    -- Export the Neorg file to Markdown
    vim.cmd("Neorg export to-file " .. file .. " " .. md_file)

    -- Convert the Markdown file to PDF using Pandoc
    local cmd = "pandoc " .. md_file .. " -o " .. pdf_dir .. "/" .. file_name .. ".pdf"
    vim.fn.system(cmd)

    -- Optionally, remove the Markdown file after conversion
    os.remove(md_file)
  end
  print("Conversion completed!")
end

return M
