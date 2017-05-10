"NeoBundle設定
set nocompatible
filetype plugin indent off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#begin(expand('~/.vim/bundle'))
endif 
"plugin追加
NeoBundleFetch 'Shougo/neobundle.vim'

"保存のタイミングで文法チェック
NeoBundle 'scrooloose/syntastic.git'

"フッター的なやつ
NeoBundle 'itchyny/lightline.vim'

"複数行のコメントアウト ctrl+k 
NeoBundle "tyru/caw.vim.git"
nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)

"自動とじカッコ
NeoBundle 'Townk/vim-autoclose'

"非同期処理を走らせるプラグインが早くなる
NeoBundle 'Shougo/vimproc', {
	\ 'build' : {
	\     'windows' : 'make -f make_mingw32.mak',
	\     'cygwin' : 'make -f make_cygwin.mak',
	\     'mac' : 'make -f make_mac.mak',
	\     'unix' : 'make -f make_unix.mak',
	\    },
	\ }

""コード保管
if has('lua')
	NeoBundleLazy 'Shougo/neocomplete.vim', {
		\ 'depends' : 'Shougo/vimproc',
		\ 'autoload' : { 'insert' : 5,}
		\ }
endif
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"htmlのマッチしている先を教えてくれる
NeoBundle 'valloric/matchtagalways'
let g:mta_use_matchparen_group = 1
let g:mta_filetypes = {
	\ 'html' : 1,
	\ 'php' : 1,
\}

" カーソル下のハイライトをトグルする space+mで検索
NeoBundle "t9md/vim-quickhl"
map <Space>m <Plug>(quickhl-manual-this)
map <Space>M <Plug>(quickhl-manual-reset)

"jellybeans
NeoBundle 'nanotech/jellybeans.vim'

"go lang
NeoBundle 'fatih/vim-go'

"visualモードで選択したものを検索 gx
NeoBundle 'open-browser.vim'
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

call neobundle#end()
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"インデントは6つ
"set expandtab インデントは半角スペース
set tabstop=6
set shiftwidth=6
set autoindent

"検索結果のハイライト
set hlsearch

"リアルタイム検索
set incsearch

"文字列の折り返しなし
set nowrap

"不可視文字の可視化
set list
set listchars=tab:\>\ 
autocmd VimEnter,Colorscheme * highlight SpecialKey cterm=NONE ctermfg=blue ctermbg=NONE

"colorscheme"
set t_Co=256
syntax on
colorscheme jellybeans
set background=dark

autocmd VimEnter,Colorscheme * highlight Visual cterm=NONE ctermfg=white ctermbg=darkcyan
autocmd VimEnter,ColorScheme * highlight Comment ctermfg=36

"行末の1文字先までカーソルを移動できるように
set virtualedit=onemore

"全角スペースをハイライト
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=darkblue
endfunction

if has('syntax')
	augroup ZenkakuSpace
	    autocmd!
		autocmd ColorScheme       * call ZenkakuSpace()
		autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
	augroup END
call ZenkakuSpace()
endif

"swpファイル不要
set noswapfile

"Phalcon対応
set filetype=htmldjango

"deleteキー聞かない対応"
set backspace=indent,eol,start

"ステータスライン"
"" ファイル名表示
set statusline=%F

""ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2

"現在の行の強調なし
set nocursorline

"現在の行表示"
set number

"保存時に行末の空白行を削除
autocmd BufWritePre * :%s/\s\+$//ge
