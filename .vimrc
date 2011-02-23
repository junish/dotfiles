"TODO snipMate(How to create template)
"TODO Unite(How to)
"TODO vim-ref(Javadoc)
"TODO surround(How to)
"TODO neocomplcache(How to include comp, dict comp)
"TODO NERD-Commenter(How to)

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype indent plugin on

" 現在の autocommand を全て削除する
autocmd!

" vim-update-bundles {{{
"---------------------------------------------
"管理系
"---------------------------------------------
" BUNDLE: git://github.com/vim-scripts/pathogen.vim.git
"---------------------------------------------
"表示系
"---------------------------------------------
" BUNDLE: git://github.com/vim-scripts/desert256.vim.git
" BUNDLE: git://github.com/vim-scripts/scala.vim.git
" BUNDLE: git://github.com/vim-scripts/jQuery.git
" BUNDLE: git://github.com/vim-scripts/taglist.vim.git
" BUNDLE: git://github.com/vim-scripts/matchit.zip.git
"---------------------------------------------
"編集系
"---------------------------------------------
" BUNDLE: git://github.com/vim-scripts/Align.git
" BUNDLE: git://github.com/vim-scripts/surround.vim.git
" BUNDLE: git://github.com/vim-scripts/The-NERD-Commenter.git
" BUNDLE: git://github.com/vim-scripts/YankRing.vim.git
" BUNDLE: git://github.com/vim-scripts/quickrun.vim.git
" BUNDLE: git://github.com/vim-scripts/neocomplcache.git
" BUNDLE: git://github.com/vim-scripts/snipMate.git
" BUNDLE: git://github.com/vim-scripts/sudo.vim.git
" BUNDLE: git://github.com/vim-scripts/javacomplete.git
"---------------------------------------------
"検索系
"---------------------------------------------
" BUNDLE: git://github.com/vim-scripts/eregex.vim.git
" BUNDLE: git://github.com/vim-scripts/grep.vim.git
"---------------------------------------------
"ファイル系
"---------------------------------------------
" BUNDLE: git://github.com/vim-scripts/The-NERD-tree.git
" BUNDLE: git://github.com/Shougo/vimfiler.git
" #BUNDLE: git://github.com/Shougo/vimshell.git
" #BUNDLE: git://github.com/Shougo/vimproc.git
" BUNDLE: git://github.com/Shougo/unite.vim.git
" BUNDLE: git://github.com/tsukkee/unite-tag.git
"---------------------------------------------
"開発系
"---------------------------------------------
" BUNDLE: git://github.com/thinca/vim-ref.git
" BUNDLE: git://github.com/motemen/git-vim.git
" BUNDLE: git://github.com/vim-scripts/Gist.vim.git
" BUNDLE: git://github.com/vim-scripts/Source-Explorer-srcexpl.vim.git
"---------------------------------------------
"その他
"---------------------------------------------
" }}}

" basic setting {{{
let mapleader = "\<Space>"
set number
syntax on
filetype plugin on
filetype indent on
set laststatus=2
set cmdheight=1
set showcmd
set wrap
set showmatch
set showtabline=1
" }}}

" encode {{{
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,euc-jp,cp932,iso-2022-jp
set fileformats=unix,dos,mac
" }}}

" status line {{{
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set wildmode=list:longest
" }}}

" search {{{
set history=256
set incsearch
set ignorecase
set smartcase
set hlsearch
" }}}

" tabkey {{{
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noautoindent
" }}}

" colorscheme {{{
"colorscheme desert
if &t_Co > 2
    " set t_Co=256
    colorscheme desert256
endif
" }}}

" backup {{{
set nobackup
"set writebackup
"set backup
"set backupdir=~/.vimbak
"set directory=~/.vimswp
" }}}

" highlight {{{
"Escの2回押しでハイライト消去
nnoremap <ESC><ESC> :nohlsearch<Enter><ESC>

" OSのクリップボードを使用する
set clipboard=unnamed

" カーソル行をハイライト
set cursorline
":highlight clear CursorLine
":highlight CursorLine gui=underline
"highlight CursorLine ctermbg=blue guibg=blue

" 全角スペースに青い下線を引く
if exists('&ambiwidth')
    set ambiwidth=double
