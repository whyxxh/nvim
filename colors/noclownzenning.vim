if exists('g:colors_name')
    highlight clear
endif

let g:colors_name = 'no-clown-fiesta'

let s:italics = (&t_ZH != '' && &t_ZH != '[7m') || has('gui_running') || has('nvim')

if &background ==# 'dark'
    let g:terminal_color_0 = '#131313'
    let g:terminal_color_1 = '#E06C75'
    let g:terminal_color_2 = '#87B068'
    let g:terminal_color_3 = '#E5C07B'
    let g:terminal_color_4 = '#61AFEF'
    let g:terminal_color_5 = '#C678DD'
    let g:terminal_color_6 = '#56B6C2'
    let g:terminal_color_7 = '#C5C5C5'
    let g:terminal_color_8 = '#3E3E3E'
    let g:terminal_color_9 = '#E06C75'
    let g:terminal_color_10 = '#87B068'
    let g:terminal_color_11 = '#E5C07B'
    let g:terminal_color_12 = '#61AFEF'
    let g:terminal_color_13 = '#C678DD'
    let g:terminal_color_14 = '#56B6C2'
    let g:terminal_color_15 = '#E0E0E0'

    highlight Normal guifg=#C5C5C5 guibg=#131313 guisp=NONE gui=NONE cterm=NONE
    highlight! link ModeMsg Normal
    highlight Bold guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight Boolean guifg=#C5C5C5 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight BufferVisible guifg=#808080 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight BufferVisibleIndex guifg=#808080 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight BufferVisibleSign guifg=#808080 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight CocMarkdownLink guifg=#56B6C2 guibg=NONE guisp=NONE gui=underline cterm=underline
    highlight ColorColumn guifg=NONE guibg=#202020 guisp=NONE gui=NONE cterm=NONE
    highlight! link LspReferenceRead ColorColumn
    highlight! link LspReferenceText ColorColumn
    highlight! link LspReferenceWrite ColorColumn
    highlight Comment guifg=#5C5C5C guibg=NONE guisp=NONE gui=italic cterm=italic
    highlight Conceal guifg=#5C5C5C guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight Constant guifg=#C5C5C5 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link Character Constant
    highlight! link TroubleSource Constant
    highlight! link WhichKeyValue Constant
    highlight! link helpOption Constant
    highlight Cursor guifg=#131313 guibg=#C5C5C5 guisp=NONE gui=NONE cterm=NONE
    highlight! link TermCursor Cursor
    highlight CursorLine guifg=NONE guibg=#202020 guisp=NONE gui=NONE cterm=NONE
    highlight! link CocMenuSel CursorLine
    highlight! link CursorColumn CursorLine
    highlight! link FzfLuaFzfCursorLine CursorLine
    highlight! link SnacksPickerListCursorLine CursorLine
    highlight! link SnacksPickerPreviewCursorLine CursorLine
    highlight CursorLineNr guifg=#C5C5C5 guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight Delimiter guifg=#5C5C5C guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link markdownLinkTextDelimiter Delimiter

    highlight DiagnosticError guifg=#E06C75 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticHint guifg=#C678DD guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticInfo guifg=#61AFEF guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticOk guifg=#87B068 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticWarn guifg=#E5C07B guibg=NONE guisp=NONE gui=NONE cterm=NONE

    highlight DiagnosticSignError guifg=#E06C75 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link CocErrorSign DiagnosticSignError
    highlight DiagnosticSignHint guifg=#C678DD guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link CocHintSign DiagnosticSignHint
    highlight DiagnosticSignInfo guifg=#61AFEF guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link CocInfoSign DiagnosticSignInfo
    highlight DiagnosticSignOk guifg=#87B068 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticSignWarn guifg=#E5C07B guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link CocWarningSign DiagnosticSignWarn

    highlight DiagnosticUnderlineError guifg=NONE guibg=NONE guisp=#E06C75 gui=underline cterm=underline
    highlight! link CocErrorHighlight DiagnosticUnderlineError
    highlight DiagnosticUnderlineHint guifg=NONE guibg=NONE guisp=#C678DD gui=underline cterm=underline
    highlight! link CocHintHighlight DiagnosticUnderlineHint
    highlight DiagnosticUnderlineInfo guifg=NONE guibg=NONE guisp=#61AFEF gui=underline cterm=underline
    highlight! link CocInfoHighlight DiagnosticUnderlineInfo
    highlight DiagnosticUnderlineOk guifg=NONE guibg=NONE guisp=#87B068 gui=underline cterm=underline
    highlight DiagnosticUnderlineWarn guifg=NONE guibg=NONE guisp=#E5C07B gui=underline cterm=underline
    highlight! link CocWarningHighlight DiagnosticUnderlineWarn

    highlight DiagnosticVirtualTextError guifg=#E06C75 guibg=#201819 guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticVirtualTextHint guifg=#C678DD guibg=#1E1820 guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticVirtualTextInfo guifg=#61AFEF guibg=#181D20 guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticVirtualTextOk guifg=#87B068 guibg=#192018 guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticVirtualTextWarn guifg=#E5C07B guibg=#201F18 guisp=NONE gui=NONE cterm=NONE

    highlight DiffAdd guifg=NONE guibg=#1E2D1A guisp=NONE gui=NONE cterm=NONE
    highlight! link diffAdded DiffAdd
    highlight DiffChange guifg=NONE guibg=#1A2634 guisp=NONE gui=NONE cterm=NONE
    highlight! link diffChanged DiffChange
    highlight DiffDelete guifg=NONE guibg=#3A1C1E guisp=NONE gui=NONE cterm=NONE
    highlight! link diffRemoved DiffDelete
    highlight DiffText guifg=#C5C5C5 guibg=#2A3C50 guisp=NONE gui=NONE cterm=NONE

    highlight Directory guifg=#C5C5C5 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight Error guifg=#E06C75 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link DiagnosticError Error
    highlight! link ErrorMsg Error
    highlight FlashBackdrop guifg=#5C5C5C guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight FlashLabel guifg=#131313 guibg=#61AFEF guisp=NONE gui=NONE cterm=NONE
    highlight FloatBorder guifg=#333333 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight FloatTitle guifg=#C5C5C5 guibg=#202020 guisp=NONE gui=bold cterm=bold
    highlight FoldColumn guifg=#5C5C5C guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight Folded guifg=#808080 guibg=#202020 guisp=NONE gui=NONE cterm=NONE
    highlight Function guifg=#C5C5C5 guibg=NONE guisp=NONE gui=NONE cterm=NONE

    highlight GitSignsAdd guifg=#87B068 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link GitGutterAdd GitSignsAdd
    highlight GitSignsChange guifg=#61AFEF guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link GitGutterChange GitSignsChange
    highlight GitSignsDelete guifg=#E06C75 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link GitGutterDelete GitSignsDelete

    highlight IblIndent guifg=#202020 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link IndentLine IblIndent
    highlight IblScope guifg=#333333 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link IndentLineCurrent IblScope
    highlight Identifier guifg=#C5C5C5 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight IncSearch guifg=#131313 guibg=#E5C07B guisp=NONE gui=bold cterm=bold
    highlight! link CurSearch IncSearch
    highlight Italic guifg=NONE guibg=NONE guisp=NONE gui=italic cterm=italic
    highlight LineNr guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=NONE
    highlight LineNrAbove guifg=#3E3E3E guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight LineNrBelow guifg=#3E3E3E guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight LspInlayHint guifg=#5C5C5C guibg=#1A1A1A guisp=NONE gui=NONE cterm=NONE
    highlight MoreMsg guifg=#87B068 guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight NonText guifg=#202020 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link EndOfBuffer NonText
    highlight! link Whitespace NonText
    highlight NormalFloat guifg=#C5C5C5 guibg=#1A1A1A guisp=NONE gui=NONE cterm=NONE
    highlight Number guifg=#C5C5C5 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link Float Number

    highlight Pmenu guifg=#C5C5C5 guibg=#1A1A1A guisp=NONE gui=NONE cterm=NONE
    highlight PmenuSbar guifg=NONE guibg=#202020 guisp=NONE gui=NONE cterm=NONE
    highlight! link PmenuSel CursorLine
    highlight PmenuThumb guifg=NONE guibg=#333333 guisp=NONE gui=NONE cterm=NONE
    highlight RenderMarkdownCode guifg=NONE guibg=#1A1A1A guisp=NONE gui=NONE cterm=NONE
    highlight Search guifg=#131313 guibg=#61AFEF guisp=NONE gui=NONE cterm=NONE
    highlight! link MatchParen Search
    highlight! link QuickFixLine CursorLine
    highlight SnacksIndent guifg=#202020 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight SnacksIndentScope guifg=#333333 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight Special guifg=#C5C5C5 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight SpecialComment guifg=#5C5C5C guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight SpecialKey guifg=#3E3E3E guibg=NONE guisp=NONE gui=italic cterm=italic
    highlight SpellBad guifg=#E06C75 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
    highlight SpellCap guifg=#E5C07B guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
    highlight SpellLocal guifg=#61AFEF guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
    highlight SpellRare guifg=#C678DD guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
    highlight Statement guifg=#C5C5C5 guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight StatusLine guifg=#C5C5C5 guibg=#202020 guisp=NONE gui=NONE cterm=NONE
    highlight! link TabLine StatusLine
    highlight! link WinBar StatusLine
    highlight StatusLineNC guifg=#5C5C5C guibg=#1A1A1A guisp=NONE gui=NONE cterm=NONE
    highlight! link TabLineFill StatusLineNC
    highlight! link WinBarNC StatusLineNC
    highlight String guifg=#C5C5C5 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight TabLineSel guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight Title guifg=#C5C5C5 guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight Todo guifg=#131313 guibg=#E5C07B guisp=NONE gui=bold cterm=bold
    highlight Type guifg=#C5C5C5 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight Underlined guifg=NONE guibg=NONE guisp=NONE gui=underline cterm=underline
    highlight Visual guifg=NONE guibg=#2A323A guisp=NONE gui=NONE cterm=NONE
    highlight WarningMsg guifg=#E5C07B guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight WinSeparator guifg=#333333 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link VertSplit WinSeparator

    highlight diffFile guifg=#61AFEF guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight diffIndexLine guifg=#5C5C5C guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight diffLine guifg=#C678DD guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight diffNewFile guifg=#87B068 guibg=NONE guisp=NONE gui=italic cterm=italic
    highlight diffOldFile guifg=#E06C75 guibg=NONE guisp=NONE gui=italic cterm=italic

    " Tree-sitter
    highlight! link @variable Identifier
    highlight! link @variable.builtin Constant
    highlight! link @variable.parameter @variable
    highlight! link @variable.member @variable
    highlight! link @constant Constant
    highlight! link @constant.builtin Constant
    highlight! link @constant.macro Constant
    highlight! link @module Constant
    highlight! link @module.builtin @module
    highlight! link @label Statement
    highlight! link @string String
    highlight! link @string.documentation @string
    highlight! link @string.regexp Constant
    highlight! link @string.escape Special
    highlight! link @string.special Special
    highlight! link @character Constant
    highlight! link @boolean Boolean
    highlight! link @number Number
    highlight! link @number.float @number
    highlight! link @type Type
    highlight! link @type.builtin @type
    highlight! link @type.definition @type
    highlight! link @type.qualifier @type
    highlight! link @attribute Statement
    highlight! link @property Identifier
    highlight! link @function Function
    highlight! link @function.builtin Special
    highlight! link @function.call @function
    highlight! link @function.macro Statement
    highlight! link @function.method @function
    highlight! link @constructor Special
    highlight! link @operator Statement
    highlight! link @keyword Statement
    highlight! link @punctuation.delimiter Delimiter
    highlight! link @punctuation.bracket Delimiter
    highlight! link @punctuation.special Delimiter
    highlight! link @comment Comment
    highlight! link @comment.error Error
    highlight! link @comment.warning WarningMsg
    highlight! link @comment.todo Todo
    highlight! link @comment.note DiagnosticInfo
    highlight! link @markup.strong Bold
    highlight! link @markup.italic Italic
    highlight! link @markup.underline Underlined
    highlight! link @markup.heading Title
    highlight! link @diff.plus DiffAdd
    highlight! link @diff.minus DiffDelete
    highlight! link @diff.delta DiffChange

    if !s:italics
        highlight Boolean gui=NONE cterm=NONE
        highlight Character gui=NONE cterm=NONE
        highlight Comment gui=NONE cterm=NONE
        highlight Constant gui=NONE cterm=NONE
        highlight SpecialKey gui=NONE cterm=NONE
        highlight String gui=NONE cterm=NONE
        highlight diffNewFile gui=NONE cterm=NONE
        highlight diffOldFile gui=NONE cterm=NONE
    endif
