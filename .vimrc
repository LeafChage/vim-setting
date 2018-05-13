if &compatible
  set nocompatible
endif

" dein.vimのディレクトリ
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
      call dein#begin(s:dein_dir)
      call dein#load_toml(s:dein_dir . '/dein.toml')
      call dein#end()
      call dein#save_state()

      if dein#check_install()
            call dein#install()
      endif
endif

filetype plugin indent on

"python見つける
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog =  '/usr/local/bin/python3'


"インデントは6つ
set expandtab "インデントは半角スペース
set tabstop=4
set shiftwidth=4
set autoindent

" filetype check
filetype on

"検索結果のハイライト
set hlsearch

"リアルタイム検索
set incsearch

"文字列の折り返しなし
set nowrap

"color
autocmd VimEnter,ColorScheme * highlight Visual cterm=NONE ctermfg=white ctermbg=darkcyan
autocmd VimEnter,ColorScheme * highlight Comment ctermfg=242
autocmd VimEnter,ColorScheme * highlight LineNr ctermfg=103 ctermbg=236
"autocmd VimEnter,ColorScheme * highlight SpecialKey ctermfg=239

" set t_Co=256
syntax on
set background=dark
colorscheme meta5 "meta5 iceberg jellybeans hybrid solarized

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

map <silent> <C-c> :set cursorline! cursorcolumn!<CR>
highlight CursorLine cterm=NONE ctermfg=0 ctermbg=6
highlight CursorColumn cterm=NONE ctermfg=0 ctermbg=6

autocmd VimEnter * imap <Nul> <esc>

" 文字コード指定
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis


" file罰のspace指定
if has("autocmd")
      filetype plugin on
      filetype indent on
      autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
      autocmd FileType html       setlocal sw=4 sts=4 ts=4 et
      autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
      autocmd FileType javascript setlocal sw=4 sts=4 ts=4 et
      autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
      autocmd FileType json       setlocal sw=4 sts=4 ts=4 et
      autocmd FileType css        setlocal sw=4 sts=4 ts=4 et
      autocmd FileType scss       setlocal sw=4 sts=4 ts=4 et
      autocmd FileType sass       setlocal sw=4 sts=4 ts=4 et
      autocmd FileType nim        setlocal sw=2 sts=2 ts=2 et
      autocmd FileType go         setlocal sw=4 sts=4 ts=4 et
      autocmd FileType rust       setlocal sw=4 sts=4 ts=4 et
      autocmd FileType rs         setlocal sw=4 sts=4 ts=4 et
      autocmd FileType lisp       setlocal sw=2 sts=2 ts=2 et
endif
