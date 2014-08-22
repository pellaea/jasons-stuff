"################################################################################
"#
"#   General vim settings and options.
"#
"################################################################################

":if &term == "screen"
":  set t_kb=
":endif
set t_kb=

"set compatible             |" Start by making everything vi-compatible.

" Something about not restoring screen when it exits...
" Doesn't do in screen anyway, so don't worry about it.
set t_ti=
set t_te=

" Normal mode options.
set notildeop               |" Do NOT make ~ into a normal vi command.
set nojoinspaces            |" Tells J not to put extra spaces after periods.
set undolevels=100          |" Can undo up to 100 commands(!)

" Insert mode options.
"set digraph                |" Allows the "^V blah" thing in insert mode... wait...
set nodigraph               |" Hmm... don't allow f-ed up overstrike shit.
set esckeys                 |" Allow arrows etc in insert mode.

" Command line options.
set ruler                   |" Prints x,y coords in bottom right.
set showcmd                 |" Show last command on bottom line.
set showmode                |" Show editing mode on bottom line.
set shortmess=aIoO          |" Shorten info messages to prevent pauses.
set more                    |" Pauses if print-out (eg from :g//p) too long.
set history=100             |" Keep undo history of 100 commands.
set wildchar=<tab>          |" Use tab completion on command line.
set wildmode=longest        |" Tcsh-style completion. (Complete till ambguity.)

" Display and movement options.
set nowrap                  |" Do NOT wrap lines too wide for screen.
set scroll=12               |" Scroll 12 lines at a time for ^U and ^D.
set scrolljump=1            |" Scroll 1 line at a time when cursor hits top/bottom.
"set scrolloff=3             |" Always keep 3 line margin at top/bottom of screen.
set sidescroll=10           |" Scroll 10 colums at a time when cursor hits sides.
set sidescrolloff=0         |" Don't keep any buffer to left/right of cursor.
set nostartofline           |" Leave cursor at same column when jumping around.
set whichwrap=""            |" Don't let backspace wrap.
set mousehide               |" Hides mouse while typing.
set nottyfast               |" Don't bother updating screen religiously.
set nohlsearch              |" Don't highlight search matches.
set noincsearch             |" Don't start search till I say so, dammit!
set lz                      |" Don't redraw screen while running macros.
set mps+=<:>                |" Tell % to match angle brackets, too.

" Indentation and formatting options.
set expandtab               |" Write spaces when inserting tabs.
set tabstop=2               |" Set tab stops to every 2 characters.
set shiftwidth=2            |" Set indentation width to 2 characters (affects > commands).
set noautoindent            |" I hate auto-indentation!
set indentexpr=""           |" I hate auto-indentation!
set nosmartindent           |" I hate auto-indentation!
set comments=""             |" I hate auto-commentation!
set fileformats=unix,dos    |" I hate auto-format detection!
set textwidth=0             |" I hate auto-wrapping!
syntax off                  |" I hate syntax highlighting!
filetype off                |" I hate vim overwriting my macros!
filetype plugin off         |" I hate vim overwriting my macros!

" Shelling and spelling options.
set shell=tcsh              |" Use tcsh when shelling out.
set equalprg=speller        |" Use 'speller' for = commands.
set formatprg=speller       |" Use 'speller' for Q command.
set keywordprg=spellx       |" Use 'spellx' for K command.

" Macro options.
set modeline                |" Allows you to set options in top line of files.
set remap                   |" Allows macros to be recursive.
set notimeout               |" Do not timeout while typing macros.
set ttimeout                |" Turn the following timeout on:
set ttimeoutlen=10          |" Allow only 0.01 second wait for arrow keys, etc.

" Other stuff.
set nobackup                |" Do not make a permanent backup file.
set viminfo=""              |" Do not muck around with .viminfo file.
set ei=all                  |" Don't change options when I switch files, dammit!

" I hate the stupid :Sexplore command!
" map :S :s
cmap S/ s/

"################################################################################
"#
"#   Random commands.
"#
"#   -                      Run macro in buffer "q".
"#   +                      Run last macro again.
"#   ^8 / ^?                Write file, go to next.
"#   ^7 / ^_                Run macro "q", write file, go to next.
"#
"#   Y                      Yank to end of line.  (Ex option doesn't work.)
"#   ^T                     Transpose characters a la emacs.
"#   ^P                     Turn Perl comment into a C comment.
"#
"#   ^2 / ^~
"#   ^3 / ^[
"#   ^4
"#   ^5 / ^]
"#   ^6
"#   ^7 / ^_                Sum up (box) selected numbers.
"#   ^8 / ^?
"#
"################################################################################

map Q       
map -       @q
map +       @@
map       :w
map       @q:w

map Y       y$
map       Xp
map       :s/^##/\/*/

map OP    
map! OP   

map       ympGopVG!sum 1

