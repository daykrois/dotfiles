call plug#begin('~/.vim/plug')
" Python 语法高亮
Plug 'vim-python/python-syntax'
" 自动补全插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 代码格式化
Plug 'psf/black', { 'branch': 'stable' }
" 代码片段
"Plug 'honza/vim-snippets'
call plug#end()

inoremap <expr> <Tab> pumvisible() ? coc#pum#confirm() : "\<Tab>"

" 基础设置
set nocompatible
set encoding=utf-8
set termguicolors
colorscheme desert

" 显示设置
set number
" set relativenumber
set cursorline
set showmode
set showcmd
set showmatch
set ruler
set title
set lazyredraw
set nowrap
set splitbelow

" 搜索设置
set ignorecase
set smartcase
set incsearch
set hlsearch

" 缩进设置
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" 文件类型和语法
syntax on
filetype on
filetype plugin on
filetype indent on

" 补全与菜单
set wildmenu
set wildmode=longest:list,full

" 剪贴板
set clipboard=unnamedplus

" 文件操作
set nobackup
set noswapfile
set undofile
set undodir=~/.vim/undodir

" 历史与行为
set history=500
set autoread
set hidden

" 自动滚动
set scrolloff=10

" 自动切换目录
" set autochdir
