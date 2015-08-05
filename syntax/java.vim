" Only do this when not done yet for this buffer
if (exists("b:did_syntax"))
  finish
endif
let b:did_ftplugin = 1

hi link javaInParen javaBraces

