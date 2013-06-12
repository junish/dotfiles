" Thanks {{{
" https://github.com/yuroyoro/dotfiles.git
" https://github.com/Shougo/shougo-s-github.git
" }}}

" Initialize {{{
set nocompatible               " be iMproved
filetype off                   " Required!
set t_Co=256

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

let mapleader = "\<Space>"

" 新しいウィンドウを下に開く
set splitbelow
" 新しいウィンドウを右に開く
set splitright

" 現在の autocommand を全て削除する
autocmd!
" }}}


"Qucickfix {{{

" Auto Open
"autocmd QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | copen | endif
" }}}

" Highlight {{{
set showmatch
syntax on

hi clear
colorscheme morning

"Escの2回押しでハイライト消去
noremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR>

" OSのクリップボードを使用する
"set clipboard=unnamed
"set clipboard=unnamedplus,unnamed "For YankRing.vim

" カーソル行をハイライト
set cursorline
":highlight clear CursorLine
":highlight CursorLine gui=underline
"highlight CursorLine ctermbg=blue guibg=blue

" Multi byte width
if exists('&ambiwidth')
    set ambiwidth=double
endif

augroup hll
    autocmd! hll

    " 全角スペースに青い下線を引く
    "autocmd WinEnter,BufRead * highlight ZenkakuLeader cterm=underline ctermfg=lightblue
    "autocmd WinEnter,BufRead * 3match ZenkakuLeader /　/

    " タブに緑の下線を引く
    autocmd WinEnter,BufRead * highlight TabLeader cterm=underline ctermfg=lightgreen
    autocmd WinEnter,BufRead * 2match TabLeader /	/

    " カレントウィンドウにのみ罫線を引く
    autocmd WinLeave * set nocursorline
    autocmd WinEnter,BufRead * set cursorline
augroup END
" }}}

" Fold {{{
"set foldenable
"set foldcolumn=2
set nofoldenable

set foldmethod=marker
" Show folding level.
set fillchars=vert:\|
set commentstring=%s

func! s:fold_current_expand()
    silent! %foldclose!
    normal! zvzz
endfunc
nnoremap z<Space>   :call <SID>fold_current_expand()<CR>
" }}}

" Line {{{
set wildmode=list:longest
set laststatus=2
set cmdheight=1
set showcmd
set showtabline=1
set wrap
set number

function! GetB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return String2Hex(c)
endfunction

" help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789abcdef'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc

" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Nr2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endfunc

" ステータスラインの表示
set statusline=%<     " 行が長すぎるときに切り詰める位置
set statusline+=[%n]  " バッファ番号
set statusline+=%m    " %m 修正フラグ
set statusline+=%r    " %r 読み込み専用フラグ
set statusline+=%h    " %h ヘルプバッファフラグ
set statusline+=%w    " %w プレビューウィンドウフラグ
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fencとffを表示
set statusline+=%y    " バッファ内のファイルのタイプ
set statusline+=\     " 空白スペース
if winwidth(0) >= 80
  set statusline+=%F    " バッファ内のファイルのフルパス
else
  set statusline+=%t    " ファイル名のみ
