if &compatible
  set nocompatible
endif

let s:dein_dir      = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

let &runtimepath     = s:dein_repo_dir .",". &runtimepath
let s:toml_dir       = expand('~/config/vim/dein')
let s:toml           = s:toml_dir . '/dein.toml'
let s:lazy_toml      = s:toml_dir . '/dein_lazy.toml'
let s:deoplete_toml  = s:toml_dir . '/deoplete.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 起動時に読み込むプラグイン群
  call dein#load_toml(s:toml,      {'lazy': 0})

  " 遅延読み込みしたいプラグイン群
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Add or remove your plugins here like this:
  if ((has('nvim')  || has('timers')) && has('python3')) && system('pip3 show neovim') !=# ''
    call dein#load_toml(s:deoplete_toml, {'lazy': 1})
    if !has('nvim')
      call dein#add ('roxma/nvim-yarp')
      call dein#add ('roxma/vim-hug-neovim-rpc')
    endif
  elseif has('lua')
    call dein#add ('Shougo/neocomplete.vim')
  endif

  if dein#tap('neocomplete.vim')
    let g:neocomplete#enable_at_startup = 1
  endif

  call dein#end()
  call dein#save_state()
endif


" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" setting
" スクロールする時に下が見えるようにする
set scrolloff=5
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" バックスペース有効化
set backspace=indent,eol,start

set clipboard=unnamed

" 見た目系
" 行番号を表示
set number
map <C-l> :set nonumber<CR>
" 現在の行を強調表示
" set cursorline
" " 現在の行を強調表示（縦）
" set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 不可視文字を表示
 set list
 set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

set foldmethod=marker

" Tab系
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" /{pattern}の入力中は「/」をタイプすると自動で「\/」が、
" ?{pattern}の入力中は「?」をタイプすると自動で「\?」が 入力されるようになる"
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"git clone https://github.com/tomasr/molokai ~/.vim/colors/
syntax enable
filetype plugin indent on
colorscheme molokai
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark

" encoding
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

" Program Execution
autocmd BufNewFile,BufRead *.rb nnoremap <C-e> :!ruby %
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %
autocmd BufNewFile,BufRead *.pl nnoremap <C-e> :!perl %
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
autocmd BufNewFile,BufRead *.toml setlocal filetype=toml
