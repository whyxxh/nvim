local Context = require('render-markdown.core.context')
local Iter = require('render-markdown.lib.iter')
local List = require('render-markdown.lib.list')
local Node = require('render-markdown.lib.node')
local Str = require('render-markdown.lib.str')
local log = require('render-markdown.core.log')
local state = require('render-markdown.state')

---@type table<string, string>
local cache = {}

---@class render.md.handler.Latex: render.md.Handler
local M = {}

---@param ctx render.md.HandlerContext
---@return render.md.Mark[]
function M.parse(ctx)
    local latex = state.get(ctx.buf).latex
    if Context.get(ctx.buf):skip(latex) then
        return {}
    end
    if vim.fn.executable(latex.converter) ~= 1 then
        log.add('debug', 'executable not found', latex.converter)
        return {}
    end

    local node = Node.new(ctx.buf, ctx.root)
    log.node('latex', node)

    local raw_expression = cache[node.text]
    if raw_expression == nil then
        raw_expression = vim.fn.system(latex.converter, node.text)
        if vim.v.shell_error == 1 then
            log.add('error', latex.converter, raw_expression)
            raw_expression = 'error'
        end
        cache[node.text] = raw_expression
    end

    local expressions = Str.split(raw_expression, '\n')
    for i = 1, #expressions do
        expressions[i] = Str.pad(node.start_col) .. expressions[i]
    end
    for _ = 1, latex.top_pad do
        table.insert(expressions, 1, '')
    end
    for _ = 1, latex.bottom_pad do
        table.insert(expressions, '')
    end

    local lines = Iter.list.map(expressions, function(expression)
        return { { expression, latex.highlight } }
    end)

    local above = latex.position == 'above'
    local row = above and node.start_row or node.end_row

    local marks = List.new_marks(ctx.buf, true)
    marks:add(false, row, 0, {
        virt_lines = lines,
        virt_lines_above = above,
    })
    return marks:get()
end

return M
