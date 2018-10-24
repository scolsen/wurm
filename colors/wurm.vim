" Determine the terminal background.
" Initialize a colors dictionary.
let s:active_bg=(&background)
let s:colors = {}

let g:colors_name = "wurm"

" Color definitions.
" 'apache' is 'indianred1'
let s:colors.navajo      = ['#ffdfaf', 223]
let s:colors.grey        = ['#949494', 246]
let s:colors.salmon      = ['#ff875f', 209]
let s:colors.apache      = ['#ff5f5f', 203]
let s:colors.orchid      = ['#af5faf', 133]
let s:colors.lightorchid = ['#ffafff',219]
let s:colors.darkgrey    = ['#282828', 235]
let s:colors.densegrey   = ['#1c1c1c', 234]
let s:colors.deepgrey    = ['#121212', 233]
let s:colors.purple      = ['#af00ff', 129]
let s:colors.lightpink   = ['#ffafaf', 217]
let s:colors.darkred     = ['#af0000', 124]
let s:colors.darkmagenta = ['#87005f', 90]
let s:colors.skyblue     = ['#87afff', 111]

" Highlighting function
" Cribbed from badwolf, guvbox.
function! s:highlight(target, fg, ...)
  " ... = bg, style.
  let histring = 'hi ' . a:target . ' '
  let fcolor = get(s:colors, a:fg)
 
  if strlen(a:fg)
    let histring .= 'guifg=' . fcolor[0] . ' ctermfg=' . fcolor[1] . ' '
  end
  
  if a:0 >= 1 && strlen(a:1)
    let bcolor = get(s:colors, a:1)
    let histring .= 'guibg=' . bcolor[0] . ' ctermbg=' . bcolor[1] . ' '
  endif 
  if a:0 >= 2 && strlen(a:2)
    let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
  endif

  exe histring
endfunction

" TODO: Complete dark implementation.
function! s:setDark()
  " Base colors.
  call s:highlight('Normal', 'navajo', 'darkgrey')
  call s:highlight('NonText', 'orchid')
  call s:highlight('comment', 'grey')
  call s:highlight('constant', 'orchid')
  call s:highlight('string', 'grey')
  call s:highlight('identifier', 'navajo', 'darkgrey', 'bold')
  call s:highlight('statement', 'lightpink')
  call s:highlight('define', 'apache')
  call s:highlight('preproc', 'skyblue') 
  call s:highlight('type', 'lightorchid')
  call s:highlight('special', 'apache')
  call s:highlight('Underlined', '')
  call s:highlight('label', 'lightorchid')
  call s:highlight('operator', 'lightpink')
  call s:highlight('delimiter', 'navajo')
  
  " Inline notifications. 
  call s:highlight('Todo', 'orchid', 'darkgrey', 'bold')
  call s:highlight('Search', 'orchid', 'navajo', 'bold')
  call s:highlight('IncSearch', '')
  call s:highlight('title', '')
 
  " Cursor
  call s:highlight('Cursor', 'darkmagenta', 'orchid')
  
  " Status line
  call s:highlight('StatusLine', 'navajo', 'deepgrey')
  call s:highlight('StatusLineNC', 'navajo', 'deepgrey')
  
  " Windows
  call s:highlight('VertSplit', 'deepgrey', 'deepgrey')

  " Diff 
  call s:highlight('DiffChange', '')
  call s:highlight('DiffText', '')
  call s:highlight('DiffAdd', '')
  call s:highlight('DiffDelete', '')

  " Folds
  call s:highlight('Folded', '')
  call s:highlight('FoldColumn', '')
  
  " Visual
  call s:highlight('Visual', 'salmon', 'orchid')
  
  " Command window
  call s:highlight('ErrorMsg', 'apache', 'darkgrey', 'bold')
  call s:highlight('WarningMsg', 'salmon')
  call s:highlight('ModeMsg', 'lightorchid')
  call s:highlight('MoreMsg', 'skyblue')
  call s:highlight('Error', '')

  " Spelling
  call s:highlight('SpellLocal', '', '', 'italic')
  call s:highlight('SpellBad', '', 'darkgrey', 'underline')
  call s:highlight('SpellCap', '', 'darkgrey', 'underline')

  " Line gutter
  call s:highlight('LineNr', 'orchid', 'darkgrey')
  call s:highlight('SignColumn', '', 'densegrey')
endfunction

" TODO: Implement light theme.
function! s:setLight()
  " Base colors.
  call s:highlight('Normal', 'darkgrey', 'navajo')
  call s:highlight('NonText', 'darkgrey')
  call s:highlight('comment', 'grey')
  call s:highlight('constant', 'orchid')
  call s:highlight('string', 'grey')
  call s:highlight('identifier', 'darkgrey')
  call s:highlight('statement', 'darkgrey')
  call s:highlight('define', 'darkgrey')
  call s:highlight('preproc', 'darkgrey')
  call s:highlight('type', 'darkgrey')
  call s:highlight('special', 'darkgrey')
  call s:highlight('Underlined', 'darkgrey')
  call s:highlight('label', 'darkgrey')
  call s:highlight('operator', 'orchid')
  call s:highlight('delimiter', 'darkgrey')
  
  " Inline notifications. 
  call s:highlight('Todo', 'darkgrey')
  call s:highlight('Cursor', 'darkgrey')
  call s:highlight('Search', 'salmon')
  call s:highlight('IncSearch', 'darkgrey')
  call s:highlight('LineNr', 'darkgrey')
  call s:highlight('title', 'darkgrey')
  
  " Status line
  call s:highlight('StatusLine', 'navajo', 'deepgrey')
  call s:highlight('StatusLineNC', 'darkgrey')
  
  " Windows
  call s:highlight('VertSplit', 'darkgrey')

  " Diff 
  call s:highlight('DiffChange', 'darkgrey')
  call s:highlight('DiffText', 'darkgrey')
  call s:highlight('DiffAdd', 'darkgrey')
  call s:highlight('DiffDelete', 'darkgrey')

  " Folds
  call s:highlight('Folded', 'darkgrey')
  call s:highlight('FoldColumn', 'darkgrey')
  
  " Visual
  call s:highlight('Visual', 'darkgrey')
  
  " Command window
  call s:highlight('ErrorMsg', 'darkgrey')
  call s:highlight('WarningMsg', 'darkgrey')
  call s:highlight('ModeMsg', 'darkgrey')
  call s:highlight('MoreMsg', 'darkgrey')
  call s:highlight('Error', 'darkgrey')
endfunction

" Set base colors.
if s:active_bg == 'dark'
  call s:setDark()
else
  call s:setLight()
endif

