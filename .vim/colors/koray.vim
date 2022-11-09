hi clear

let g:colors_name = "koray"

" Normal should come first
hi Normal     guifg=DarkRed  guibg=Black
hi Cursor     guifg=bg     guibg=fg
hi lCursor    guifg=NONE   guibg=Cyan

" Note: we never set 'term' because the defaults for B&W terminals are OK
hi DiffAdd    ctermbg=12    guibg=LightBlue
hi DiffChange ctermbg=3 guibg=LightMagenta
hi DiffText   ctermbg=0	   cterm=none gui=bold guibg=Black
hi DiffDelete ctermfg=12	   ctermbg=LightCyan gui=bold guifg=Blue guibg=LightCyan
hi Directory  ctermfg=14	   guifg=Blue
hi ErrorMsg   ctermfg=11	   ctermbg=none  guibg=black	    guifg=red
hi Error   ctermfg=9	   ctermbg=black  guibg=black	    guifg=red
hi SpellBad   ctermfg=1	   ctermbg=black  guibg=black	    guifg=red
hi ColorColumn	ctermfg=DarkRed	   ctermbg=black  guibg=black	    guifg=red
hi FoldColumn ctermfg=DarkBlue	   ctermbg=black     guibg=Grey	    guifg=DarkBlue
hi Folded     ctermbg=black	   ctermfg=Grey guibg=LightGrey guifg=DarkBlue
hi IncSearch  cterm=reverse	   gui=reverse
"hi LineNr     ctermbg=NONE ctermfg=white	   guifg=Brown
"0 black, 15 white
hi LineNr     ctermbg=0 ctermfg=15	   guifg=Brown
hi ModeMsg    cterm=bold	   gui=bold
hi MoreMsg    ctermfg=DarkGreen    gui=bold guifg=SeaGreen
hi NonText    ctermfg=Blue	   gui=bold guifg=gray guibg=white
"hi Pmenu      ctermbg=NONE ctermfg=white guibg=LightBlue
"hi PmenuSel   ctermbg=NONE ctermfg=DarkRed  guifg=White  guibg=DarkBlue
hi Pmenu      ctermbg=NONE ctermfg=9 guibg=LightBlue
hi PmenuSel   ctermbg=black ctermfg=white  guifg=White  guibg=DarkBlue
hi Question   ctermfg=DarkGreen    gui=bold guifg=SeaGreen
if &background == "light"
    hi Search     ctermfg=NONE	   ctermbg=Yellow guibg=Yellow guifg=NONE
else
    hi Search     ctermfg=Black	   ctermbg=Yellow guibg=Yellow guifg=Black
endif
hi SpecialKey ctermfg=DarkBlue	   guifg=Blue
"hi StatusLine cterm=underline	   ctermbg=NONE ctermfg=white guibg=gold guifg=blue
hi StatusLine cterm=NONE	   ctermbg=black ctermfg=white guibg=gold guifg=blue
hi StatusLineNC	cterm=NONE	   ctermbg=black ctermfg=red  guibg=gold guifg=blue
hi Title      ctermfg=DarkMagenta  gui=bold guifg=Magenta
hi VertSplit  cterm=reverse	   gui=reverse
hi Visual     cterm=NONE ctermbg=242	   gui=reverse guifg=Grey guibg=fg
hi VisualNOS  cterm=underline,bold gui=underline,bold
hi WarningMsg ctermfg=LightRed	   guifg=Red
hi WildMenu   ctermfg=Black	   ctermbg=Yellow    guibg=Yellow guifg=Black

" syntax highlighting
hi MatchParen  cterm=underline  ctermbg=NONE ctermfg=LightCyan     gui=NONE guifg=red2
hi Comment    cterm=NONE ctermfg=14     gui=NONE guifg=red2
hi Constant   cterm=NONE ctermfg=163   gui=NONE guifg=green3
hi Boolean   cterm=NONE ctermfg=165   gui=NONE guifg=green3
hi Number   cterm=NONE ctermfg=13   gui=NONE guifg=green3
hi Identifier cterm=NONE ctermfg=27    gui=NONE guifg=cyan4
hi PreProc    cterm=bold ctermfg=39 gui=NONE guifg=magenta3
hi Special    cterm=NONE ctermfg=11    gui=NONE guifg=deeppink
hi Statement  cterm=bold ctermfg=9     gui=bold guifg=DarkRed
hi Type	      cterm=underline ctermfg=124	     gui=bold guifg=blue

" for the codes, run (without backticks)
" zsh:
" 	`for code in {000..255}; do print -P -- "$code: %F{$code}Color%f"; done`
" bash:
" 	`for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Color"; done`



" vim: sw=2
