" 定义快捷键的前缀，就是<Leader>
let mapleader=";"

" 开启文件类型检测
filetype on

" 函数跳转
let g:godef_split=2

" ycm配置
set completeopt=longest,menu                    " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
let g:ycm_min_num_of_chars_for_completion=2             " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                      " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_autoclose_preview_window_after_completion=1       " 智能关闭自动补全窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif         " 离开插入模式后自动关闭预览窗口


" 跳到一行的头部[normal模式]
nmap b 0
nmap e $
nmap <Leader>b 0
nmap <Leader>e $

" 插入模式上下左右移动
imap <Leader>h <Left>
imap <Leader>r <Right>
imap <Leader>k <Up>

" 让配置立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 实时搜索
set incsearch

" ;e 替换 Esc
inoremap <Leader>e <Esc>
imap <Leader>e <Esc>
vmap <Leader>e <Esc>


" 搜索的时候大小写不敏感
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase
" 设置文内智能搜索提示
" 高亮search命中的文本
set hlsearch

" 关键兼容模式
set nocompatible

" vim 自身的命令行模式智能补全
set wildmenu

" 禁止光标闪烁
set gcr=a:block-blinkon0

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T


" 全屏展示设置function
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

" 设置 gvim 显示字体
set guifont=YaHei\ Consolas\ Hybrid:h13.5


" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 开启行号显示
set number

" 高亮显示当前行/列
set cursorline
"set cursorcolumn

" 高亮显示搜索结果
set hlsearch


" 禁止折行
set nowrap

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" 开启语法高亮功能
syntax on

" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 将制表符扩展为空格
set expandtab

" 设置编辑时制表符占用空格数
set tabstop=2

" 设置格式化时制表符占用空格数
set shiftwidth=2

" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=2

" 缩进可视化随 vim 自启动
" let g:indent_guides_enable_on_vim_startup=1

" 从第几层开始可视化显示缩进
" let g:indent_guides_start_level=2

" 色块宽度
" let g:indent_guides_guide_size=0.1


" 插入模式下自动补全花括号
imap { {}<ESC>i<CR><CR><ESC>

" 使得terminal的光标变为细线，而不是默认的粗条。这个在vim的普通模式和插入模式都会生效。
set gcr=n-v-c:ver25-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor


" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99

" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" 缩进配置
" Smart indent
set smartindent
" 打开自动缩进
" never add copyindent, case error   " copy the previous indentation on autoindenting
set autoindent


"==========================================
" FileEncode Settings 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" tab相关变更
" 设置Tab键的宽度        [等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4




" 文件浏览设置
" c系列的在接口和实现之间进行切换
nmap <silent> <Leader>sw :FSHere<cr>
" 使用 NERDTree 插件查看工程文件。设置快捷键，r 刷新目录 ，I 显示隐藏文件 
nmap <Leader>l :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
" let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
map <Leader>f :MBEbn<cr>
map <Leader>d :MBEbp<cr>
" 文件修改之后自动载入
set autoread
" 启动的时候关闭那个援助提示
set shortmess=atI


" 启用鼠标
set mouse-=q
set mouse=a
" set mouse hide

" => 选中及操作改键

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv


" 复制选中区到系统剪切板中
vnoremap <leader>y "+y


" select all
map <Leader>sa ggVG

" 选中并高亮最后一次插入的内容
nnoremap gv `[v`]

" select block
nnoremap <leader>v V`}


" change the terminal's title
set title
" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
set t_vb=
set tm=500

" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

" 显示当前的行号列号
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode



" 快捷键设置
" 不做任何保存，直接退出
nmap <Leader>q :qa!<CR>
" 保存当前窗口内容
nmap <Leader>w :w<CR>
" 保存当前窗口内容并退出
nmap <Leader>wq :w<CR>:q<CR>


" 设置环境保存项
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" 保存 undo 历史
set undodir=~/.undo_history/
set undofile
" 保存快捷键
map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
" 恢复快捷键
map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>


" 主题背景设置
set background=dark
colorscheme solarized
"colorscheme molokai
"colorscheme phd


" 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" 自适应不同语言的智能缩进
filetype indent on

" 刚刚打开的文件的切换 不同的tab之间 这种针对的是有tab的那种开着的进行切换
" 右上角那种不同tab的切换可以切换到buffer里面 按⬇️ 然后enter就可以切换 这种方式针对的是仅仅在缓存区存在的打开过的文件
" noremap <C-Tab> :tabnext<CR>
" noremap <C-S-Tab> :tabprev<CR> 

if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  inoremap <D-1> :tabn 1<CR>
  inoremap <D-2> :tabn 2<CR>
  inoremap <D-3> :tabn 3<CR>
  inoremap <D-4> :tabn 4<CR>
  inoremap <D-5> :tabn 5<CR>
  inoremap <D-6> :tabn 6<CR>
  inoremap <D-7> :tabn 7<CR>
  inoremap <D-8> :tabn 8<CR>
  inoremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  inoremap <D-0> :tablast<CR>
endif


" 插件设置
" vundle 管理的插件列表必须位于 call vundle#begin() 和 call vundle#end() 之间
filetype off
set rtp+=~/.vim/bundle/Vundle.vim  
call vundle#begin()

" 插件管理包
Plugin 'VundleVim/Vundle.vim'
" 主题颜色配置
Plugin 'altercation/vim-colors-solarized'
" molokai主题配置
Plugin 'tomasr/molokai'
"
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'

" 标签展示快速跳转
Plugin 'kshenoy/vim-signature'

Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'

" tagbar 为正在编辑的文件生成一个大纲 包含类/方法/变量等 可以快速跳转到选中的目标位置
Plugin 'majutsushi/tagbar'
" tagbar的快捷配置
nmap <leader>tt :TagbarToggle<CR>
" 启动时自动focus
let g:tagbar_autofocus = 1

Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
" Plugin 'Valloric/YouCompleteMe',{'do':'python3 install.py'} 这个好像已经不存在了 进行了替换
Plugin 'ycm-core/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'

" 自动引入包
Plugin 'bradfitz/goimports'

let g:gofmt_command = "goimports"  
" autocmd BufWritePre *.go :Fmt

" 跳函数方法定义处
Plugin 'dgryski/vim-godef'

" 代码高亮和语法检查
Plugin 'fatih/vim-go'

" gocode 代码提示 格式化
Plugin 'nsf/gocode'
" Plugin 'Blackrush/vim-gocode'

" 插件列表结束
call vundle#end()

filetype plugin indent on