"################################################################################
"#
"#   Macros starting with a backslash.
"#
"#   \e  \s                 Remove trailing whitespace from e) end of file, s) end of every line.
"#   \ts4  \ts8             Set tab stop to 4 or 8.
"#   \<num>                 Set screen width -- used by paragraph command \jj.
"#   \>  \"  \#  \*  \d     Comment out a block of lines.  (The last one undoes the other 4.)
"#   \p  \P                 Insert 'printf("DEBUG: 1...\n")' line before/after cursor.
"#   \o                     Remove "DEBUG" lines created above.
"#   \xx                    Insert signature.
"#   \zs  \zz  \zx          Check spelling of a block: start, next, end.
"#   \yymm  \yyx            Convert first column from YYX to YYMM (or vice versa).
"#   \qq  \ww               Search backward / forward for word under cursor.
"#   \wq  \qw               Search backward / forward for highlighted text.
"#   \kk                    Reset the damned auto-wrapping flag.
"#   \cc                    Run selected lines through calc, replace with output.
"#   \!!                    Run selected lines in shell, replace with output.
"#
"################################################################################

map \e      _EOF
map \s      mm:%s/[ 	]\+$//g

map \ts2    :set ts=2
map \ts4    :set ts=4
map \ts8    :set ts=8

map \40     \jz 39l
map \45     \jz 44l
map \50     \jz 49l
map \55     \jz 54l
map \60     \jz 59l
map \65     \jz 64l
map \70     \jz 69l
map \75     \jz 74l
map \80     \jz 79l
map \90     \jz 89l
map \100    \jz 99l
map \110    \jz 109l
map \120    \jz 119l
map \130    \jz 129l
map \140    \jz 139l

