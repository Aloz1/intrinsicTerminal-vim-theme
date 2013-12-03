" Intrinsic Terminal vim theme Copyright (C) 2013 Alastair Knowles
"
"   This program is free software: you can redistribute it and/or modify
"   it under the terms of the GNU General Public License as published by
"   the Free Software Foundation, either version 3 of the License, or
"   (at your option) any later version.
"
"   This program is distributed in the hope that it will be useful,
"   but WITHOUT ANY WARRANTY; without even the implied warranty of
"   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"   GNU General Public License for more details.
"
"   You should have received a copy of the GNU General Public License
"   along with this program.  If not, see <http://www.gnu.org/licenses/>.

set background=dark

let colorFolderName = "colors"
let Xres = readfile("/home/alastair/.Xresources")
let mtch = ""

" Set some sane defaults as colours
let colors = 
            \[
            \   "#ffffff",
            \   "#1f1912",
            \   "#d5fac8",
            \   "#0a0806",
            \   "#d80450",
            \   "#76bc20",
            \   "#fbb32f",
            \   "#3f91f1",
            \   "#f63f05",
            \   "#8ccdf0",
            \   "#1f1912",
            \   "#816749",
            \   "#ec6c99",
            \   "#94d900",
            \   "#e5e339",
            \   "#d8ff84",
            \   "#e6a2f3",
            \   "#8ccdf0",
            \   "#fee3b4"
            \]

" Extra colours
let C_81      = "#5fd7ff"
let C_130     = "#af5f00"
let C_159     = "#afffff"
let C_224     = "#ffd7d7"
let C_225     = "#ffd7ff"
let C_242     = "#6c6c6c"
let C_248     = "#a8a8a8"

" Get the line with the colour include
for i in Xres
    if matchstr( i, "#include\\s*\"[^\"\\r\\n]*/" . colorFolderName . "/[^\"\\r\\n]*\"" ) != ""
        let mtch = matchstr( i, "#include\\s*\"\\zs[^\"\\r\\n]*\\ze\"" )
    endif
endfor

if mtch != ""
    let Xres = readfile( mtch )
endif

for i in Xres
    let temp = matchstr( i, "[a-zA-Z]*[\\*\\.]\\zs[^\\r\\n]*" )
    if temp[:4] == "color"
        let colors[ 3 + matchstr( i, "color\\zs[0-9]*\\ze:") ] = matchstr( i, "color[0-9]*:\\s*\\zs#[0-9a-fA-F]*" )
    elseif temp[:6] == "cursor"
        let colors[0] = matchstr( i, "cursor:\\s*\\zs#[0-9a-fA-F]*" )
    elseif temp[:9] == "background"
        let colors[1] = matchstr( i, "background:\\s*\\zs#[0-9a-fA-F]*" )
    elseif temp[:9] == "foreground"
        let colors[2] = matchstr( i, "foreground:\\s*\\zs#[0-9a-fA-F]*" )
    endif
endfor

exe "hi SpecialKey     term=bold guifg=" . colors[7]
exe "hi NonText        term=bold gui=bold guifg=" . colors[15]
exe "hi Directory      term=bold guifg=" . colors[7]
exe "hi ErrorMsg       term=standout guifg=" . colors[18] . " guibg=" . colors[4]
exe "hi Search         term=reverse guibg=" . colors[14]
exe "hi MoreMsg        term=bold guifg=" . colors[5]
exe "hi LineNr         term=underline guifg=" . C_130
exe "hi CursorLineNr   term=bold  gui=bold guifg=" . C_130
exe "hi Question       term=standout guifg=" . colors[5]
exe "hi Title          term=bold gui=bold guifg=" . colors[8]
exe "hi Visual         term=reverse guibg=" . colors[10]
exe "hi WarningMsg     term=standout guifg=" . colors[4]
exe "hi WildMenu       term=standout guifg=" . colors[3] . " guibg=" . colors[14]
exe "hi Folded         term=standout guifg=" . colors[7] . " guibg=" . C_248
exe "hi FoldColumn     term=standout guifg=" . colors[7] . " guibg=" . C_248
exe "hi DiffAdd        term=bold guibg=" . C_81
exe "hi DiffChange     term=bold guibg=" . C_225
exe "hi DiffDelete     term=bold gui=bold guifg=" . colors[15] . " guibg=" . C_159
exe "hi DiffText       term=reverse gui=bold guibg=" . colors[12]
exe "hi SignColumn     term=standout guifg=" . colors[7] . " guibg=" . C_248
exe "hi Conceal        guifg=" . colors[7] . " guibg=" . C_242
exe "hi SpellBad       term=reverse gui=undercurl guisp=" . C_224
exe "hi SpellCap       term=reverse gui=undercurl guisp=" . C_81
exe "hi SpellRare      term=reverse gui=undercurl guisp=" . C_225
exe "hi SpellLocal     term=underline gui=undercurl guisp=" . colors[17]
exe "hi Pmenu          guibg=" . C_225
exe "hi PmenuSel       guibg=" . colors[7]
exe "hi PmenuSbar      guibg=" . C_248
exe "hi PmenuThumb     guibg=" . colors[3]
exe "hi TabLine        term=underline gui=underline guibg=" . colors[10]
exe "hi TabLineSel     term=bold gui=bold"
exe "hi CursorColumn   term=reverse guibg=" . colors[10]
exe "hi CursorLine     term=underline guibg=Grey90"
exe "hi ColorColumn    term=reverse guibg=" . C_224
exe "hi Cursor         guifg=" . colors[0] . " guibg=" . colors[2]
exe "hi Normal         guifg=" . colors[2] . " guibg=" . colors[1]
exe "hi MatchParen     term=reverse guibg=" . colors[17]
exe "hi Comment        term=bold guifg=" . colors[7]
exe "hi Constant       term=underline guifg=" . colors[4]
exe "hi Special        term=bold guifg=" . colors[8]
exe "hi Identifier     term=underline guifg=" . colors[9]
exe "hi Statement      term=bold gui=none guifg=" . C_130
exe "hi PreProc        term=underline guifg=" . colors[8]
exe "hi Type           term=underline gui=none guifg=" . colors[5]
exe "hi Underlined     term=underline gui=underline guifg=" . colors[8]
exe "hi Ignore         guifg=" . colors[18]
exe "hi Error          term=reverse guifg=" . colors[18] . " guibg=" . colors[12]
exe "hi Todo           term=standout guifg=" . colors[3] . " guibg=" . colors[14]