endif
set statusline+=%=    " 左寄せ項目と右寄せ項目の区切り
set statusline+=[%{GetB()}]
set statusline+=\     " 空白スペース
set statusline+=%1l   " 何行目にカーソルがあるか
set statusline+=/
set statusline+=%L    " バッファ内の総行数
set statusline+=,
set statusline+=\     " 空白スペース
set statusline+=%2c    " 何列目にカーソルがあるか
"set statusline+=%V    " 画面上の何列目にカーソルがあるか
set statusline+=\     " 空白スペース
set statusline+=%4P    " ファイル内の何％の位置にあるか
if exists('g:loaded_fugitive')
    set statusline+=\     " 空白スペース
    set statusline+=%2{fugitive#statusline()}  " Gitのブランチ名を表示
endif

" augroup InsertHook
"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
    autocmd! InsertHook
    autocmd InsertLeave * hi StatusLine guifg=#202020 guibg=#c0c0c0 ctermfg=bg  ctermbg=252 gui=bold cterm=bold "dark lucius
    autocmd InsertEnter * hi StatusLine guifg=#ffffff guibg=#505050 ctermfg=231 ctermbg=239 gui=bold cterm=bold "light lucius
augroup END
" }}}

" Encode {{{
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,euc-jp,cp932,iso-2022-jp
set fileformats=unix,dos,mac
" }}}

" Search {{{
set history=256
set incsearch
set ignorecase
set smartcase
set hlsearch
" }}}

" Indent {{{
set noautoindent
set expandtab
set shiftwidth=4
set tabstop=4

function! g:tab2twospace()
    setlocal shiftwidth=2
    setlocal softtabstop=2
    setlocal tabstop=2
endfunction
autocmd BufRead,BufNewFile *.js,*.html,*.part call g:tab2twospace()

" vimの改行時に自動でコメントが挿入されるのをやめたい
"http://d.hatena.ne.jp/yuichi_katahira/20090117/1232209418
autocmd FileType * setlocal formatoptions-=ro
" }}}

" Backup {{{
set nobackup
"set writebackup
"set backup
"set backupdir=~/.vimbak
"set directory=~/.vimswp
" }}}

" Exit {{{
" バッファの自動保存
"http://vim-users.jp/2009/07/hack36/
"set autowrite
" set autowriteall
"autocmd CursorHold *  wall
"autocmd CursorHoldI *  wall

" vimを終了してもUndoする
"http://vim-users.jp/2010/07/hack162/
if has('persistent_undo')
  set undodir=~/.vimundo
  augroup vimrc-undofile
    autocmd!
    autocmd BufReadPre ~/* setlocal undofile
  augroup END
endif

" ESCが遠い対策
"inoremap <C-q> <ESC>
"nnoremap <C-q> <ESC>
" }}}

" Ctags {{{
set tags=./tags
set tags+=~/.vim/tags/android
set tags+=~/.vim/tags/java6
set tags+=~/.vim/tags/python27
if has('path_extra')
    ":help file-search
    "親ディレクトリにあるタグファイルを指定
    set tags+=tags;
    "子ディレクトリにあるタグファイルを指定
    set tags+=./**/tags
endif
nnoremap <Leader>] <C-w><C-]>
nnoremap <Leader>[ <C-t><C-w>c
nnoremap <Leader>} <C-]>
nnoremap <Leader>{ <C-t>
"noremap <Leader>j <C-f>
"noremap <Leader>k <C-b>
" }}}

" Copy {{{
"nnoremap y "*y
"}}}

" Mouse {{{
" Enable mouse support.
"set mouse=a
"
"if &term =~ "^screen"
"    augroup MyAutoCmd
"        autocmd VimLeave * :set mouse=
"     augroup END
"
"    " screenでマウスを使用するとフリーズするのでその対策
"    set ttymouse=xterm2
"endif
" }}}

" Move {{{
"表示行単位で行移動する
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

"WORD単位で行移動する
nnoremap <C-h> e
nnoremap <C-l> w
nnoremap <C-j> gj
nnoremap <C-k> gk
vnoremap <C-h> e
vnoremap <C-l> w
vnoremap <C-j> gj
vnoremap <C-k> gk

"Windowの移動
nnoremap <silent> + <C-w>+
nnoremap <silent> - <C-w>-
nnoremap <silent> { <C-w><
nnoremap <silent> } <C-w>>
nnoremap <silent> = <C-w>=
nnoremap <silent> <C-w><C-k> <C-w>c
nnoremap <silent> <C-w><C-f> :<C-u>vnew <cfile><Enter>

"Insert Mode での移動
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>l
inoremap <C-k> <C-o>gk
inoremap <C-j> <C-o>gj

inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
inoremap <C-d> <C-o>x
"inoremap <C-u> <C-o>d0

"Command Mode での移動
cnoremap <C-k> <UP>
cnoremap <C-j> <DOWN>
cnoremap <C-h> <LEFT>
cnoremap <C-l> <RIGHT>
cnoremap <C-a> <C-b>

cnoremap <C-f> <RIGHT>
cnoremap <C-b> <LEFT>

cnoremap <C-d> <RIGHT><BS>
" }}}

" Vim Open /close {{{
"素早く保存、終了
nnoremap <Leader>w :<C-u>write<Enter>
nnoremap <Leader>q :<C-u>quit<Enter>
nnoremap <Leader>Q :<C-u>quit!<Enter>
"バッファが編集中でもその他のファイルを開けるように
set hidden
"外部のエディタで編集中のファイルが変更されたら自動で読み直す
set autoread
" }}}

" Setting Files {{{
" Read And Write Settings
nnoremap <Leader>.. :<C-u>source ~/.vimrc<Enter>
nnoremap <Leader>.e :<C-u>edit ~/.vimrc<Enter>
nnoremap <Leader>.E :<C-u>vnew ~/.vimrc<Enter>
nnoremap <Leader>.v :<C-u>edit ~/.vim/vimrc_bundles.vim<Enter>
nnoremap <Leader>.V :<C-u>vnew ~/.vim/vimrc_bundles.vim<Enter>
nnoremap <Leader>.l :<C-u>edit ~/.vim/vimrc_local.vim<Enter>
nnoremap <Leader>.L :<C-u>vnew ~/.vim/vimrc_local.vim<Enter>
nnoremap <Leader>.t :<C-u>edit ~/.tmux.conf<Enter>
nnoremap <Leader>.T :<C-u>vnew ~/.tmux.conf<Enter>
nnoremap <Leader>.b :<C-u>edit ~/.bashrc<Enter>
nnoremap <Leader>.B :<C-u>vnew ~/.bashrc<Enter>
nnoremap <Leader>.m :<C-u>edit ~/.bashrc.tmux<Enter>
nnoremap <Leader>.M :<C-u>vnew ~/.bashrc.tmux<Enter>
" }}}

" Tab {{{
nnoremap <Leader>p  :<C-u>tabnew<Enter>
"nnoremap <Leader>q  :<C-u>tabclose<Enter>
nnoremap <Leader>0 :<C-u>tabmove 0<Enter>
nnoremap <Leader>1 :<C-u>tabmove 1<Enter>
nnoremap <Leader>2 :<C-u>tabmove 2<Enter>
nnoremap <Leader>3 :<C-u>tabmove 3<Enter>
nnoremap <Leader>4 :<C-u>tabmove 4<Enter>
nnoremap <Leader>5 :<C-u>tabmove 5<Enter>
nnoremap <Leader>6 :<C-u>tabmove 6<Enter>
nnoremap <Leader>7 :<C-u>tabmove 7<Enter>
nnoremap <Leader>8 :<C-u>tabmove 8<Enter>
nnoremap <Leader>9 :<C-u>tabmove 9<Enter>
nnoremap <S-RIGHT> :<C-u>tabn<Enter>
nnoremap <S-LEFT> :<C-u>tabp<Enter>
" }}}

" Buffer {{{
nnoremap <C-s>  :<C-u>bp!<Enter>
nnoremap <C-d>  :<C-u>bn!<Enter>
nnoremap <S-DOWN> :<C-u>bn!<Enter>
nnoremap <S-UP> :<C-u>bp!<Enter>
" }}}

" Toggle {{{
nnoremap <silent> <Space>j :<C-u>set invnumber<Enter>
nnoremap <silent> <Space>k :<C-u>set invcursorline<Enter>
"}}}

" Completion  {{{
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" オムニ補完
inoremap <expr><C-n><C-o> &filetype == 'vim' ? "\<C-x>\<C-v>\<C-p>" : "\<C-x>\<C-o>\<C-p>"

" file補完
inoremap <expr><C-n><C-f> "\<C-x>\<C-f>\<C-p>"

" tag補完
inoremap <expr><C-n><C-g> "\<C-x>\<C-]>\<C-p>"

" line補完
inoremap <expr><C-n><C-l> "\<C-x>\<C-l>\<C-p>"

" define補完
inoremap <expr><C-n><C-d> "\<C-x>\<C-d>\<C-p>"

" keyword補完
inoremap <expr><C-n><C-k> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"

" コマンドライン補完
inoremap <expr><C-n><C-v> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
" }}}

" Short Cut {{{
inoremap jj <ESC>
" inoremap <expr> j getline('.')[col('.') - 2] ==# 'j' ? "\<BS>\<ESC>" : 'j'
cnoremap <expr> j getcmdline()[getcmdpos()-2] ==# 'j' ? "\<BS>\<C-c>" : 'j'
onoremap jj <ESC>

inoremap j<Space> j
onoremap j<Space> j
"}}}

" make {{{
nnoremap <Leader>mm :make && OVERWRITE=1 make install<Enter>
nnoremap <Leader>mk :make<Enter>
nnoremap <Leader>mi :OVERWRITE=1 make install<Enter>
nnoremap <Leader>mc :make clean<Enter>
" }}}

" Add File Type {{{
autocmd BufNewFile,BufRead *.psgi   set filetype=perl
autocmd BufNewFile,BufRead *.t      set filetype=perl
" }}}

" Smart word search."{{{
" Search cursor word by word unit.
nnoremap <silent> * :<C-u>set hlsearch<CR>:<C-u>call <SID>SetSearch('""yiw', 'word')<CR>

" Search from cursor to word end.
nnoremap <silent> # :<C-u>set hlsearch<CR>:<C-u>call <SID>SetSearch('""ye')<CR>

" Search from cursor to word start.
"nnoremap <silent> ^ :<C-u>set hlsearch<CR>:<C-u>call <SID>SetSearch('""ye')<CR>

" Search selected text.
xnoremap <silent> * :<C-u>set hlsearch<CR>:<C-u>call <SID>SetSearch('""vgvy')<CR>
xnoremap <silent> # :<C-u>set hlsearch<CR>:<C-u>call <SID>SetSearch('""vgvy')<CR>
"xnoremap <silent> ^ :<C-u>set hlsearch<CR>:<C-u>call <SID>SetSearch('""vgvy')<CR>

""""""""""""""""""""""""""""""
" Set search word.
" If set additional parametar, search by word unit.
""""""""""""""""""""""""""""""
function! s:SetSearch(cmd, ...)
  let saved_reg = @"
  if a:cmd != ''
    silent exec 'normal! '.a:cmd
  endif
  let pattern = escape(@", '\\/.*$^~[]')
  let pattern = substitute(pattern, '\n$', '', '')
  if a:0 > 0
    let pattern = '\<'.pattern.'\>'
  endif
  let @/ = pattern
  let @" = saved_reg
  echo @/
endfunction "}}}

if filereadable(expand('~/.vim/vimrc_bundles.vim'))
  execute 'source' expand('~/.vim/vimrc_bundles.vim')
endif

"if filereadable(expand('~/.vim/vimrc_local.vim'))
"  execute 'source' expand('~/.vim/vimrc_local.vim')
"endif
