"关闭vi兼容模式
set nocompatible

"不模拟windows按键和鼠标行为
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

"unmap <C-F>

"编码设置
set encoding=utf-8
if has("win32")
  set fileencoding=cp936
  set fileencodings=utf-8,cp936,latin-1
  "language messages zh_CN.cp936
else
  set fileencoding=utf-8
  set fileencodings=utf-8,cp936,latin-1
  "language messages zh_CN.utf-8
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

"undo文件
set undofile
set undodir=/home/jw/.vim/undodir

"高亮显示匹配
set hlsearch


"设置文件类型
set fileformats=unix,dos,mac

"打开文件类型判断
filetype on
filetype plugin on

"鼠标支持
set mouse=a


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

"设置输入时显示匹配括号
set showmatch

"如果文件在外部被修改则自动读入
if exists("&autoread")
  set autoread
endif

"设置不自动折行
set nowrap

"高亮当前行
set cursorline

"设置光标
au InsertLeave * hi Cursor guibg=yellow
au InsertEnter * hi Cursor guibg=green

"设置行号
set number relativenumber


"设置80列提示
highlight ColorColumn guibg=Black
set colorcolumn=80

"设置光标上下保留的行数
set scrolloff=2

"总是显示状态行
set laststatus=2
"状态行显示内容
"set statusline=%f\ [TYPE=%Y]\ [FORMAT=%{&ff}]\ [%{&fileencoding}]\ [LEN=%L]%h%m%r%=%-14.(%l,%c%V%)\ %P

"设置字体
"guifont=YaHei Consolas Hybrid 14
"set guifont=DejaVu_Sans_Mono:h12:cANSI:qDRAFT
set guifont=DejaVu\ Sans\ Mono\ 13

set background=dark    " Setting dark mode

"设置配色方案
"colorscheme desert

"设置mapleader
let mapleader = ","
let g:mapleader = ","


set ts=4
set sw=4
autocmd FileType * set tabstop=4|set shiftwidth=4|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType sql set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType dart set tabstop=2|set shiftwidth=2|set expandtab

"普通模式和插入模式光标颜色设置
au InsertLeave * hi Cursor guibg=yellow
au InsertEnter * hi Cursor guibg=green

"插件安装
call plug#begin('~/.vim/plugged')
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'Yggdroot/LeaderF'
Plug 'Valloric/YouCompleteMe'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
call plug#end()

autocmd vimenter * colorscheme gruvbox

"let g:airline_theme='gruvbox'
let g:airline_theme='papercolor'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nmap <silent> <leader>b1 :b1<cr>
nmap <silent> <leader>b2 :b2<cr>
nmap <silent> <leader>b3 :b3<cr>
nmap <silent> <leader>b4 :b4<cr>
nmap <silent> <leader>b5 :b5<cr>
nmap <silent> <leader>b6 :b6<cr>
nmap <silent> <leader>b7 :b7<cr>
nmap <silent> <leader>b8 :b8<cr>
nmap <silent> <leader>b9 :b9<cr>

let g:lsc_auto_map = v:true

"LeaderF配置 "
"let g:Lf_WindowPosition = 'popup'
"let g:Lf_PreviewInPopup = 1
"nmap <silent> <leader>ff :Leaderf file<cr>
"nmap <silent> <leader>fb :Leaderf buffer<cr>

"快捷键设置
nmap <silent> <leader>t :term<cr>

""""""""""""""""""""""""""""""
" netrw setting
""""""""""""""""""""""""""""""
let g:netrw_winsize = 30
"垂直打开文件浏览
nmap <silent> <leader>fe :Sexplore!<cr>

" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WorkingDirectoryMode = 'Ac'
" popup mode
"let g:Lf_WindowPosition = 'popup'
"let g:Lf_PreviewInPopup = 1
"let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
"let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

"noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
"noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
"xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
"noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>


let g:ycm_language_server = [
  \   {
  \     'name': 'dart',
  \     'cmdline': ['dart', '/home/jw/development/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot', '--lsp'],
  \     'filetypes': [ 'dart' ],
  \   },
  \ ]


