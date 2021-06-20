" Name:     NeoSolarized: Colorscheme for truecolor vim
" Author:   iCyMind <icyminnd@gmail.com>
" URL:      https://github.com/iCyMind/NeoSolarized
" License:  MIT
" Modified: Wed Jun 12 18:41:42 PDT 2016

" Usage "{{{
"
" ---------------------------------------------------------------------
" ABOUT:
" ---------------------------------------------------------------------
" Solarized is a carefully designed selective contrast colorscheme with dual
" light and dark modes that runs in both GUI, 256 and 16 color modes.
"
" But the origin solarized does not support truecolor terminal. NeoSolarized
" is a fixed colorscheme for neovim/vim which running in truecolor supported
" terminal.
"
" ---------------------------------------------------------------------
" OPTIONS:
" ---------------------------------------------------------------------
" Font styles:
" g:neosolarized_bold
" g:neosolarized_italic
" g:neosolarized_underline
"
" Appearance:
" g:neosolarized_contrast
" g:neosolarized_diffmode
" g:neosolarized_termBoldAsBright
" g:neosolarized_termtrans
" g:neosolarized_vertSplitBgTrans
" g:neosolarized_visibility
"
" ---------------------------------------------------------------------
" INSTALLATION:
" ---------------------------------------------------------------------
" move the NeoSolarized.vim to your VIMRUNTIME by manual or plugin manager
"
" MODIFY VIMRC:
"
" After either Option 1 or Option 2 above, put the following two lines in your
" .vimrc:
"
"     syntax enable
"     set background=dark
"     colorscheme NeoSolarized
"
" or, for the light background mode of Solarized:
"
"     syntax enable
"     set background=light
"     colorscheme NeoSolarized
"
" I like to have a different background in GUI and terminal modes, so I can use
" the following if-then. However, I find vim's background autodetection to be
" pretty good and, at least with MacVim, I can leave this background value
" assignment out entirely and get the same results.
"
"     if has('gui_running')
"       set background=light
"     else
"       set background=dark
"     endif
"
" See the Solarized homepage at http://ethanschoonover.com/solarized for
" screenshots which will help you select either the light or dark background.
"
" ---------------------------------------------------------------------
" COLOR VALUES
" ---------------------------------------------------------------------
" Download palettes and files from: http://ethanschoonover.com/solarized
"
" L\*a\*b values are canonical (White D65, Reference D50), other values are
" matched in sRGB space.
"
" SOLARIZED HEX     16/8 TERMCOL  XTERM/HEX   L*A*B      sRGB        HSB
" --------- ------- ---- -------  ----------- ---------- ----------- -----------
" base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
" base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
" base01    #586e75 10/7 brgreen  240 #4e4e4e 45 -07 -07  88 110 117 194  25  46
" base00    #657b83 11/7 bryellow 241 #585858 50 -07 -07 101 123 131 195  23  51
" base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
" base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
" base2     #eee8d5  7/7 white    254 #d7d7af 92 -00  10 238 232 213  44  11  93
" base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
" yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
" orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
" red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
" magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
" violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
" blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
" cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
" green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60
"
" ---------------------------------------------------------------------
" COLORSCHEME HACKING
" ---------------------------------------------------------------------
"
" Useful commands for testing colorschemes:
" :source $VIMRUNTIME/syntax/hitest.vim
" :help highlight-groups
" :help cterm-colors
" :help group-name
"
" Useful links for developing colorschemes:
" http://www.vim.org/scripts/script.php?script_id=2937
" http://vimcasts.org/episodes/creating-colorschemes-for-vim/
" http://www.frexx.de/xterm-256-notes/"
"
" }}}

" Default option values"{{{
" ---------------------------------------------------------------------

" Font styles:
let g:neosolarized_bold = get(g:, "neosolarized_bold", 1)
let g:neosolarized_italic = get(g:, "neosolarized_italic", 0)
let g:neosolarized_underline = get(g:, "neosolarized_underline", 1)

" Appearance:
let g:neosolarized_contrast = get(g:, "neosolarized_contrast", "normal")
let g:neosolarized_diffmode = get(g:, "neosolarized_diffmode", "normal")
let g:neosolarized_termBoldAsBright = get(g:, "neosolarized_termBoldAsBright", 1)
let g:neosolarized_termtrans = get(g:, "neosolarized_termtrans", 0)
let g:neosolarized_visibility = get(g:, "neosolarized_visibility", "normal")
let g:neosolarized_vertSplitBgTrans = get(g:, "neosolarized_vertSplitBgTrans", 1)

"}}}

" Colorscheme initialization "{{{
" ---------------------------------------------------------------------
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "NeoSolarized"

"}}}

" GUI & CSApprox hexadecimal palettes"{{{
" ---------------------------------------------------------------------
"
" Set gui and terminal at the same time.
    let s:gui_mode       = "gui"
    let s:gui_base03      = "#002b36"
    let s:gui_base02      = "#073642"
    let s:gui_base01      = "#586e75"
    let s:gui_base00      = "#657b83"
    let s:gui_base0       = "#839496"
    let s:gui_base1       = "#93a1a1"
    let s:gui_base2       = "#eee8d5"
    let s:gui_base3       = "#fdf6e3"
    let s:gui_yellow      = "#b58900"
    let s:gui_orange      = "#cb4b16"
    let s:gui_red         = "#dc322f"
    let s:gui_magenta     = "#d33682"
    let s:gui_violet      = "#6c71c4"
    let s:gui_blue        = "#268bd2"
    let s:gui_cyan        = "#2aa198"
    let s:gui_green       = "#719e07" "experimental
    "let s:green       = "#859900" "original

    let s:term_mode       = "cterm"
    let s:term_base03      = "8"
    let s:term_base02      = "0"
    let s:term_base01      = "10"
    let s:term_base00      = "11"
    let s:term_base0       = "12"
    let s:term_base1       = "14"
    let s:term_base2       = "7"
    let s:term_base3       = "15"
    let s:term_yellow      = "3"
    let s:term_orange      = "9"
    let s:term_red         = "1"
    let s:term_magenta     = "5"
    let s:term_violet      = "13"
    let s:term_blue        = "4"
    let s:term_cyan        = "6"
    let s:term_green       = "2"

"}}}

" Formatting options and null values for passthrough effect "{{{
" ---------------------------------------------------------------------
    let s:gui_none        = "NONE"
    let s:term_none       = "NONE"
    let s:n               = "NONE"
    let s:c               = ",undercurl"
    let s:r               = ",reverse"
    let s:s               = ",standout"
    let s:ou              = ""
    let s:ob              = ""
"}}}

" Background value based on termtrans setting "{{{
" ---------------------------------------------------------------------
if (has("gui_running") || g:neosolarized_termtrans == 0)
    let s:gui_back        = s:gui_base03
    let s:term_back        = s:term_base03
else
    let s:gui_back        = "NONE"
    let s:term_back        = "NONE"
endif
"}}}

" Alternate light scheme "{{{
" ---------------------------------------------------------------------
if &background == "light"
    " GUI
    let s:gui_temp03    =   s:gui_base03
    let s:gui_temp02    =   s:gui_base02
    let s:gui_temp01    =   s:gui_base01
    let s:gui_temp00    =   s:gui_base00
    let s:gui_base03    =   s:gui_base3
    let s:gui_base02    =   s:gui_base2
    let s:gui_base01    =   s:gui_base1
    let s:gui_base00    =   s:gui_base0
    let s:gui_base0     =   s:gui_temp00
    let s:gui_base1     =   s:gui_temp01
    let s:gui_base2     =   s:gui_temp02
    let s:gui_base3     =   s:gui_temp03
    if (s:gui_back != "NONE")
        let s:gui_back  =   s:gui_base03
    endif

    " terminal
    let s:term_temp03   =   s:term_base03
    let s:term_temp02   =   s:term_base02
    let s:term_temp01   =   s:term_base01
    let s:term_temp00   =   s:term_base00
    let s:term_base03   =   s:term_base3
    let s:term_base02   =   s:term_base2
    let s:term_base01   =   s:term_base1
    let s:term_base00   =   s:term_base0
    let s:term_base0    =   s:term_temp00
    let s:term_base1    =   s:term_temp01
    let s:term_base2    =   s:term_temp02
    let s:term_base3    =   s:term_temp03
    if (s:term_back != "NONE")
        let s:term_back =   s:term_base03
    endif
endif
"}}}

" Optional contrast schemes "{{{
" ---------------------------------------------------------------------
if g:neosolarized_contrast == "high"
    let s:gui_base01      = s:gui_base00
    let s:gui_base00      = s:gui_base0
    let s:gui_base0       = s:gui_base1
    let s:gui_base1       = s:gui_base2
    let s:gui_base2       = s:gui_base3
    let s:gui_back        = s:gui_back

    let s:term_base01      = s:term_base00
    let s:term_base00      = s:term_base0
    let s:term_base0       = s:term_base1
    let s:term_base1       = s:term_base2
    let s:term_base2       = s:term_base3
    let s:term_back        = s:term_back
endif
if g:neosolarized_contrast == "low"
    let s:gui_back        = s:gui_base02
    let s:term_back        = s:term_base02
    let s:ou          = ",underline"
endif
"}}}

" Overrides dependent on user specified values and environment "{{{
" ---------------------------------------------------------------------
if (g:neosolarized_bold == 0 || &t_Co == 8 )
    let s:b           = ""
    let s:bb          = ",bold"
else
    let s:b           = ",bold"
    let s:bb          = ""
endif

if g:neosolarized_underline == 0
    let s:u           = ""
else
    let s:u           = ",underline"
endif

if g:neosolarized_italic == 0
    let s:i           = ""
else
    let s:i           = ",italic"
endif
"}}}

" Highlighting primitives"{{{
" ---------------------------------------------------------------------

exe "let s:bg_none      = ' "   .   "guibg=".s:gui_none     .   " ctermbg=".s:term_none      .   "'"
exe "let s:bg_back      = ' "   .   "guibg=".s:gui_back     .   " ctermbg=".s:term_back      .   "'"
exe "let s:bg_base03    = ' "   .   "guibg=".s:gui_base03   .   " ctermbg=".s:term_base03    .   "'"
exe "let s:bg_base02    = ' "   .   "guibg=".s:gui_base02   .   " ctermbg=".s:term_base02    .   "'"
exe "let s:bg_base01    = ' "   .   "guibg=".s:gui_base01   .   " ctermbg=".s:term_base01    .   "'"
exe "let s:bg_base00    = ' "   .   "guibg=".s:gui_base00   .   " ctermbg=".s:term_base00    .   "'"
exe "let s:bg_base0     = ' "   .   "guibg=".s:gui_base0    .   " ctermbg=".s:term_base0     .   "'"
exe "let s:bg_base1     = ' "   .   "guibg=".s:gui_base1    .   " ctermbg=".s:term_base1     .   "'"
exe "let s:bg_base2     = ' "   .   "guibg=".s:gui_base2    .   " ctermbg=".s:term_base2     .   "'"
exe "let s:bg_base3     = ' "   .   "guibg=".s:gui_base3    .   " ctermbg=".s:term_base3     .   "'"
exe "let s:bg_green     = ' "   .   "guibg=".s:gui_green    .   " ctermbg=".s:term_green     .   "'"
exe "let s:bg_yellow    = ' "   .   "guibg=".s:gui_yellow   .   " ctermbg=".s:term_yellow    .   "'"
exe "let s:bg_orange    = ' "   .   "guibg=".s:gui_orange   .   " ctermbg=".s:term_orange    .   "'"
exe "let s:bg_red       = ' "   .   "guibg=".s:gui_red      .   " ctermbg=".s:term_red       .   "'"
exe "let s:bg_magenta   = ' "   .   "guibg=".s:gui_magenta  .   " ctermbg=".s:term_magenta   .   "'"
exe "let s:bg_violet    = ' "   .   "guibg=".s:gui_violet   .   " ctermbg=".s:term_violet    .   "'"
exe "let s:bg_blue      = ' "   .   "guibg=".s:gui_blue     .   " ctermbg=".s:term_blue      .   "'"
exe "let s:bg_cyan      = ' "   .   "guibg=".s:gui_cyan     .   " ctermbg=".s:term_cyan      .   "'"

exe "let s:fg_none      = ' "   .   "guifg=".s:gui_none     .   " ctermfg=".s:term_none      .   "'"
exe "let s:fg_back      = ' "   .   "guifg=".s:gui_back     .   " ctermfg=".s:term_back      .   "'"
exe "let s:fg_base03    = ' "   .   "guifg=".s:gui_base03   .   " ctermfg=".s:term_base03    .   "'"
exe "let s:fg_base02    = ' "   .   "guifg=".s:gui_base02   .   " ctermfg=".s:term_base02    .   "'"
exe "let s:fg_base01    = ' "   .   "guifg=".s:gui_base01   .   " ctermfg=".s:term_base01    .   "'"
exe "let s:fg_base00    = ' "   .   "guifg=".s:gui_base00   .   " ctermfg=".s:term_base00    .   "'"
exe "let s:fg_base0     = ' "   .   "guifg=".s:gui_base0    .   " ctermfg=".s:term_base0     .   "'"
exe "let s:fg_base1     = ' "   .   "guifg=".s:gui_base1    .   " ctermfg=".s:term_base1     .   "'"
exe "let s:fg_base2     = ' "   .   "guifg=".s:gui_base2    .   " ctermfg=".s:term_base2     .   "'"
exe "let s:fg_base3     = ' "   .   "guifg=".s:gui_base3    .   " ctermfg=".s:term_base3     .   "'"
exe "let s:fg_green     = ' "   .   "guifg=".s:gui_green    .   " ctermfg=".s:term_green     .   "'"
exe "let s:fg_yellow    = ' "   .   "guifg=".s:gui_yellow   .   " ctermfg=".s:term_yellow    .   "'"
exe "let s:fg_orange    = ' "   .   "guifg=".s:gui_orange   .   " ctermfg=".s:term_orange    .   "'"
exe "let s:fg_red       = ' "   .   "guifg=".s:gui_red      .   " ctermfg=".s:term_red       .   "'"
exe "let s:fg_magenta   = ' "   .   "guifg=".s:gui_magenta  .   " ctermfg=".s:term_magenta   .   "'"
exe "let s:fg_violet    = ' "   .   "guifg=".s:gui_violet   .   " ctermfg=".s:term_violet    .   "'"
exe "let s:fg_blue      = ' "   .   "guifg=".s:gui_blue     .   " ctermfg=".s:term_blue      .   "'"
exe "let s:fg_cyan      = ' "   .   "guifg=".s:gui_cyan     .   " ctermfg=".s:term_cyan      .   "'"

exe "let s:fmt_none     = ' "   .   "gui=NONE"          .   " cterm=NONE"           .   "'"
exe "let s:fmt_bold     = ' "   .   "gui=NONE".s:b      .   " cterm=NONE".s:b       .   "'"
exe "let s:fmt_bldi     = ' "   .   "gui=NONE".s:b      .   " cterm=NONE".s:b       .   "'"
exe "let s:fmt_undr     = ' "   .   "gui=NONE".s:u      .   " cterm=NONE".s:u       .   "'"
exe "let s:fmt_undb     = ' "   .   "gui=NONE".s:u.s:b  .   " cterm=NONE".s:u.s:b   .   "'"
exe "let s:fmt_undi     = ' "   .   "gui=NONE".s:u      .   " cterm=NONE".s:u       .   "'"
exe "let s:fmt_uopt     = ' "   .   "gui=NONE".s:ou     .   " cterm=NONE".s:ou      .   "'"
exe "let s:fmt_curl     = ' "   .   "gui=NONE".s:c      .   " cterm=NONE".s:c       .   "'"
exe "let s:fmt_ital     = ' "   .   "gui=NONE".s:i      .   " cterm=NONE".s:i       .   "'"
exe "let s:fmt_stnd     = ' "   .   "gui=NONE".s:s      .   " cterm=NONE".s:s       .   "'"
exe "let s:fmt_revr     = ' "   .   "gui=NONE".s:r      .   " cterm=NONE".s:r       .   "'"
exe "let s:fmt_revb     = ' "   .   "gui=NONE".s:r.s:b  .   " cterm=NONE".s:r.s:b   .   "'"
" revbb (reverse bold for bright colors) is only set to actual bold in low
" color terminals (t_co=8, such as OS X Terminal.app) and should only be used
" with colors 8-15.
exe "let s:fmt_revbb    = ' "   .   "gui=NONE".s:r.s:bb     .   " cterm=NONE".s:r.s:bb      .   "'"
exe "let s:fmt_revbbu   = ' "   .   "gui=NONE".s:r.s:bb.s:u .   " cterm=NONE".s:r.s:bb.s:u  .   "'"

if has("gui_running") || has("termguicolors") && &termguicolors
    exe "let s:sp_none      = ' guisp="     .       s:gui_none      .   "'"
    exe "let s:sp_back      = ' guisp="     .       s:gui_back      .   "'"
    exe "let s:sp_base03    = ' guisp="     .       s:gui_base03    .   "'"
    exe "let s:sp_base02    = ' guisp="     .       s:gui_base02    .   "'"
    exe "let s:sp_base01    = ' guisp="     .       s:gui_base01    .   "'"
    exe "let s:sp_base00    = ' guisp="     .       s:gui_base00    .   "'"
    exe "let s:sp_base0     = ' guisp="     .       s:gui_base0     .   "'"
    exe "let s:sp_base1     = ' guisp="     .       s:gui_base1     .   "'"
    exe "let s:sp_base2     = ' guisp="     .       s:gui_base2     .   "'"
    exe "let s:sp_base3     = ' guisp="     .       s:gui_base3     .   "'"
    exe "let s:sp_green     = ' guisp="     .       s:gui_green     .   "'"
    exe "let s:sp_yellow    = ' guisp="     .       s:gui_yellow    .   "'"
    exe "let s:sp_orange    = ' guisp="     .       s:gui_orange    .   "'"
    exe "let s:sp_red       = ' guisp="     .       s:gui_red       .   "'"
    exe "let s:sp_magenta   = ' guisp="     .       s:gui_magenta   .   "'"
    exe "let s:sp_violet    = ' guisp="     .       s:gui_violet    .   "'"
    exe "let s:sp_blue      = ' guisp="     .       s:gui_blue      .   "'"
    exe "let s:sp_cyan      = ' guisp="     .       s:gui_cyan      .   "'"
else
    let s:sp_none           =   ""
    let s:sp_back           =   ""
    let s:sp_base03         =   ""
    let s:sp_base02         =   ""
    let s:sp_base01         =   ""
    let s:sp_base00         =   ""
    let s:sp_base0          =   ""
    let s:sp_base1          =   ""
    let s:sp_base2          =   ""
    let s:sp_base3          =   ""
    let s:sp_green          =   ""
    let s:sp_yellow         =   ""
    let s:sp_orange         =   ""
    let s:sp_red            =   ""
    let s:sp_magenta        =   ""
    let s:sp_violet         =   ""
    let s:sp_blue           =   ""
    let s:sp_cyan           =   ""
endif

"}}}

" Basic highlighting"{{{
" ---------------------------------------------------------------------
" note that link syntax to avoid duplicate configuration doesn't work with the
" exe compiled formats

exe "hi! Normal"         .s:fmt_none   .s:fg_base0  .s:bg_back

exe "hi! Comment"        .s:fmt_ital   .s:fg_base01 .s:bg_none
"       *Comment         any comment

exe "hi! Constant"       .s:fmt_none   .s:fg_cyan   .s:bg_none
"       *Constant        any constant
"        String          a string constant: "this is a string"
"        Character       a character constant: 'c', '\n'
"        Number          a number constant: 234, 0xff
"        Boolean         a boolean constant: TRUE, false
"        Float           a floating point constant: 2.3e10

exe "hi! Identifier"     .s:fmt_none   .s:fg_blue   .s:bg_none
"       *Identifier      any variable name
"        Function        function name (also: methods for classes)
"
exe "hi! Statement"      .s:fmt_none   .s:fg_green  .s:bg_none
"       *Statement       any statement
"        Conditional     if, then, else, endif, switch, etc.
"        Repeat          for, do, while, etc.
"        Label           case, default, etc.
"        Operator        "sizeof", "+", "*", etc.
"        Keyword         any other keyword
"        Exception       try, catch, throw

exe "hi! PreProc"        .s:fmt_none   .s:fg_orange .s:bg_none
"       *PreProc         generic Preprocessor
"        Include         preprocessor #include
"        Define          preprocessor #define
"        Macro           same as Define
"        PreCondit       preprocessor #if, #else, #endif, etc.

exe "hi! Type"           .s:fmt_none   .s:fg_yellow .s:bg_none
"       *Type            int, long, char, etc.
"        StorageClass    static, register, volatile, etc.
"        Structure       struct, union, enum, etc.
"        Typedef         A typedef

exe "hi! Special"        .s:fmt_none   .s:fg_red    .s:bg_none
"       *Special         any special symbol
"        SpecialChar     special character in a constant
"        Tag             you can use CTRL-] on this
"        Delimiter       character that needs attention
"        SpecialComment  special things inside a comment
"        Debug           debugging statements

exe "hi! Underlined"     .s:fmt_none   .s:fg_violet .s:bg_none
"       *Underlined      text that stands out, HTML links

exe "hi! Ignore"         .s:fmt_none   .s:fg_none   .s:bg_none
"       *Ignore          left blank, hidden  |hl-Ignore|

exe "hi! Error"          .s:fmt_bold   .s:fg_red    .s:bg_none
"       *Error           any erroneous construct

exe "hi! Todo"           .s:fmt_bold   .s:fg_magenta.s:bg_none
"       *Todo            anything that needs extra attention; mostly the
"                        keywords TODO FIXME and XXX
"
"}}}

" Extended highlighting "{{{
" ---------------------------------------------------------------------
if  (g:neosolarized_visibility=="high")
    exe "hi! SpecialKey" .s:fmt_revr   .s:fg_red    .s:bg_none
    exe "hi! NonText"    .s:fmt_bold   .s:fg_red    .s:bg_none
elseif  (g:neosolarized_visibility=="low")
    exe "hi! SpecialKey" .s:fmt_bold   .s:fg_base02 .s:bg_none
    exe "hi! NonText"    .s:fmt_bold   .s:fg_base02 .s:bg_none
else
    exe "hi! SpecialKey" .s:fmt_bold   .s:fg_base00 .s:bg_base02
    exe "hi! NonText"    .s:fmt_bold   .s:fg_base00 .s:bg_none
endif
exe "hi! StatusLine"     .s:fmt_none   .s:fg_base1  .s:bg_base02 .s:fmt_revbb
exe "hi! StatusLineNC"   .s:fmt_none   .s:fg_base00 .s:bg_base02 .s:fmt_revbb
exe "hi! Visual"         .s:fmt_none   .s:fg_base01 .s:bg_base03 .s:fmt_revbb
exe "hi! Directory"      .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! ErrorMsg"       .s:fmt_revr   .s:fg_red    .s:bg_none
exe "hi! IncSearch"      .s:fmt_stnd   .s:fg_orange .s:bg_none
exe "hi! Search"         .s:fmt_revr   .s:fg_yellow .s:bg_none
exe "hi! MoreMsg"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! ModeMsg"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! LineNr"         .s:fmt_none   .s:fg_base01 .s:bg_base02
exe "hi! Question"       .s:fmt_bold   .s:fg_cyan   .s:bg_none
if (g:neosolarized_vertSplitBgTrans == 1)
    exe "hi! VertSplit"  .s:fmt_none   .s:fg_base00 .s:bg_none
else
    exe "hi! VertSplit"  .s:fmt_none   .s:fg_base00 .s:bg_base00
endif
exe "hi! Title"          .s:fmt_bold   .s:fg_orange .s:bg_none
exe "hi! VisualNOS"      .s:fmt_stnd   .s:fg_none   .s:bg_base02 .s:fmt_revbb
exe "hi! WarningMsg"     .s:fmt_bold   .s:fg_red    .s:bg_none
exe "hi! WildMenu"       .s:fmt_none   .s:fg_base2  .s:bg_base02 .s:fmt_revbb
exe "hi! Folded"         .s:fmt_bold   .s:fg_base0  .s:bg_base02  .s:sp_base03
exe "hi! FoldColumn"     .s:fmt_none   .s:fg_base0  .s:bg_base02

if (g:neosolarized_diffmode=="high")
    exe "hi! DiffAdd"        .s:fmt_revr   .s:fg_green  .s:bg_none
    exe "hi! DiffChange"     .s:fmt_revr   .s:fg_yellow .s:bg_none
    exe "hi! DiffDelete"     .s:fmt_revr   .s:fg_red    .s:bg_none
    exe "hi! DiffText"       .s:fmt_revr   .s:fg_blue   .s:bg_none
elseif  (g:neosolarized_diffmode=="low")
    exe "hi! DiffAdd"        .s:fmt_undr   .s:fg_green  .s:bg_none   .s:sp_green
    exe "hi! DiffChange"     .s:fmt_undr   .s:fg_yellow .s:bg_none   .s:sp_yellow
    exe "hi! DiffDelete"     .s:fmt_bold   .s:fg_red    .s:bg_none
    exe "hi! DiffText"       .s:fmt_undr   .s:fg_blue   .s:bg_none   .s:sp_blue
else " normal
    exe "hi! DiffAdd"        .s:fmt_bold   .s:fg_green  .s:bg_base02 .s:sp_green
    exe "hi! DiffChange"     .s:fmt_bold   .s:fg_yellow .s:bg_base02 .s:sp_yellow
    exe "hi! DiffDelete"     .s:fmt_bold   .s:fg_red    .s:bg_base02
    exe "hi! DiffText"       .s:fmt_bold   .s:fg_blue   .s:bg_base02 .s:sp_blue
endif

exe "hi! SignColumn"     .s:fmt_none   .s:fg_base0  .s:bg_none
exe "hi! Conceal"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! SpellBad"       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_red
exe "hi! SpellCap"       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_violet
exe "hi! SpellRare"      .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_cyan
exe "hi! SpellLocal"     .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_yellow
exe "hi! Pmenu"          .s:fmt_none   .s:fg_base0  .s:bg_base02  .s:fmt_revbb
exe "hi! PmenuSel"       .s:fmt_none   .s:fg_base01 .s:bg_base2   .s:fmt_revbb
exe "hi! PmenuSbar"      .s:fmt_none   .s:fg_base2  .s:bg_base0   .s:fmt_revbb
exe "hi! PmenuThumb"     .s:fmt_none   .s:fg_base0  .s:bg_base03  .s:fmt_revbb
exe "hi! TabLine"        .s:fmt_none   .s:fg_base0  .s:bg_base02  .s:sp_base0
exe "hi! TabLineFill"    .s:fmt_none   .s:fg_base0  .s:bg_base02  .s:sp_base0
exe "hi! TabLineSel"     .s:fmt_none   .s:fg_base01 .s:bg_base2   .s:sp_base0  .s:fmt_revr
exe "hi! TabLineSep"     .s:fmt_none   .s:fg_base02 .s:bg_base01  .s:sp_base0  .s:fmt_revr
exe "hi! TabLineSep2"    .s:fmt_none   .s:fg_base02 .s:bg_base01  .s:sp_base0
exe "hi! CursorColumn"   .s:fmt_none   .s:fg_none   .s:bg_base02
exe "hi! CursorLine"     .s:fmt_uopt   .s:fg_none   .s:bg_base02  .s:sp_base1
exe "hi! CursorLineNr"   .s:fmt_uopt   .s:fg_none   .s:bg_base02  .s:sp_base1
exe "hi! ColorColumn"    .s:fmt_none   .s:fg_none   .s:bg_base02
exe "hi! Cursor"         .s:fmt_none   .s:fg_base03 .s:bg_base0
hi! link lCursor Cursor
exe "hi! MatchParen"     .s:fmt_bold   .s:fg_red    .s:bg_base01

"}}}

" vim syntax highlighting "{{{
" ---------------------------------------------------------------------
"exe "hi! vimLineComment" . s:fg_base01 .s:bg_none   .s:fmt_ital
"hi! link vimComment Comment
"hi! link vimLineComment Comment
hi! link vimVar Identifier
hi! link vimFunc Function
hi! link vimUserFunc Function
hi! link helpSpecial Special
hi! link vimSet Normal
hi! link vimSetEqual Normal
exe "hi! vimCommentString"  .s:fmt_none    .s:fg_violet .s:bg_none
exe "hi! vimCommand"        .s:fmt_none    .s:fg_yellow .s:bg_none
exe "hi! vimCmdSep"         .s:fmt_bold    .s:fg_blue   .s:bg_none
exe "hi! helpExample"       .s:fmt_none    .s:fg_base1  .s:bg_none
exe "hi! helpOption"        .s:fmt_none    .s:fg_cyan   .s:bg_none
exe "hi! helpNote"          .s:fmt_none    .s:fg_magenta.s:bg_none
exe "hi! helpVim"           .s:fmt_none    .s:fg_magenta.s:bg_none
exe "hi! helpHyperTextJump" .s:fmt_undr    .s:fg_blue   .s:bg_none
exe "hi! helpHyperTextEntry".s:fmt_none    .s:fg_green  .s:bg_none
exe "hi! vimIsCommand"      .s:fmt_none    .s:fg_base00 .s:bg_none
exe "hi! vimSynMtchOpt"     .s:fmt_none    .s:fg_yellow .s:bg_none
exe "hi! vimSynType"        .s:fmt_none    .s:fg_cyan   .s:bg_none
exe "hi! vimHiLink"         .s:fmt_none    .s:fg_blue   .s:bg_none
exe "hi! vimHiGroup"        .s:fmt_none    .s:fg_blue   .s:bg_none
exe "hi! vimGroup"          .s:fmt_undb    .s:fg_blue   .s:bg_none
"}}}

" diff highlighting "{{{
" ---------------------------------------------------------------------
hi! link diffAdded Statement
hi! link diffLine Identifier
"}}}

" git & gitcommit highlighting "{{{
"git
"exe "hi! gitDateHeader"
"exe "hi! gitIdentityHeader"
"exe "hi! gitIdentityKeyword"
"exe "hi! gitNotesHeader"
"exe "hi! gitReflogHeader"
"exe "hi! gitKeyword"
"exe "hi! gitIdentity"
"exe "hi! gitEmailDelimiter"
"exe "hi! gitEmail"
"exe "hi! gitDate"
"exe "hi! gitMode"
"exe "hi! gitHashAbbrev"
"exe "hi! gitHash"
"exe "hi! gitReflogMiddle"
"exe "hi! gitReference"
"exe "hi! gitStage"
"exe "hi! gitType"
"exe "hi! gitDiffAdded"
"exe "hi! gitDiffRemoved"
"gitcommit
"exe "hi! gitcommitSummary"
exe "hi! gitcommitComment"      .s:fmt_ital     .s:fg_base01    .s:bg_none
hi! link gitcommitUntracked gitcommitComment
hi! link gitcommitDiscarded gitcommitComment
hi! link gitcommitSelected  gitcommitComment
exe "hi! gitcommitUnmerged"     .s:fmt_bold     .s:fg_green     .s:bg_none
exe "hi! gitcommitOnBranch"     .s:fmt_bold     .s:fg_base01    .s:bg_none
exe "hi! gitcommitBranch"       .s:fmt_bold     .s:fg_magenta   .s:bg_none
hi! link gitcommitNoBranch gitcommitBranch
exe "hi! gitcommitDiscardedType".s:fmt_none     .s:fg_red       .s:bg_none
exe "hi! gitcommitSelectedType" .s:fmt_none     .s:fg_green     .s:bg_none
"exe "hi! gitcommitUnmergedType"
"exe "hi! gitcommitType"
"exe "hi! gitcommitNoChanges"
"exe "hi! gitcommitHeader"
exe "hi! gitcommitHeader"       .s:fmt_none     .s:fg_base01    .s:bg_none
exe "hi! gitcommitUntrackedFile".s:fmt_bold     .s:fg_cyan      .s:bg_none
exe "hi! gitcommitDiscardedFile".s:fmt_bold     .s:fg_red       .s:bg_none
exe "hi! gitcommitSelectedFile" .s:fmt_bold     .s:fg_green     .s:bg_none
exe "hi! gitcommitUnmergedFile" .s:fmt_bold     .s:fg_yellow    .s:bg_none
exe "hi! gitcommitFile"         .s:fmt_bold     .s:fg_base0     .s:bg_none
hi! link gitcommitDiscardedArrow gitcommitDiscardedFile
hi! link gitcommitSelectedArrow  gitcommitSelectedFile
hi! link gitcommitUnmergedArrow  gitcommitUnmergedFile
"exe "hi! gitcommitArrow"
"exe "hi! gitcommitOverflow"
"exe "hi! gitcommitBlank"
" }}}
"
" html highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! htmlTag"           .s:fmt_none .s:fg_base01 .s:bg_none
exe "hi! htmlEndTag"        .s:fmt_none .s:fg_base01 .s:bg_none
exe "hi! htmlTagN"          .s:fmt_bold .s:fg_base1  .s:bg_none
exe "hi! htmlTagName"       .s:fmt_bold .s:fg_blue   .s:bg_none
exe "hi! htmlSpecialTagName".s:fmt_ital .s:fg_blue   .s:bg_none
exe "hi! htmlArg"           .s:fmt_none .s:fg_base00 .s:bg_none
exe "hi! javaScript"        .s:fmt_none .s:fg_yellow .s:bg_none
"}}}

" perl highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! perlHereDoc"    . s:fg_base1  .s:bg_back   .s:fmt_none
exe "hi! perlVarPlain"   . s:fg_yellow .s:bg_back   .s:fmt_none
exe "hi! perlStatementFileDesc". s:fg_cyan.s:bg_back.s:fmt_none

"}}}

" tex highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! texStatement"   . s:fg_cyan   .s:bg_back   .s:fmt_none
exe "hi! texMathZoneX"   . s:fg_yellow .s:bg_back   .s:fmt_none
exe "hi! texMathMatcher" . s:fg_yellow .s:bg_back   .s:fmt_none
exe "hi! texMathMatcher" . s:fg_yellow .s:bg_back   .s:fmt_none
exe "hi! texRefLabel"    . s:fg_yellow .s:bg_back   .s:fmt_none
"}}}

" ruby highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! rubyDefine"     . s:fg_base1  .s:bg_back   .s:fmt_bold
"rubyInclude
"rubySharpBang
"rubyAccess
"rubyPredefinedVariable
"rubyBoolean
"rubyClassVariable
"rubyBeginEnd
"rubyRepeatModifier
"hi! link rubyArrayDelimiter    Special  " [ , , ]
"rubyCurlyBlock  { , , }

"hi! link rubyClass             Keyword
"hi! link rubyModule            Keyword
"hi! link rubyKeyword           Keyword
"hi! link rubyOperator          Operator
"hi! link rubyIdentifier        Identifier
"hi! link rubyInstanceVariable  Identifier
"hi! link rubyGlobalVariable    Identifier
"hi! link rubyClassVariable     Identifier
"hi! link rubyConstant          Type
"}}}

" haskell syntax highlighting"{{{
" ---------------------------------------------------------------------
" For use with syntax/haskell.vim : Haskell Syntax File
" http://www.vim.org/scripts/script.php?script_id=3034
" See also Steffen Siering's github repository:
" http://github.com/urso/dotrc/blob/master/vim/syntax/haskell.vim
" ---------------------------------------------------------------------
"
" Treat True and False specially, see the plugin referenced above
let hs_highlight_boolean=1
" highlight delims, see the plugin referenced above
let hs_highlight_delimiters=1

exe "hi! cPreCondit". s:fg_orange.s:bg_none   .s:fmt_none

exe "hi! VarId"    . s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! ConId"    . s:fg_yellow .s:bg_none   .s:fmt_none
exe "hi! hsImport" . s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! hsString" . s:fg_base00 .s:bg_none   .s:fmt_none

exe "hi! hsStructure"        . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hs_hlFunctionName"  . s:fg_blue   .s:bg_none
exe "hi! hsStatement"        . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hsImportLabel"      . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hs_OpFunctionName"  . s:fg_yellow .s:bg_none   .s:fmt_none
exe "hi! hs_DeclareFunction" . s:fg_orange .s:bg_none   .s:fmt_none
exe "hi! hsVarSym"           . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hsType"             . s:fg_yellow .s:bg_none   .s:fmt_none
exe "hi! hsTypedef"          . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hsModuleName"       . s:fg_green  .s:bg_none   .s:fmt_undr
exe "hi! hsModuleStartLabel" . s:fg_magenta.s:bg_none   .s:fmt_none
hi! link hsImportParams      Delimiter
hi! link hsDelimTypeExport   Delimiter
hi! link hsModuleStartLabel  hsStructure
hi! link hsModuleWhereLabel  hsModuleStartLabel

" following is for the haskell-conceal plugin
" the first two items don't have an impact, but better safe
exe "hi! hsNiceOperator"     . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hsniceoperator"     . s:fg_cyan   .s:bg_none   .s:fmt_none

"}}}

" pandoc markdown syntax highlighting "{{{
" ---------------------------------------------------------------------

"PandocHiLink pandocNormalBlock
exe "hi! pandocTitleBlock"               .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocTitleBlockTitle"          .s:fg_blue   .s:bg_none   .s:fmt_bold
exe "hi! pandocTitleComment"             .s:fg_blue   .s:bg_none   .s:fmt_bold
exe "hi! pandocComment"                  .s:fg_base01 .s:bg_none   .s:fmt_ital
exe "hi! pandocVerbatimBlock"            .s:fg_yellow .s:bg_none   .s:fmt_none
hi! link pandocVerbatimBlockDeep         pandocVerbatimBlock
hi! link pandocCodeBlock                 pandocVerbatimBlock
hi! link pandocCodeBlockDelim            pandocVerbatimBlock
exe "hi! pandocBlockQuote"               .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader1"        .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader2"        .s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader3"        .s:fg_yellow .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader4"        .s:fg_red    .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader5"        .s:fg_base0  .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader6"        .s:fg_base01 .s:bg_none   .s:fmt_none
exe "hi! pandocListMarker"               .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocListReference"            .s:fg_magenta.s:bg_none   .s:fmt_undr

" Definitions
" ---------------------------------------------------------------------
let s:fg_pdef = s:fg_violet
exe "hi! pandocDefinitionBlock"              .s:fg_pdef  .s:bg_none  .s:fmt_none
exe "hi! pandocDefinitionTerm"               .s:fg_pdef  .s:bg_none  .s:fmt_stnd
exe "hi! pandocDefinitionIndctr"             .s:fg_pdef  .s:bg_none  .s:fmt_bold
exe "hi! pandocEmphasisDefinition"           .s:fg_pdef  .s:bg_none  .s:fmt_ital
exe "hi! pandocEmphasisNestedDefinition"     .s:fg_pdef  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisDefinition"     .s:fg_pdef  .s:bg_none  .s:fmt_bold
exe "hi! pandocStrongEmphasisNestedDefinition"   .s:fg_pdef.s:bg_none.s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasisDefinition" .s:fg_pdef.s:bg_none.s:fmt_bldi
exe "hi! pandocStrikeoutDefinition"          .s:fg_pdef  .s:bg_none  .s:fmt_revr
exe "hi! pandocVerbatimInlineDefinition"     .s:fg_pdef  .s:bg_none  .s:fmt_none
exe "hi! pandocSuperscriptDefinition"        .s:fg_pdef  .s:bg_none  .s:fmt_none
exe "hi! pandocSubscriptDefinition"          .s:fg_pdef  .s:bg_none  .s:fmt_none

" Tables
" ---------------------------------------------------------------------
let s:fg_ptable = s:fg_blue
exe "hi! pandocTable"                        .s:fg_ptable.s:bg_none  .s:fmt_none
exe "hi! pandocTableStructure"               .s:fg_ptable.s:bg_none  .s:fmt_none
hi! link pandocTableStructureTop             pandocTableStructre
hi! link pandocTableStructureEnd             pandocTableStructre
exe "hi! pandocTableZebraLight"              .s:fg_ptable.s:bg_base03.s:fmt_none
exe "hi! pandocTableZebraDark"               .s:fg_ptable.s:bg_base02.s:fmt_none
exe "hi! pandocEmphasisTable"                .s:fg_ptable.s:bg_none  .s:fmt_ital
exe "hi! pandocEmphasisNestedTable"          .s:fg_ptable.s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisTable"          .s:fg_ptable.s:bg_none  .s:fmt_bold
exe "hi! pandocStrongEmphasisNestedTable"    .s:fg_ptable.s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasisTable"  .s:fg_ptable.s:bg_none  .s:fmt_bldi
exe "hi! pandocStrikeoutTable"               .s:fg_ptable.s:bg_none  .s:fmt_revr
exe "hi! pandocVerbatimInlineTable"          .s:fg_ptable.s:bg_none  .s:fmt_none
exe "hi! pandocSuperscriptTable"             .s:fg_ptable.s:bg_none  .s:fmt_none
exe "hi! pandocSubscriptTable"               .s:fg_ptable.s:bg_none  .s:fmt_none

" Headings
" ---------------------------------------------------------------------
let s:fg_phead = s:fg_orange
exe "hi! pandocHeading"                      .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocHeadingMarker"                .s:fg_yellow.s:bg_none.s:fmt_bold
exe "hi! pandocEmphasisHeading"              .s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocEmphasisNestedHeading"        .s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocStrongEmphasisHeading"        .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocStrongEmphasisNestedHeading"  .s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasisHeading".s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocStrikeoutHeading"             .s:fg_phead .s:bg_none.s:fmt_revr
exe "hi! pandocVerbatimInlineHeading"        .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocSuperscriptHeading"           .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocSubscriptHeading"             .s:fg_phead .s:bg_none.s:fmt_bold

" Links
" ---------------------------------------------------------------------
exe "hi! pandocLinkDelim"                .s:fg_base01 .s:bg_none   .s:fmt_none
exe "hi! pandocLinkLabel"                .s:fg_blue   .s:bg_none   .s:fmt_undr
exe "hi! pandocLinkText"                 .s:fg_blue   .s:bg_none   .s:fmt_undb
exe "hi! pandocLinkURL"                  .s:fg_base00 .s:bg_none   .s:fmt_undr
exe "hi! pandocLinkTitle"                .s:fg_base00 .s:bg_none   .s:fmt_undi
exe "hi! pandocLinkTitleDelim"           .s:fg_base01 .s:bg_none   .s:fmt_undi   .s:sp_base00
exe "hi! pandocLinkDefinition"           .s:fg_cyan   .s:bg_none   .s:fmt_undr   .s:sp_base00
exe "hi! pandocLinkDefinitionID"         .s:fg_blue   .s:bg_none   .s:fmt_bold
exe "hi! pandocImageCaption"             .s:fg_violet .s:bg_none   .s:fmt_undb
exe "hi! pandocFootnoteLink"             .s:fg_green  .s:bg_none   .s:fmt_undr
exe "hi! pandocFootnoteDefLink"          .s:fg_green  .s:bg_none   .s:fmt_bold
exe "hi! pandocFootnoteInline"           .s:fg_green  .s:bg_none   .s:fmt_undb
exe "hi! pandocFootnote"                 .s:fg_green  .s:bg_none   .s:fmt_none
exe "hi! pandocCitationDelim"            .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocCitation"                 .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocCitationID"               .s:fg_magenta.s:bg_none   .s:fmt_undr
exe "hi! pandocCitationRef"              .s:fg_magenta.s:bg_none   .s:fmt_none

" Main Styles
" ---------------------------------------------------------------------
exe "hi! pandocStyleDelim"               .s:fg_base01 .s:bg_none  .s:fmt_none
exe "hi! pandocEmphasis"                 .s:fg_base0  .s:bg_none  .s:fmt_ital
exe "hi! pandocEmphasisNested"           .s:fg_base0  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasis"           .s:fg_base0  .s:bg_none  .s:fmt_bold
exe "hi! pandocStrongEmphasisNested"     .s:fg_base0  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasis"   .s:fg_base0  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrikeout"                .s:fg_base01 .s:bg_none  .s:fmt_revr
exe "hi! pandocVerbatimInline"           .s:fg_yellow .s:bg_none  .s:fmt_none
exe "hi! pandocSuperscript"              .s:fg_violet .s:bg_none  .s:fmt_none
exe "hi! pandocSubscript"                .s:fg_violet .s:bg_none  .s:fmt_none

exe "hi! pandocRule"                     .s:fg_blue   .s:bg_none  .s:fmt_bold
exe "hi! pandocRuleLine"                 .s:fg_blue   .s:bg_none  .s:fmt_bold
exe "hi! pandocEscapePair"               .s:fg_red    .s:bg_none  .s:fmt_bold
exe "hi! pandocCitationRef"              .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocNonBreakingSpace"         . s:fg_red   .s:bg_none  .s:fmt_revr
hi! link pandocEscapedCharacter          pandocEscapePair
hi! link pandocLineBreak                 pandocEscapePair

" Embedded Code
" ---------------------------------------------------------------------
exe "hi! pandocMetadataDelim"            .s:fg_base01 .s:bg_none   .s:fmt_none
exe "hi! pandocMetadata"                 .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocMetadataKey"              .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocMetadata"                 .s:fg_blue   .s:bg_none   .s:fmt_bold
hi! link pandocMetadataTitle             pandocMetadata

"}}}

" neomake highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! NeomakeErrorSign"          . s:fg_orange   .s:bg_none   .s:fmt_none
exe "hi! NeomakeWarningSign"        . s:fg_yellow   .s:bg_none   .s:fmt_none
exe "hi! NeomakeMessageSign"        . s:fg_cyan     .s:bg_none   .s:fmt_none
exe "hi! NeomakeNeomakeInfoSign"    . s:fg_green    .s:bg_none   .s:fmt_none

"}}}

" gitgutter highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! GitGutterAdd"              . s:fg_green    .s:bg_none  .s:fmt_none
exe "hi! GitGutterChange"           . s:fg_yellow   .s:bg_none  .s:fmt_none
exe "hi! GitGutterDelete"           . s:fg_red      .s:bg_none  .s:fmt_none
exe "hi! GitGutterChangeDelete"     . s:fg_red      .s:bg_none  .s:fmt_none
" }}}"

" signify highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! SignifySignAdd"            . s:fg_green    .s:bg_none  .s:fmt_none
exe "hi! SignifySignChange"         . s:fg_yellow   .s:bg_none  .s:fmt_none
exe "hi! SignifySignDelete"         . s:fg_red      .s:bg_none  .s:fmt_none
exe "hi! SignifySignChangeDelete"   . s:fg_red      .s:bg_none  .s:fmt_none
" }}}"

" ALE highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! ALEErrorSign"          . s:fg_orange   .s:bg_none   .s:fmt_none
exe "hi! ALEWarningSign"        . s:fg_yellow   .s:bg_none   .s:fmt_none
" }}}"

" NeoVim terminal buffer colours "{{{
" ---------------------------------------------------------------------
let g:terminal_color_0 = s:gui_base03
let g:terminal_color_1 = s:gui_red
let g:terminal_color_2 = s:gui_green
let g:terminal_color_3 = s:gui_yellow
let g:terminal_color_4 = s:gui_blue
let g:terminal_color_5 = s:gui_magenta
let g:terminal_color_6 = s:gui_cyan
let g:terminal_color_7 = s:gui_base2

if g:neosolarized_termBoldAsBright == 1
  let g:terminal_color_8 = s:gui_base02
  let g:terminal_color_9 = s:gui_orange
  let g:terminal_color_10 = s:gui_base01
  let g:terminal_color_11 = s:gui_base00
  let g:terminal_color_12 = s:gui_base0
  let g:terminal_color_13 = s:gui_violet
  let g:terminal_color_14 = s:gui_base1
  let g:terminal_color_15 = s:gui_base3
else
  let g:terminal_color_8 = g:terminal_color_0
  let g:terminal_color_9 = g:terminal_color_1
  let g:terminal_color_10 = g:terminal_color_2
  let g:terminal_color_11 = g:terminal_color_3
  let g:terminal_color_12 = g:terminal_color_4
  let g:terminal_color_13 = g:terminal_color_5
  let g:terminal_color_14 = g:terminal_color_6
  let g:terminal_color_15 = g:terminal_color_7
endif
"}}}

" Utility autocommand "{{{
" ---------------------------------------------------------------------
" In cases where Solarized is initialized inside a terminal vim session and
" then transferred to a gui session via the command `:gui`, the gui vim process
" does not re-read the colorscheme (or .vimrc for that matter) so any `has_gui`
" related code that sets gui specific values isn't executed.
"
" Currently, Solarized sets only the cterm or gui values for the colorscheme
" depending on gui or terminal mode. It's possible that, if the following
" autocommand method is deemed excessively poor form, that approach will be
" used again and the autocommand below will be dropped.
"
" However it seems relatively benign in this case to include the autocommand
" here. It fires only in cases where vim is transferring from terminal to gui
" mode (detected with the script scope s:vmode variable). It also allows for
" other potential terminal customizations that might make gui mode suboptimal.
"
autocmd GUIEnter * if (has('gui_running')) | exe "colorscheme " . g:colors_name | endif
"}}}

" License "{{{
" ---------------------------------------------------------------------
"
" Copyright (c) 2011 Ethan Schoonover
" Copyright (c) 2016 iCyMind
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
"
" vim: set foldmethod=marker foldlevel=0:
"}}}
