" Warm Contrast Theme for Vim (No Grays)
" Save this file as ~/.vim/colors/warm_contrast.vim

hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "warm_contrast"

" Background (slightly warm dark gray)
hi Normal guifg=#ffe4b5 guibg=#1e1b1a ctermfg=223 ctermbg=235

" Comments (darker, but not gray)
hi Comment guifg=#cc8866 ctermfg=173 gui=italic

" Strings (warm and distinct)
hi String guifg=#e6a95c ctermfg=215

" Errors (soft red)
hi Error guifg=#e06c75 guibg=#3c1e1e ctermfg=167 ctermbg=52

" Warnings (muted yellow)
hi WarningMsg guifg=#d19a66 ctermfg=173

" Identifiers (warm cyan-blue)
hi Identifier guifg=#56b6c2 ctermfg=81

" Functions (warm purple)
hi Function guifg=#c678dd ctermfg=177

" Types (warm lavender)
hi Type guifg=#b38ef3 ctermfg=141

" Statements (warm pinkish-red)
hi Statement guifg=#e06c9f ctermfg=168

" UI Elements (no grays)
hi LineNr guifg=#d19a66 guibg=#1e1b1a ctermfg=173 ctermbg=235
hi CursorLineNr guifg=#ffcc99 guibg=#2a2625 ctermfg=216 ctermbg=236
hi CursorLine guibg=#2a2625 ctermbg=236
hi Visual guibg=#4e2a2a ctermbg=237

" Match parentheses
hi MatchParen guifg=#ffffff guibg=#b362ff ctermfg=231 ctermbg=135

" Search highlighting
hi Search guifg=#1e1b1a guibg=#ffcc99 ctermfg=0 ctermbg=216
hi IncSearch guifg=#1e1b1a guibg=#d19a66 ctermfg=0 ctermbg=173

" Status li
