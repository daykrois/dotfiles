" 编码
set encoding=utf-8

set nocp

" 开启鼠标支持
set mouse=a

" vim记忆行数
set history=500

" 启用文件类型插件
filetype plugin indent on

" 光标移动时上下文行数
set so=7

" 设置补全
set wildmenu
set wildmode=list:longest,full

" 始终显示当前位置
set ruler

" 命令栏高度
set cmdheight=1

" 缓冲区隐藏
set hid

" 搜索设置 忽略大小写 智能大小写 高亮搜索 增量搜索
set ignorecase
set smartcase
set hlsearch
set incsearch

" 正则表达式
set magic

" 匹配括号
set showmatch

" 语法高亮
syntax enable

" 背景颜色
set background=dark

" 关闭备份
set nobackup
set nowb
set noswapfile

" 空格替代tab
set expandtab

" 智能tab
set smarttab

" 1tab = 4空格
set shiftwidth=4
set tabstop=4

" 自动缩进 智能缩进 换行
set autoindent
set smartindent
set wrap

" 显示 行号 相对行号
set number
set relativenumber

" 状态栏
set laststatus=2   

" 显示输入的命令
set showcmd   

" 突出显示当前行
set cursorline          

" 显示最后一行
set display+=lastline

" 性能优化 放置频繁重绘 语法高亮扫描行数 禁用光标线
set lazyredraw
set synmaxcol=200
set nocursorline nocursorcolumn

" 自动补全
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
