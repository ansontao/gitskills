set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'msanders/snipmate.vim'
"Plugin 'honza/vim-snippets'
Plugin 'molokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



set nu cindent is ic hls
set cursorline
"
" -----------------------------------------------------------------------------
"  < 判断操作系统是否是 Windows 还是 Linux >
" -----------------------------------------------------------------------------
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:iswindows = 0
endif
 
" -----------------------------------------------------------------------------
"  < 判断是终端还是 Gvim >
" -----------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

"重新载入vimrc文件
if g:iswindows
	nmap <silent> ;v :source ~/_vimrc <CR>
	nmap ;e :vs ~/_vimrc<CR>
	nmap <F5> ;v
	imap <F5> <ESC>;v
else
	nmap ;v :source ~/.vimrc <CR>
	nmap ;e :vs ~/.vimrc<CR>
	nmap <F5> ;v
	imap <F5> <ESC>;v
endif

"重新载入vimrc文件
if g:iswindows
	nmap <silent> ;v :source ~/_vimrc <CR>
	nmap ;e :vs ~/_vimrc<CR>
	nmap <F5> ;v
	imap <F5> <ESC>;v

	if v:version >= 702
		set undofile
		set undodir=~/vimfiles/_undo/
		set undolevels=200
	endif
else
	nmap ;v :source ~/.vimrc <CR>
	nmap ;e :vs ~/.vimrc<CR>
	nmap <F5> ;v
	imap <F5> <ESC>;v
	if v:version >= 702
	endif
endif

"解决中文乱码问题
set fenc=chinese
 "处理文本中显示乱码
 set encoding=utf-8
 set fileencodings=utf-8,chinese,latin-1
 if has("win32")
 set fileencoding=chinese
 else
 set fileencoding=utf-8
endif
 "处理菜单及右键菜单乱码
 source $VIMRUNTIME/delmenu.vim
 source $VIMRUNTIME/menu.vim
   
"处理consle输出乱码
 language messages zh_CN.utf-8
"中文乱码结束

set guifont=courier_new:h15:b:cDEFAULT
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 14  

syntax on
set background=dark
colorscheme molokai
"colorscheme elflord


"GUI启动时全屏+去掉菜单栏工具栏
au GUIEnter * simalt ~x
set guioptions-=T
set guioptions-=m

"光标在多窗口移动快捷键
nmap <C-H> <C-W>h 
nmap <C-L> <C-W>l 
nmap <C-J> <C-W>j 
nmap <C-K> <C-W>k 

"光标在tab间移动的快键间
nmap L :tabnext <CR> 
nmap H :tabprevious <CR> 
nmap ;x :tabclose <CR>

"设置tab缩进，以空格代替tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set expandtab

"显示tab建""""""""""""""""""""""""""""""""
let g:showlist = 0

function! ToggleShowlist()
    if g:showlist == 0
        let g:showlist = 1
        set list
    else
        let g:showlist = 0
        set nolist
    endif
endfunction

map <F3> :call ToggleShowlist()<CR>
""""""""""""""""""""""""""""""""""""""""""

nmap <C-M> :CtrlPMRUFiles<CR>

set backspace=indent,eol,start

"自动命令，每次写入.vimrc后，都会执行这个自动命令，source一次~/.vimrc  
if has("win32")
    autocmd! bufwritepost _vimrc source ~/_vimrc   
else
    autocmd! bufwritepost .vimrc source ~/.vimrc   
endif

