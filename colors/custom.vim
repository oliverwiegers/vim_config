" Plugin:	 custom.vim
" Description: custom.vim theme
" Maintainer:  chrootzius

set background=dark
hi clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'custom'

hi Normal ctermfg=253 cterm=NONE

"" Misc {{{1
hi Boolean		ctermfg=184 ctermbg=NONE cterm=NONE
hi Character	ctermfg=141 ctermbg=NONE cterm=NONE
hi Comment		ctermfg=243 ctermbg=NONE cterm=NONE
hi Conditional	  ctermfg=159 ctermbg=NONE cterm=NONE
hi Constant		ctermfg=116 ctermbg=NONE cterm=NONE
hi Cursor	  ctermfg=15  ctermbg=NONE	cterm=NONE
hi CursorIM		ctermfg=15	ctermbg=NONE  cterm=NONE
hi Debug	  ctermfg=202 ctermbg=NONE cterm=NONE
hi Define	  ctermfg=226 ctermbg=NONE cterm=NONE
hi Delimiter	ctermfg=38	ctermbg=NONE cterm=NONE
hi Directory	ctermfg=12	ctermbg=NONE cterm=NONE
hi Exception	ctermfg=4 ctermbg=NONE cterm=NONE
hi Float	  ctermfg=202 ctermbg=NONE cterm=NONE
hi Function		ctermfg=35	ctermbg=NONE cterm=NONE
hi Identifier	ctermfg=45	ctermbg=NONE cterm=NONE
hi Ignore	  ctermfg=66
hi Include		ctermfg=64	ctermbg=NONE cterm=NONE
hi Keyword		ctermfg=42	ctermbg=NONE cterm=NONE
hi Label	  ctermfg=220 ctermbg=NONE cterm=NONE
hi Macro	  ctermfg=220 ctermbg=NONE cterm=NONE
hi MatchParen	ctermfg=50	ctermbg=NONE cterm=bold
hi NonText		ctermfg=35	ctermbg=NONE cterm=bold
hi Number	  ctermfg=116 ctermbg=NONE cterm=NONE
hi Operator		ctermfg=43	ctermbg=NONE cterm=NONE
hi PreCondit	ctermfg=159 ctermbg=NONE cterm=NONE
hi PreProc		ctermfg=223 ctermbg=NONE cterm=NONE
hi Question		ctermfg=102 ctermbg=NONE cterm=NONE
hi Repeat	  ctermfg=173 ctermbg=NONE cterm=NONE
hi Special		ctermfg=159 ctermbg=NONE cterm=NONE
hi SpecialChar	  ctermfg=66  ctermbg=NONE cterm=NONE
hi SpecialComment ctermfg=66  ctermbg=NONE cterm=NONE
hi SpecialKey	ctermfg=237 ctermbg=NONE cterm=NONE
hi Statement	ctermfg=42	ctermbg=NONE cterm=NONE
hi StorageClass	  ctermfg=117 ctermbg=NONE cterm=NONE
hi String	  ctermfg=110 ctermbg=NONE cterm=NONE
hi Structure	ctermfg=117 ctermbg=NONE cterm=NONE
hi Tag		  ctermfg=66  ctermbg=NONE cterm=NONE
hi Title	  ctermfg=141 ctermbg=NONE cterm=NONE
hi Todo		  ctermfg=202 ctermbg=NONE cterm=NONE
hi Type		  ctermfg=115 ctermbg=NONE cterm=NONE
hi Typedef		ctermfg=117 ctermbg=NONE cterm=NONE
hi Underlined	ctermfg=159 ctermbg=NONE cterm=NONE
hi VertSplit	ctermfg=237 ctermbg=237	 cterm=NONE
hi WildMenu		ctermfg=0 ctermbg=222  cterm=NONE

" Cursor lines {{{1
hi CursorColumn	  ctermfg=NONE ctermbg=239 cterm=NONE
hi CursorLine	ctermfg=NONE ctermbg=239 cterm=bold

" Tabline {{{1
hi TabLine		ctermfg=244 ctermbg=236	cterm=NONE
hi TabLineFill	  ctermfg=187 ctermbg=236 cterm=NONE
hi TabLineSel	ctermfg=254 ctermbg=236	cterm=bold

" Statusline {{{1
hi StatusLine	ctermfg=254 ctermbg=237 cterm=NONE
hi StatusLineNC	  ctermfg=244 ctermbg=237 cterm=NONE

" Number column {{{1
hi CursorLineNr	  ctermfg=102 ctermbg=237 cterm=NONE
hi LineNr	  ctermfg=102 ctermbg=237 cterm=NONE

"" Color column {{{1
hi ColorColumn ctermfg=NONE guibg=#3a3a3a ctermbg=237 gui=NONE cterm=NONE

"" Diff & Signs {{{1
"hi DiffAdd	  guifg=#87ff5f ctermfg=119 ctermbg=NONE gui=NONE cterm=NONE
"hi DiffChange guifg=#ffff5f ctermfg=227 ctermbg=NONE gui=NONE cterm=NONE
"hi DiffDelete guifg=#df5f5f ctermfg=167 ctermbg=NONE gui=NONE cterm=NONE
"hi DiffText   guifg=#ff5f5f ctermfg=203 guibg=#5f0000 ctermbg=52 gui=bold cterm=bold
"hi SignColumn ctermfg=NONE guibg=#3a3a3a ctermbg=237 gui=NONE cterm=NONE

"" Folds {{{1
"hi FoldColumn ctermfg=102 ctermbg=237 cterm=NONE guifg=#878787 guibg=#3a3a3a gui=NONE
"hi Folded	  ctermfg=102 ctermbg=237 cterm=NONE guifg=#878787 guibg=#3a3a3a gui=NONE

"" Search {{{1
"hi IncSearch guifg=#c0c0c0 ctermfg=7 guibg=#005fff ctermbg=27	gui=NONE cterm=NONE
"hi Search	 guifg=#c0c0c0 ctermfg=7 guibg=#df005f ctermbg=161 gui=NONE cterm=NONE

"" Messages {{{1
"hi Error	guifg=#eeeeee ctermfg=255 guibg=#df0000 ctermbg=160  gui=NONE cterm=NONE
"hi ErrorMsg   guifg=#eeeeee ctermfg=255 guibg=#df0000 ctermbg=160	gui=NONE cterm=NONE
"hi ModeMsg	  guifg=#afff87 ctermfg=156			ctermbg=NONE gui=bold cterm=bold
"hi MoreMsg	  guifg=#c0c0c0 ctermfg=7 guibg=#005fdf ctermbg=26	 gui=NONE cterm=NONE
"hi WarningMsg guifg=#c0c0c0 ctermfg=7	guibg=#005fdf ctermbg=26   gui=NONE cterm=NONE

"" Visual {{{1
"hi Visual	 guifg=#c0c0c0 ctermfg=7 guibg=#005f87 ctermbg=24 gui=reverse cterm=NONE
"hi VisualNOS guifg=#c0c0c0 ctermfg=7 guibg=#5f5f87 ctermbg=60 gui=reverse cterm=NONE

" Pmenu {{{1
hi Pmenu	  ctermfg=254  ctermbg=235 cterm=NONE
hi PmenuSbar	ctermfg=NONE ctermbg=238 cterm=NONE
hi PmenuSel		ctermfg=167  ctermbg=238 cterm=bold
hi PmenuThumb	ctermfg=NONE ctermbg=167 cterm=NONE

"" Spell {{{1
"hi SpellBad   guifg=#c0c0c0 ctermfg=7 guibg=#df5f5f ctermbg=167 gui=NONE cterm=NONE
"hi SpellCap   guifg=#c0c0c0 ctermfg=7 guibg=#005fdf ctermbg=26	gui=NONE cterm=NONE
"hi SpellLocal guifg=#c0c0c0 ctermfg=7 guibg=#8700af ctermbg=91	gui=NONE cterm=NONE
"hi SpellRare  guifg=#c0c0c0 ctermfg=7 guibg=#00875f ctermbg=29	gui=NONE cterm=NONE

"" Quickfix {{{1
"hi qfLineNr  ctermfg=238 ctermbg=NONE cterm=NONE guifg=#444444 guibg=NONE gui=NONE
"hi qfSeparator ctermfg=243 ctermbg=NONE cterm=NONE guifg=#767676 guibg=NONE gui=NONE

"" Plugin: vim-easymotion {{{1
"hi EasyMotionTarget	   guifg=#ffff5f ctermfg=227 ctermbg=NONE gui=bold cterm=bold
"hi EasyMotionTarget2First	guifg=#df005f ctermfg=161 ctermbg=NONE gui=NONE cterm=NONE
"hi EasyMotionTarget2Second guifg=#ffff5f ctermfg=227 ctermbg=NONE gui=NONE cterm=NONE

"" Plugin: vim-rfc {{{1
"hi RFCDelim guifg=#585858 ctermfg=240 ctermbg=NONE gui=NONE cterm=NONE
"hi RFCID guifg=#ffaf5f ctermfg=215 ctermbg=NONE gui=NONE cterm=NONE
"hi RFCTitle guifg=#eeeeee ctermfg=255 ctermbg=NONE gui=NONE cterm=NONE
"hi RFCType	guifg=#585858 ctermfg=240 ctermbg=NONE gui=NONE cterm=NONE

"" Plugin: vim-signify {{{1
"hi SignifySignAdd	 guifg=#87ff5f ctermfg=119 guibg=#3a3a3a ctermbg=237 gui=bold cterm=bold
"hi SignifySignChange guifg=#ffff5f ctermfg=227 guibg=#3a3a3a ctermbg=237 gui=bold cterm=bold
"hi SignifySignDelete guifg=#df5f5f ctermfg=167 guibg=#3a3a3a ctermbg=237 gui=bold cterm=bold

"" Plugin: vim-startify {{{1
"hi StartifyBracket guifg=#585858 ctermfg=240 ctermbg=NONE gui=NONE cterm=NONE
"hi StartifyFile  guifg=#eeeeee ctermfg=255 ctermbg=NONE gui=NONE cterm=NONE
"hi StartifyFooter	guifg=#585858 ctermfg=240 ctermbg=NONE gui=NONE cterm=NONE
"hi StartifyHeader	guifg=#87df87 ctermfg=114 ctermbg=NONE gui=NONE cterm=NONE
"hi StartifyNumber	guifg=#ffaf5f ctermfg=215 ctermbg=NONE gui=NONE cterm=NONE
"hi StartifyPath  guifg=#8a8a8a ctermfg=245 ctermbg=NONE gui=NONE cterm=NONE
"hi StartifySection guifg=#dfafaf ctermfg=181 ctermbg=NONE gui=NONE cterm=NONE
"hi StartifySelect	guifg=#5fdfff ctermfg=81  ctermbg=NONE gui=NONE cterm=NONE
"hi StartifySlash guifg=#585858 ctermfg=240 ctermbg=NONE gui=NONE cterm=NONE
"hi StartifySpecial guifg=#585858 ctermfg=240 ctermbg=NONE gui=NONE cterm=NONE

"" Neovim {{{1
"if has('nvim')
  "hi EndOfBuffer  ctermfg=235	guifg=#262626 ctermbg=NONE gui=NONE cterm=NONE
  "hi TermCursor   ctermfg=NONE guibg=#ff00af ctermbg=199 gui=NONE cterm=NONE
  "hi TermCursorNC ctermfg=NONE ctermbg=NONE gui=NONE cterm=NONE
"endif
