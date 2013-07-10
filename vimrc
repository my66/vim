set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"先设置菜单显示为UTF-8
"set encoding=utf-8
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

"编码设置
if has("win32")
  set fileencoding=cp936
  set fileencodings=utf-8,cp936,latin-1
  language messages zh_CN.cp936
else
  set fileencoding=utf-8
  set fileencodings=utf-8,cp936,latin-1
  language messages zh_CN.utf-8
endif

function! MySys()
  if has("win32")
    return "win32"
  elseif has("unix")
    return "unix"
  else
    return "mac"
  endif
endfunction

"不备份文件
set nobackup

"高亮显示匹配
set hlsearch

"设置文件类型
set fileformats=dos,unix,mac

"打开文件类型判断
filetype on
filetype plugin on

"鼠标支持
set mouse=a

"设置mapleader
let mapleader = ","
let g:mapleader = ","

"设置历史记录数
set history=1000

"打开语法高亮
syntax on

"显示中文帮助
set helplang=cn

"去除菜单栏
if has("gui_running")
  "set guioptions -=m
  set guioptions -=T
  "去除滚动条
  "set guioptions-=lrb
endif

"设置TAB用2个空格
"set tabstop=2
"set shiftwidth=2
"set softtabstop=2
"set expandtab

"设置输入时显示匹配括号
set showmatch


"如果文件在外部被修改则自动读入
if exists("&autoread")
  set autoread
endif

"高亮当前行
set cursorline

"设置光标上下保留的行数
set scrolloff=2

"让制表符可见
"set list
"设置制表符显示样式
"set listchars=tab:>-,trail:-

"总是显示状态行
set laststatus=2
"状态行显示内容
set statusline=%f\ [TYPE=%Y]\ [FORMAT=%{&ff}]\ [%{&fileencoding}]%h%m%r%=%-14.(%l,%c%V%)\ %P

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
if MySys() == "win32"                "设定windows系统中ctags程序的位置
  let Tlist_Ctags_Cmd = 'ctags.exe'
elseif MySys() == "unix"              "设定linux系统中ctags程序的位置
  let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
"不回显运行
nmap <silent> <leader>tl :TlistToggle<cr>

""""""""""""""""""""""""""""""
" netrw setting
""""""""""""""""""""""""""""""
let g:netrw_winsize = 30
"垂直打开文件浏览
nmap <silent> <leader>fe :Sexplore!<cr>

""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
nmap <silent> <leader>bf :BufExplorer<cr>

""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
let g:bufExplorerMaxHeight=13
nmap <A-1> :FirstExplorerWindow<cr>
nmap <A-2> :BottomExplorerWindow<cr>
nmap <A-3> <C-w><C-b>
nmap <silent> <leader>wm :WMToggle<cr>

"保存当前session
nmap <silent> <leader>ms :mksession! mysession.vim<cr>:wviminfo! mysession.viminfo<cr>
"提取当前session
nmap <silent> <leader>ss :source mysession.vim<cr>:rviminfo! mysession.viminfo<cr>
"添加保存窗口大小
set sessionoptions+=resize

"设置字体
"guifont=YaHei Consolas Hybrid 14
set guifont=YaHei\ Consolas\ Hybrid\ 14

highlight ColorColumn guibg=Black
"highlight ColorColumn ctermbg=7
set colorcolumn=80
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4 
"设置配色方案
colorscheme desert

set ts=4
set sw=4
autocmd FileType * set tabstop=4|set shiftwidth=4|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType sql set tabstop=4|set shiftwidth=4|set expandtab

"let g:calendar_diary="d:/work/daily"