map \.      :s/^/> /
map \'      :s/^/" /
map \3      :s/^/# /
map \*      :s/^/\/* /
map \d      :s/^\([>"#]\\|\/\*\) //

map \p      oprintf("DEBUG: 0...\n"); "Px"ppFp"pY0D"pp0f(f"l0"pY
map \P      Oprintf("DEBUG: 0...\n"); "Px"ppFp"pY0D"pp0f(f"l0"pY
map \o      :%g/^printf("DEBUG/d

map \xx     maGo:r /home/jason/.sig

map \zs     "adma"aPV'ak!speller
map \zz     'sjms*lh
map \zx     's{jV}dz.

map \yymm   \_yymm1\_yymm2\_yymm3\_yymm4
map \_yymm1 :%s/^\([0-9][0-9]\)a /\110
map \_yymm2 :%s/^\([0-9][0-9]\)b /\111
map \_yymm3 :%s/^\([0-9][0-9]\)c /\112
map \_yymm4 :%s/^\([0-9][0-9]\)\([0-9]\) /\10\2

map \yyx    \_yyx1\_yyx2\_yyx3\_yyx4
map \_yyx1  :%s/^\([0-9][0-9]\)10 /\1a 
map \_yyx2  :%s/^\([0-9][0-9]\)11 /\1b 
map \_yyx3  :%s/^\([0-9][0-9]\)12 /\1c 
map \_yyx4  :%s/^\([0-9][0-9]\)0\([0-9]\) /\1\2 

map \qq     ebi?lea
map \ww     ebi/\(^\\|[^A-Za-z_]\)lea\([^A-Za-z_]\\|$\)
map \qw     "ayi
map \wq     "ayi

map \kk     :set tw=0

map \cc     mmomn:s/^/calc 
map \!!     mmomn:w! ~/tmp/.tmp

"################################################################################
"#
"#   Macros for editing multiple files.
"#
"#   ^OP ^KK ^OO    Switch to last / previous / next file.
"#   ^OA ^OX        Switch to first / last file.
"#   ^O?            Print which files are open.
"#
"#   ]s             Save file.
"#   ]e ]d          Open new file / close old file.
"#   ]q ]w          Open file under cursor in new window. (]w requires save)
"#   ]t ]v          Open tags file / .vimrc file.
"#   [[ ]]          Switch to previous / next file.
"#   ]<num>         Switch to file number <num>.
"#   ]?             Print which files are open.
"#
"################################################################################

"map     :e#
"map     :n
"map     :N
"map     :rewind
"map     :last
"map     :args

map ]s      :w
map ]d      :bdelete!
map ]e      no:e |
map ]q      ]_wun@a
map ]w      ]_wuno@a
map ]_w     ?\(^\\|[^A-Za-z0-9_\.\-\/]\)
map ]t      lb"myenoa:tag! "mpA
map ]v      no:e ~/.vimrc
map ]/      :buffers
map [[      :bN
map ]]      :bn
map ]1      :b1
map ]2      :b2
map ]3      :b3
map ]4      :b4
map ]5      :b5
map ]6      :b6
map ]7      :b7
map ]8      :b8
map ]9      :b9
map ]0      :b10

"################################################################################
"#
"#   Formatting macros.
"#
"#   =# == =- =% =*     Insert a line of #, =, etc.
"#   ## #= #- #x        Center text in a line of #, =, etc.
"#   #C #< #>           Center/left/right-justify text.
"#   #R                 Insert blank line above and below current line.
"#   =x                 Unmap the =* macros to allow single-key = macro.
"#
"################################################################################

map =3      _New80a#_Room
map =5      _New80a%_Room
map =8      _New80a%_Room
map ==      _New80a=_Room
map =-      _New80a-_Room
"map =x     "mxP_New80"mp_Room
map =x      :unmap =3

map ##      _Room_Trim_Centera#x_Fill
map #=      _Room_Trim_Centera=x_Fill
map #-      _Room_Trim_Centera-x_Fill
map #x      _Room_Trim_Centerx_Fill

map #C      _Center
map #<      _Left
map #>      _Right
map #R      _Room

map _Left   :le
map _Right  :ri
map _Center :ce
map _Front  I :s/^ \+//
map _Back   A :s/ \+$//
map _Trim   _Front_Back
map _EOF    G?[^ ]
map _Room   mmk:.,.g/^ *$/d
map _New    Ommj:.,.g/^ *$/d
map _Fill   O80pyypj^hhkC  JA  klDjpkdd

"################################################################################
"#
"#   Paragraph justification macros.
"#
"#   \jj             Reformat current pargraph to the set width.
"#   \jz<num>        Reset the width used above.
"#   \vv             Just shift-V select the current paragraph.
"#   \nn             Run current paragraph through ../check_notes.prl
"#   \pp             Run current paragraph through spell
"#   \px             Remove list of spelling errors.
"#   \hh             Reformat paragraph-in-a-line under cursor.
"#   \kk             Reformat key under cursor.
"#
"################################################################################

"map \_jj1   ?^#*[ 	]*$
"map \_jj2   /^#*[ 	]*$

map \jj     \_jj1\_jj2\_jj3\_jj4\_jj5\_jj6
map \_jj1   mm1GO'm?^[ 	]*#*[ 	]*$
map \_jj2   mnGo'n/^[ 	]*#*[ 	]*$
map \_jj3   :s/^[ 	]*#*[ 	]*//
map \_jj4   Ax- 0:s/\([A-Za-z]-\) /\1/g
map \_jj5   A. A0:s/\([\!\.\?])\=\) \([("'A-Z]\)/\1  \2/g
map \_jj6   0"aP0x\_jjxf h?\([^ ] \\|^\)

map \jz     :map \_jjx |
map \_jjx   79l

map \vv     \_jj1\_jj2
map \nn     \_jj1\_jj2!check_notes.prl
map \kk     \_jj1\_jj2!reformat_key.prl
map \pp     \_jj1\_jj2yP'njmnkV'm:s/^[ 	]*#*[    ]*//
map \px     'nO&V?^[^&]
map \hh     0f 1s

"################################################################################
"#
"#   C-style to trailing if-block conversions.
"#
"#   \if    Convert trailing to C-style.  (Accepts block selection.)
"#   \fi    Convert C-style to trailing.  (Leaves multi-line block selected.)
"#
"################################################################################

map \if     mambomb'ak$/  *if[ (]
map \fi     $?^ *if

"################################################################################
"#
"#   Comment-boxing macros.
"#
"#   \c- \c= \c# \c*     Turn the current pargraph into a Perl box comment.
"#   \x- \x= \x# \x*     Turn the current pargraph into a Perl line comment.
"#   \cc- \cc= \cc# \cc* Turn the current pargraph into a C box comment.
"#   \xx- \xx= \xx# \xx* Turn the current pargraph into a C line comment.
"#   \c*                 Turn a Perl comment into C comment. (sorta)
"#   \cd                 Undo the \c<blah> macros.
"#   \cz<num>            Set the minimum box width.
"#
"################################################################################

map \c-     {jma}kmb\_c3'aV'b:s/^/#  /
map \c=     {jma}kmb\_c3'aV'b:s/^/#  /
map \c3     {jma}kmb\_c3'aV'b:s/^/#  /
map \c8     {jma}kmb\_c3'aV'b:s/^/#  /
map \x-     A-"aD\_x02s# 0
map \x=     A="aD\_x02s# 0
map \x3     A#"aD\_x0
map \x8     A*"aD\_x02s# 0

" map \cc-    {jma}kmb\_c3'aV'b:s/^/\/*  /
" map \cc=    {jma}kmb\_c3'aV'b:s/^/\/*  /
" map \cc3    {jma}kmb\_c3'aV'b:s/^/\/*  /
" map \cc8    {jma}kmb\_c3'aV'b:s/^/\/*  /
" map \xx-    A-"aD\_x03s/* $hhC */0
" map \xx=    A="aD\_x03s/* $hhC */0
" map \xx3    A#"aD\_x03s/* $hhC */0
" map \xx8    A*"aD\_x01s/$C/0

map \c8     0?---

map \cd     {jddma}kddkmb'aV'b:s/^ *\(#\\|\/\*\)//
map \cz     :map \_c5 

map \_c1    'ao\_c5a#kAjDk$pXjddk
map \_c2    'b$/[^ ]
map \_c3    'bozxcv'a
map \_c4    'aV'b:s/^ //
map \_x     A 120ay81\|D?[^y]

map \_c5    30

"################################################################################
"#
"#   Source any local .vimrc file.
"#
"################################################################################

if filereadable(".vimrc") && $PWD != "/home/$USER"
  source .vimrc
endif