endif
highlight ZenkakuLeader cterm=underline ctermfg=lightblue
3match ZenkakuLeader /　/

" タブに緑の下線を引く
"set list
"set listchars=tab:\ \ ,trail:\ 
"highlight SpecialKey cterm=underline ctermfg=lightgreen
highlight TabLeader cterm=underline ctermfg=lightgreen
3match TabLeader /	/
" }}}

"http://d.hatena.ne.jp/yuichi_katahira/20090117/1232209418
"vimの改行時に自動でコメントが挿入されるのをやめたい
autocmd FileType * setlocal formatoptions-=ro

"バッファの自動保存
"http://vim-users.jp/2009/07/hack36/
"set autowrite
" set autowriteall
"autocmd CursorHold *  wall
"autocmd CursorHoldI *  wall

" ctags {{{
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

" move {{{
"表示行単位で行移動する
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"Windowの移動
function! s:max_width()
  let width = 1024
  if winwidth(0) < width
    execute "vertical resize" width
  endif
endfunction
function! s:max_height()
  let height = 786
  if winheight(0) < height
    execute "resize" height
  endif
endfunction
nnoremap <C-o> :<C-u>call <SID>max_width()<Enter>:<C-u>call <SID>max_height()<Enter>
nnoremap <C-c><C-c> :<C-u>quit<Enter>
nnoremap + <C-w>+
nnoremap - <C-w>-
nnoremap { <C-w><
nnoremap } <C-w>>
nnoremap = <C-w>=

"Insert Mode での移動
inoremap <C-h> <LEFT>
inoremap <C-l> <RIGHT>
inoremap <C-j> <UP>
inoremap <C-k> <DOWN>

inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
"inoremap <C-u> <C-o>d0
inoremap <C-u> <C-o>u
inoremap <C-r> <C-o><C-r>
inoremap <C-d> <C-o>D
inoremap <C-x> <Del>
inoremap <C-v> <C-o>"*p

"Command Mode での移動
cnoremap <C-h> <LEFT>
cnoremap <C-l> <RIGHT>
" }}}

" Vim Open /close {{{
"素早く保存、終了
nnoremap <Leader>w :<C-u>write<Enter>
nnoremap <Leader>q :<C-u>quit<Enter>
nnoremap <C-q>     :<C-u>quit<Enter>
nnoremap <Leader>Q :<C-u>quitall<Enter>
"バッファが編集中でもその他のファイルを開けるように
set hidden
"外部のエディタで編集中のファイルが変更されたら自動で読み直す
set autoread
" }}}

"<Leader>e でそのコマンドを実行
nnoremap <Leader>r :QuickRun<Enter>

"vimrcを読んだり書いたり
nnoremap <Leader>.. :<C-u>source ~/.vimrc<Enter>
nnoremap <Leader>.e :<C-u>edit ~/.vimrc<Enter>
nnoremap <Leader>.E :<C-u>vnew ~/.vimrc<Enter>

" tab {{{
nnoremap <C-@>      :<C-u>tabnew<Enter>
nnoremap <Leader>@  :<C-u>tabnew<Enter>
nnoremap <C-l>      :<C-u>tabn<Enter>
nnoremap <C-h>      :<C-u>tabp<Enter>
nnoremap <Leader>m0 :<C-u>tabmove 0<Enter>
nnoremap <Leader>m1 :<C-u>tabmove 1<Enter>
nnoremap <Leader>m2 :<C-u>tabmove 2<Enter>
nnoremap <Leader>m3 :<C-u>tabmove 3<Enter>
nnoremap <Leader>m4 :<C-u>tabmove 4<Enter>
nnoremap <Leader>m5 :<C-u>tabmove 5<Enter>
nnoremap <Leader>m6 :<C-u>tabmove 6<Enter>
nnoremap <Leader>m7 :<C-u>tabmove 7<Enter>
nnoremap <Leader>m8 :<C-u>tabmove 8<Enter>
nnoremap <Leader>m9 :<C-u>tabmove 9<Enter>
" }}}

" buffer {{{
nnoremap <C-j> :<C-u>bn!<Enter>
nnoremap <C-k> :<C-u>bp!<Enter>
" }}}

" toggle {{{
function! ToggleNumber()
    if &number == 0
        set number
    else
        set nonumber
    endif
