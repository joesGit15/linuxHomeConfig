" An example for a vimrc file.
"
" Maintainer:    Bram Moolenaar <Bram@vim.org>
" Last change:    2016 Jul 28
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"          for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"        for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup        " do not keep a backup file, use versions instead
else
"  set backup        " keep a backup file (restore to previous version)
"  if has('persistent_undo')
"    set undofile    " keep an undo file (undo changes after closing)
"  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " joe auto convert tab to space , "
  " autocmd BufRead *.cpp,*.h :ret 

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

"------------------------------------- user customsize

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
  set selection=exclusive "方便使用鼠标
  set selectmode=mouse,key "
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start "设置 回退键,正常处理indent eol start

set history=50        " keep 50 lines of command line history
set ruler        " show the cursor position all the time
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)    "设置状态栏显示当前鼠标位置信息的格式
set showcmd        " display incomplete commands
set incsearch        " do incremental searching

set nu
set relativenumber

set clipboard+=unnamed

set linespace=0 "字符间插入的像素数目 ??? 不懂
set wildmenu    "增强模式中的命令行自动补全功能
set cmdheight=1 "命令行在状态栏下的高度,默认为1
set whichwrap+=<,>,h,l "允许退格键和光标键跨越行边界
set report=0 "通过使用命令:commands 告诉文件的哪一行被修改了 ??

set nowrap

" set the encodeing "
set fileencodings=utf-8,ucs-bom,gbk,gbk2312
set termencoding=utf-8
set encoding=utf-8

set tabstop=4
set softtabstop=4  "表示在编辑模式的时候按退格键的时候退回缩进的长度，当使用 expandtab 时特别有用。
set shiftwidth=4   "表示每一级缩进的长度一般设置成跟 softtabstop 一样。 当设置成 expandtab 时，缩进用空格来表示，noexpandtab 则是用制表符表示一个缩进。
set expandtab
"set noexpandtab
set autoindent
set cindent  "针对C语言自动缩进

"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
"set listchars+=eol:¬     " eol == end of line
set listchars=space:·
set list

set ic      "ignorecase   : 忽略大小写
"set noic   "noignorecase : 不忽略大小写

"set colorcolumn=80
"set cursorcolumn  "or set cuc 设置光标所在的列
"set cursorline    "or set cul 设置光标所在的行
" cterm 表示原生vim设置央视, 设置为NONE表示可以自定义设置
" red（红），white（白），black（黑），green（绿），yellow（黄），blue（蓝），purple（紫），
" gray（灰），brown（棕），tan(褐色)，syan(青色)
" 更多高亮颜色设置, 可以:h highlight 查看manual
"highlight CursorLine   cterm=NONE ctermbg=blue ctermfg=NONE guibg=NONE guifg=NONE
"highlight CursorColumn cterm=NONE ctermbg=blue ctermfg=NONE guibg=NONE guifg=NONE

" /usr/sare/vim/vim80/colors
colorscheme elflord
"colorscheme koehler
"colorscheme pablo
"colorscheme delek
"colorscheme evening
"colorscheme slate
"colorscheme darkblue
"colorscheme desert
"colorscheme industry
"colorscheme murphy
"colorscheme ron
"colorscheme torte
"colorscheme molokai

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
"inoremap < <><ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i

"-----------taglist set -----
nnoremap <silent> <F8> :TlistToggle<CR>
"let Tlist_Auto_Open=1
let Tlist_Close_On_Select=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_SingleClick=1
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window=1

"----------NERDTree set ------
nnoremap <silent> <F7> :NERDTree<CR>

"----------MarkDown set------https://github.com/plasticboy/vim-markdown
let g:vim_markdown_folding_disabled = 1                 " 取消折叠
let g:vim_markdown_no_default_key_mappings = 1          " 取消默认键的映射
let g:vim_markdown_fenced_languages = ['csharp=cs']     " 对于代码块进行别名, default ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']
" 基本的语法隐藏, vim命令行模式, 也就是简单的预览模式吧 set conceallevel=2
