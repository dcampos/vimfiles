" Vim color file
" Converted from Textmate theme Text Ex Machina using Coloration v0.3.3 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Text Ex Machina"

hi Cursor ctermfg=233 ctermbg=231 cterm=NONE guifg=#151515 guibg=#f8f8f0 gui=NONE
hi Visual ctermfg=NONE ctermbg=241 cterm=NONE guifg=NONE guibg=#666666 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#2a2a2a gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#2a2a2a gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#2a2a2a gui=NONE
hi LineNr ctermfg=244 ctermbg=235 cterm=NONE guifg=#7e7e7e guibg=#2a2a2a gui=NONE
hi VertSplit ctermfg=239 ctermbg=239 cterm=NONE guifg=#525252 guibg=#525252 gui=NONE
hi MatchParen ctermfg=103 ctermbg=NONE cterm=underline guifg=#777cb2 guibg=NONE gui=underline
hi StatusLine ctermfg=254 ctermbg=239 cterm=bold guifg=#e6e6e6 guibg=#525252 gui=bold
hi StatusLineNC ctermfg=254 ctermbg=239 cterm=NONE guifg=#e6e6e6 guibg=#525252 gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=241 cterm=NONE guifg=NONE guibg=#666666 gui=NONE
hi IncSearch ctermfg=233 ctermbg=81 cterm=NONE guifg=#151515 guibg=#66ccff gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Folded ctermfg=236 ctermbg=233 cterm=NONE guifg=#333333 guibg=#151515 gui=NONE

hi Normal ctermfg=254 ctermbg=233 cterm=NONE guifg=#e6e6e6 guibg=#151515 gui=NONE
hi Boolean ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Character ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Comment ctermfg=236 ctermbg=NONE cterm=NONE guifg=#333333 guibg=NONE gui=NONE
hi Conditional ctermfg=103 ctermbg=NONE cterm=NONE guifg=#777cb2 guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=103 ctermbg=NONE cterm=NONE guifg=#777cb2 guibg=NONE gui=NONE
hi DiffAdd ctermfg=254 ctermbg=64 cterm=bold guifg=#e6e6e6 guibg=#437f09 gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#870404 guibg=NONE gui=NONE
hi DiffChange ctermfg=254 ctermbg=17 cterm=NONE guifg=#e6e6e6 guibg=#1a304e gui=NONE
hi DiffText ctermfg=254 ctermbg=24 cterm=bold guifg=#e6e6e6 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=231 ctermbg=21 cterm=underline guifg=#f8f8f0 guibg=#0000ff gui=underline,italic
hi WarningMsg ctermfg=231 ctermbg=21 cterm=underline guifg=#f8f8f0 guibg=#0000ff gui=underline,italic
hi Float ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Function ctermfg=191 ctermbg=NONE cterm=NONE guifg=#ccff66 guibg=NONE gui=NONE
hi Identifier ctermfg=60 ctermbg=NONE cterm=NONE guifg=#656797 guibg=NONE gui=NONE
hi Keyword ctermfg=103 ctermbg=NONE cterm=NONE guifg=#777cb2 guibg=NONE gui=NONE
hi Label ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66ccff guibg=NONE gui=NONE
hi NonText ctermfg=59 ctermbg=234 cterm=NONE guifg=#3b3a32 guibg=#1f1f1f gui=NONE
hi Number ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Operator ctermfg=103 ctermbg=NONE cterm=NONE guifg=#777cb2 guibg=NONE gui=NONE
hi PreProc ctermfg=103 ctermbg=NONE cterm=NONE guifg=#777cb2 guibg=NONE gui=NONE
hi Special ctermfg=254 ctermbg=NONE cterm=NONE guifg=#e6e6e6 guibg=NONE gui=NONE
hi SpecialKey ctermfg=59 ctermbg=235 cterm=NONE guifg=#3b3a32 guibg=#2a2a2a gui=NONE
hi Statement ctermfg=103 ctermbg=NONE cterm=NONE guifg=#777cb2 guibg=NONE gui=NONE
hi StorageClass ctermfg=60 ctermbg=NONE cterm=NONE guifg=#656797 guibg=NONE gui=NONE
hi String ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66ccff guibg=NONE gui=NONE
hi Tag ctermfg=59 ctermbg=NONE cterm=NONE guifg=#323464 guibg=NONE gui=NONE
hi Title ctermfg=254 ctermbg=NONE cterm=bold guifg=#e6e6e6 guibg=NONE gui=bold
hi Todo ctermfg=236 ctermbg=NONE cterm=inverse,bold guifg=#333333 guibg=NONE gui=inverse,bold
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=103 ctermbg=NONE cterm=NONE guifg=#777cb2 guibg=NONE gui=NONE
hi rubyFunction ctermfg=191 ctermbg=NONE cterm=NONE guifg=#ccff66 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi rubyConstant ctermfg=76 ctermbg=NONE cterm=NONE guifg=#3fe200 guibg=NONE gui=italic
hi rubyStringDelimiter ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66ccff guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=65 ctermbg=NONE cterm=NONE guifg=#718a3e guibg=NONE gui=italic
hi rubyInstanceVariable ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyInclude ctermfg=103 ctermbg=NONE cterm=NONE guifg=#777cb2 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyRegexp ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66ccff guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66ccff guibg=NONE gui=NONE
hi rubyEscape ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi rubyControl ctermfg=103 ctermbg=NONE cterm=NONE guifg=#777cb2 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyOperator ctermfg=103 ctermbg=NONE cterm=NONE guifg=#777cb2 guibg=NONE gui=NONE
hi rubyException ctermfg=103 ctermbg=NONE cterm=NONE guifg=#777cb2 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=76 ctermbg=NONE cterm=NONE guifg=#3fe200 guibg=NONE gui=italic
hi rubyRailsARAssociationMethod ctermfg=64 ctermbg=NONE cterm=NONE guifg=#4b8a0b guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=64 ctermbg=NONE cterm=NONE guifg=#4b8a0b guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=64 ctermbg=NONE cterm=NONE guifg=#4b8a0b guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=64 ctermbg=NONE cterm=NONE guifg=#4b8a0b guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=236 ctermbg=NONE cterm=NONE guifg=#333333 guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=64 ctermbg=NONE cterm=NONE guifg=#4b8a0b guibg=NONE gui=NONE
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=60 ctermbg=NONE cterm=NONE guifg=#656797 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=64 ctermbg=NONE cterm=NONE guifg=#4b8a0b guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=59 ctermbg=NONE cterm=NONE guifg=#323464 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi yamlAlias ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66ccff guibg=NONE gui=NONE
hi cssURL ctermfg=65 ctermbg=NONE cterm=NONE guifg=#718a3e guibg=NONE gui=italic
hi cssFunctionName ctermfg=64 ctermbg=NONE cterm=NONE guifg=#4b8a0b guibg=NONE gui=NONE
hi cssColor ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=103 ctermbg=NONE cterm=NONE guifg=#777cb2 guibg=NONE gui=NONE
hi cssClassName ctermfg=103 ctermbg=NONE cterm=NONE guifg=#777cb2 guibg=NONE gui=NONE
hi cssValueLength ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
