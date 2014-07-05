" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.

if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


set nocompatible               " be iMproved  
 filetype off                   " required!  
  
 set rtp+=~/.vim/bundle/vundle/  
 call vundle#rc()  
  
" let Vundle manage Vundle  
" required!   
"这是vundle本身的设置  
 Bundle 'gmarik/vundle'    
   
 " My Bundles here:  
 "这里是设置你自己自定义的插件的设置vundle设置，注意：下载的插件git为：https://github.com/godlygeek/tabular.git，则设置为Bundle 'godlygeek/tabular';https://github.com/gmarik/vundle.git设置则为 Bundle 'gmarik/vundle'    
 " original repos on github  
 Bundle 'godlygeek/tabular'  
  
 " vim-scripts repos，vim-scripts的访问地址，格式则如下：  
 Bundle 'vim-scripts/winmanager'
 Bundle 'jistr/vim-nerdtree-tabs'
 Bundle 'ludovicPelle/vim-xdebug'
 Bundle 'joonty/vdebug'
 Bundle 'vim-scripts/vimgdb'
 Bundle 'kevinw/pyflakes-vim'
" Bundle 'aperezdc/vim-template'
 Bundle 'vim-scripts/taglist.vim'
 Bundle 'scrooloose/nerdtree'
 Bundle 'matchit.zip'
 Bundle 'davidhalter/jedi-vim'
 Bundle 'L9'  
 Bundle 'FuzzyFinder'  
 " non github repos ，非git的访问地址的，格式如下：  
 Bundle 'git://git.wincent.com/command-t.git'  
 " ...  
  
 filetype plugin indent on     " required!  
 "  
 " Brief help  
 " :BundleList          - list configured bundles  
 " :BundleInstall(!)    - install(update) bundles  
 " :BundleSearch(!) foo - search(or refresh cache first) for foo  
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles  
 "  
 " see :h vundle for more details or wiki for FAQ  
 " NOTE: comments after Bundle command are not allowed..  
 
 set ai                      "自动缩进
 set bs=2                    "在insert模式下用退格键删除
 set showmatch               "代码匹配
 set laststatus=2            "总是显示状态行
 set expandtab               "以下三个配置配合使用，设置tab和缩进空格数
 set shiftwidth=4
 set tabstop=4
 set cursorline              "为光标所在行加下划线
 set number                  "显示行号
 set autoread                "文件在Vim之外修改过，自动重新读入

 set ignorecase              "检索时忽略大小写
 set fileencodings=uft-8,gbk "使用utf-8或gbk打开文件
 set hls                     "检索时高亮显示匹配项
 set helplang=cn             "帮助系统设置为中文
 set foldmethod=indent       "代码折叠

 let mapleader = ','
 
 " setting of nerdtree
 autocmd vimenter * NERDTree
 let NERDTreeWinPos='left'
 let NERDTreeWinSize=31
 let NERDTreeChDirMode=1
 ",n 打开NERDTree
 map <leader>n :NERDTreeToggle<CR>

 " setting of nerdtreetab
 let g:nerdtree_tabs_open_on_console_startup=1
 let g:nerdtree_tabs_open_on_gui_startup = 1
 
 " conf for tabs, 为标签页进行的配置，通过ctrl h/l切换标签等
 ",t 新开一个tab标签
 nnoremap <leader>t : tabe<CR>
 ",h 前一个tab标签
 nnoremap <leader>H : tabp<CR>
 ",l 后一个tab标签
 nnoremap <leader>L: tabn<CR>

 " 设置编码    
 set encoding=utf-8    
 set fenc=utf-8    
 set fileencodings=ucs-bom,utf-8,cp936,gb2312,gb18030,big5
  
 "启动时大小
 set lines=110
 set columns=240

 "隐藏工具栏和滑动条  
 set guioptions=aAce

 "不要备份文件
 set nobackup 

 "设置字体  
 set gfn=Courier:h15 

 "运行*.py文件
 au BufRead,BufNewFile *.py,*.pyw map <D-r> :w<CR>:! /usr/bin/python % <CR>

 "path of ctags
 let Tlist_Ctags_Cmd="/usr/local/bin/ctags"

 "conf for taglist
 nnoremap <leader>lt :Tlist<CR>
 let Tlist_Show_One_File=1     "不同时显示多个文件的tag，只显示当前文件的    
 let Tlist_Exit_OnlyWindow=1   "如果taglist窗口是最后一个窗口，则退出vim   
 let Tlist_Ctags_Cmd="/usr/local/Cellar/ctags/5.8/bin/ctags" "将taglist与ctags关联 
 "设置单击tag就跳到tag定义的位置
 let Tlist_Use_SingleClick=1  
 let Tlist_Use_Right_Window = 1

 "使用#对单行代码注释
 map <D-3> 0i#<ESC>
 map <D-2> 0x<ESC>
  
 imap "" ""<left>
 imap '' ''<left>
 imap <> <><left>
 imap () ()<left>
 imap [] []<left>
 imap {} {}<left>

 filetype on            " enables filetype detection
 filetype plugin on     " enables filetype specific plugins

 let g:pyflakes_use_quickfix = 0

 "vim-template配置
 "let g:templates_plugin_loaded = 1
 "let g:templates_no_autocmd = 1
 "let g:templates_name_prefix = template.py
 "let g:templates_debug = 1
" let g:template_load = 1
" let g:templates_plugin_loaded = 1

" let g:template_tags_replacing = 1
" let g:T_AUTHOR = "Kris"
" let g:T_AUTHOR_EMAIL = "kris330@aliyun.com"
" let g:T_AUTHOR_WEBSITE = "http://www.csdn.net/yiliumu"
" let g:T_DATE_FORMAT = "%Y-%m-%d %H:%M:%S"
"
" setting of debug
 let g:vim_debug_disable_mappings = 1

" setting of winmanager
 let g:winManagerWindowLayout='FileExplorer|TagList'
 nnoremap wm :WMToggle<CR>

" map of debug
 nnoremap <D-0> :Dbg .<CR>
 nnoremap <D-9> :Dbg quit<CR>
 nnoremap <leader>b :Dbg break<CR>
 nnoremap <D-6> :Dbg over<CR>
 nnoremap <D-5> :Dbg into<CR>
 nnoremap <D-7> :Dbg out<CR>
 nnoremap <D-8> :Dbg here<CR>

 au BufEnter ~/python/* setlocal tags+=/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/tags