else
    let g:terminal_color_0 = '#F5F5F5'
    let g:terminal_color_1 = '#C53B53'
    let g:terminal_color_2 = '#388E3C'
    let g:terminal_color_3 = '#C27A00'
    let g:terminal_color_4 = '#2075C7'
    let g:terminal_color_5 = '#8E44AD'
    let g:terminal_color_6 = '#008B8B'
    let g:terminal_color_7 = '#282828'
    let g:terminal_color_8 = '#A0A0A0'
    let g:terminal_color_9 = '#C53B53'
    let g:terminal_color_10 = '#388E3C'
    let g:terminal_color_11 = '#C27A00'
    let g:terminal_color_12 = '#2075C7'
    let g:terminal_color_13 = '#8E44AD'
    let g:terminal_color_14 = '#008B8B'
    let g:terminal_color_15 = '#111111'

    highlight Normal guifg=#282828 guibg=#F5F5F5 guisp=NONE gui=NONE cterm=NONE
    highlight Comment guifg=#909090 guibg=NONE guisp=NONE gui=italic cterm=italic
    highlight CursorLine guifg=NONE guibg=#E8E8E8 guisp=NONE gui=NONE cterm=NONE
    highlight CursorLineNr guifg=#282828 guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight LineNrAbove guifg=#C0C0C0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight LineNrBelow guifg=#C0C0C0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight StatusLine guifg=#282828 guibg=#E8E8E8 guisp=NONE gui=NONE cterm=NONE
    highlight Visual guifg=NONE guibg=#D0D8E0 guisp=NONE gui=NONE cterm=NONE

    highlight DiagnosticError guifg=#C53B53 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticWarn guifg=#C27A00 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticInfo guifg=#2075C7 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticHint guifg=#8E44AD guibg=NONE guisp=NONE gui=NONE cterm=NONE

    if !s:italics
        highlight Comment gui=NONE cterm=NONE
    endif
endif
