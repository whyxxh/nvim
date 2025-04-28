return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",

    opts = function (_, opts)
        local ls = require("luasnip")
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node
        local extras = require("luasnip.extras")
        local rep = extras.rep

        vim.keymap.set({ "i", "s" }, "<A-k>", function()
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end, { silent = true }
        )

        vim.keymap.set({ "i", "s" }, "<A-j>", function()
                if ls.jumpable(-1) then
                    ls.jump(-1)
                end
            end, { silent = true }
        )

        ls.add_snippets("lua", {
            s("hello", {
                t('print("hello world")')
            })
        })

        ls.add_snippets("c", {
            s("tstruct", {
                t({ 'typedef struct {', 
                    ' ',
                    '} '
                }),
                i(1),
                t(";")
            })
        })

        ls.add_snippets("c", {
            s("tnstruct", {
                t({ 'typedef struct '}),
                i(1, 'type_name'),
                t({ '{', ' ', '} ' }),
                i(2, 'TypeName'),
                t(";")
            })
        })
        
        ls.add_snippets("c", {
            s("st", {
                t({'#include <stdint.h>', "#include <stdio.h>", "", "int main(void) {", "   return 0;", "}"})
            })
        })
    end

}