endfunction
nnoremap <silent> <Leader>j :call ToggleNumber()<Enter>
function! ToggleCursorLine()
    if &cursorline == 0
        set cursorline
    else
        set nocursorline
    endif
endfunction
nnoremap <silent> <Leader>k :call ToggleCursorLine()<Enter>
" }}}

" vimを終了してもUndoする {{{
"http://vim-users.jp/2010/07/hack162/
if has('persistent_undo')
  set undodir=~/.vimundo
  augroup vimrc-undofile
    autocmd!
    autocmd BufReadPre ~/* setlocal undofile
  augroup END
endif
"}}}

" vim戦闘力を測る {{{
"http://d.hatena.ne.jp/thinca/20091031/1257001194
function! Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)
" }}}

" omni completion  {{{
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete
" }}}

" -------- plugin --------
" Gist.vim {{{
if has('mac')
    let g:gist_clip_command = 'pbcopy'
else
    let g:gist_clip_command = 'xclip -selection clipboard'
endif
" }}}

" git-vim (motemen) {{{
"let g:git_command_edit = 'rightbelow vnew'
nnoremap <Leader>gd :<C-u>GitDiff --no-prefix --cached<Enter>
nnoremap <Leader>gD :<C-u>GitDiff --no-prefix<Enter>
nnoremap <Leader>gs :<C-u>GitStatus<Enter>
nnoremap <Leader>gl :<C-u>GitLog<Enter>
nnoremap <Leader>gL :<C-u>GitLog -u \| head -10000<Enter>
if globpath(&rtp, 'plugin/shadow.vim') != ''
  nnoremap <Leader>ga :<C-u>call GitAddBoth()<Enter>
else
  nnoremap <Leader>ga :<C-u>GitAdd<Enter>
endif
nnoremap <Leader>gA :<C-u>GitAdd <cfile><Enter>
nnoremap <Leader>gc :<C-u>GitCommit<Enter>
nnoremap <Leader>gC :<C-u>GitCommit --amend<Enter>
nnoremap <Leader>gp :<C-u>Git push
" }}}

" unite-tag {{{
nnoremap <C-]> :<C-u>UniteWithCursorWord -immediately tag<Enter>
nnoremap <silent> <Leader>ft :<C-u>Unite tag<Enter>
" }}}

" unite.vim {{{
"let g:unite_enable_start_insert=1
let g:unite_source_file_mru_limit = 200

" バッファ一覧
nnoremap <silent> <Leader>fb :<C-u>Unite buffer<Enter>
" ファイル一覧
nnoremap <silent> <Leader>fl :<C-u>UniteWithBufferDir -buffer-name=files file<Enter>
" レジスタ一覧
nnoremap <silent> <Leader>fr :<C-u>Unite -buffer-name=register register<Enter>
" 最近使用したファイル一覧
nnoremap <silent> <Leader>fm :<C-u>Unite file_mru<Enter>
" 常用セット
nnoremap <silent> <Leader>ff :<C-u>Unite buffer file_mru<Enter>
" 全部乗せ
nnoremap <silent> <Leader>fa :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<Enter>

" ウィンドウを分割して開く
autocmd FileType unite :nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
autocmd FileType unite :inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
" ウィンドウを縦に分割して開く
autocmd FileType unite :nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
autocmd FileType unite :inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
" ESCキーを押すと終了する
autocmd FileType unite :nnoremap <silent> <buffer> <ESC><ESC> :q<Enter>
" }}}

" neocomplcache {{{
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
" 日本語をキャッシュしない
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" 補完候補の数
"let g:neocomplcache_max_list = 5
" 1番目の候補を自動選択
let g:neocomplcache_enable_auto_select = 1
" snippet ファイルの保存先
let g:neocomplcache_snippets_dir='~/.vim/bundle/snipMate/snippets'

" 辞書読み込み
noremap  <Leader>n. :<C-u>NeoComplCacheCachingDictionary<Enter>

" スニペット
"imap <C-k> <Plug>(neocomplcache_snippets_expand)
"smap <C-k> <Plug>(neocomplcache_snippets_expand)
" <TAB> completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" C-oでオムニ補完
inoremap <expr><C-o> &filetype == 'vim' ? "\<C-x>\<C-v>\<C-p>" : "\<C-x>\<C-o>\<C-p>"
" C-nでneocomplcache補完
inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
" C-pでkeyword補完
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
" 補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><Enter>  pumvisible() ? neocomplcache#close_popup() : "<Enter>"
" 補完をキャンセル
inoremap <expr><C-c>  neocomplcache#cancel_popup()
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" }}}

" vimfiler {{{
" :help vimfiler-examples
call vimfiler#set_execute_file('vim', 'vim')
call vimfiler#set_execute_file('txt', 'notepad')
"let g:vimfiler_split_command = ''
"let g:vimfiler_edit_command = 'tabedit'
"let g:vimfiler_pedit_command = 'vnew'
let g:vimfiler_external_copy_directory_command = 'cp -r $src $dest'
let g:vimfiler_external_copy_file_command = 'cp $src $dest'
let g:vimfiler_external_delete_command = 'rm -r $srcs'
let g:vimfiler_external_move_command = 'mv $srcs $dest'
"let g:vimfiler_as_default_explorer = 1
let g:vimfiler_as_default_explorer = 0
" Enable file operation commands.
"let g:vimfiler_safe_mode_by_default = 0 
"nnoremap <Leader>E :<C-u>VimFilerSplit<Enter>
" }}}

" vimshell {{{
let g:vimshell_split_command = 'split'
let g:vimshell_smart_case = 1
let g:vimshell_prompt = $USER."% "
"let g:vimshell_user_prompt = 'printf("%s %s", fnamemodify(getcwd(), ":~"), vimshell#vcs#info("(%s)-[%b]"))'
autocmd FileType vimshell
  \ call vimshell#hook#set('chpwd', ['g:chpwd_for_vimshell'])
function! g:chpwd_for_vimshell(args, context)
  call vimshell#execute('ls')
endfunction
"nnoremap <Leader>ss :<C-u>VimShellPop<Enter>
nnoremap <Leader>ss :<C-u>VimShell<Enter>
nnoremap <Leader>SS :<C-u>VimShellTerminal 
nnoremap <Leader>sh :<C-u>VimShellTerminal bash<Enter>
nnoremap <Leader>py :<C-u>VimShellTerminal python<Enter>
" }}}

" vim-ref {{{
let g:ref_open = 'tabnew'
nnoremap <Leader>/ :<C-u>Ref alc <C-r><C-w><Enter>
nnoremap <Leader>? :<C-u>Ref alc<Space>
autocmd FileType python :nnoremap <Leader>/ :<C-u>Ref pydoc <C-r><C-w><Enter>
autocmd FileType python :nnoremap <Leader>? :<C-u>Ref pydoc<Space>
autocmd FileType erlang :nnoremap <Leader>/ :<C-u>Ref erlang <C-r><C-w><Enter>
autocmd FileType erlang :nnoremap <Leader>? :<C-u>Ref erlang<Space>
autocmd FileType perl   :nnoremap <Leader>/ :<C-u>Ref perldoc <C-r><C-w><Enter>
autocmd FileType perl   :nnoremap <Leader>? :<C-u>Ref perldoc<Space>
autocmd FileType sh     :nnoremap <Leader>/ :<C-u>Ref man <C-r><C-w><Enter>
autocmd FileType sh     :nnoremap <Leader>? :<C-u>Ref man<Space>
" }}}

" surround {{{
" 選択範囲を指定文字でくくる
nmap s <Plug>Ysurround
nmap ss <Plug>Yssurround
" }}}

" grep {{{
" カーソル下の単語をGrepBufferする
nnoremap <Leader>gg :<C-u>GrepBuffer <C-r><C-w><Enter>
nnoremap <Leader>GG :<C-u>GrepBuffer 
" }}}

" tlist {{{
nnoremap <silent> <Leader>h :<C-u>TlistToggle<Enter><C-w>h
" }}}

" NERD_tree {{{
nnoremap <silent> <Leader>l :NERDTreeToggle<Enter>
" 右に表示
let g:NERDTreeWinPos = "right"
" デフォルトのファイラを変更しない
let g:NERDTreeHijackNetrw = 0
" }}}

" javacomplete {{{
autocmd FileType java :setlocal omnifunc=javacomplete#Complete
autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo
" }}}
