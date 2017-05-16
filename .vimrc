"NeoBund
"設定
set nocompatible
filetype plugin indent off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#begin(expand('~/.vim/bundle'))
endif
NeoBundleFetch 'Shougo/neobundle.vim' "plugin追加
"非同期処理を走らせるプラグインが早くなる
NeoBundle 'Shougo/vimproc', {
	\ 'build' : {
	\     'windows' : 'make -f make_mingw32.mak',
	\     'cygwin' : 'make -f make_cygwin.mak',
	\     'mac' : 'make -f make_mac.mak',
	\     'unix' : 'make -f make_unix.mak',
	\    },
	\ }
NeoBundle 'thinca/vim-quickrun'       "スクリプト実行 ctrl l
NeoBundle 'scrooloose/syntastic.git'  "保存のタイミングで文法チェック
NeoBundle 'itchyny/lightline.vim'     "フッター的なやつ
NeoBundle "tyru/caw.vim.git"          "複数行のコメントアウト ctrl+k
NeoBundle 'Townk/vim-autoclose'       "自動とじカッコ
NeoBundle 'valloric/matchtagalways'   "htmlのマッチしている先を教えてくれる
NeoBundle "t9md/vim-quickhl"          "カーソル下のハイライトをトグルする space+mで検索
NeoBundle 'open-browser.vim'          "visualモードで選択したものを検索 gx
NeoBundle 'osyo-manga/vim-brightest'  "カーソル下の文字を自動でハイライト
NeoBundle 'osyo-manga/vim-over'       "おしゃれ置換 space + oで入る
NeoBundle 'nanotech/jellybeans.vim'   "colorscheme >>>>>>>>>>>
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'cocopon/iceberg.vim'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'mrkn/mrkn256.vim'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"vim-brightest{
let g:brightest#ignore_syntax_list = [ "Statement" ]
let g:brightest#pattern = '\k\+'
"}

"caw.vim{
nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)
"}

"matchtagalways{
let g:mta_use_matchparen_group = 1
let g:mta_filetypes = {
	\ 'html' : 1,
	\ 'php' : 1,
	\}
"}

"vim-quickhl{
map <Space>m <Plug>(quickhl-manual-this)
map <Space>M <Plug>(quickhl-manual-reset)
"}

"open-browser{
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
"}

"osyo-manga/vim-over{
nnoremap <silent> <Space>o :OverCommandLine<CR>%s//g<Left><Left>
"}

" vim-quickrun{
nnoremap <silent> <C-l> :QuickRun<CR>
let g:quickrun_config={'_': {'split': 'vertical'}}
set splitright
" }


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
set listchars=tab:\>\_

"colorscheme"
set t_Co=256
syntax on
colorscheme iceberg  "mustang iceberg jellybeans hybrid vim-vice
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
