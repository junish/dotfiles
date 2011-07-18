" TODO {{{
" TODO: surround(How to)
" TODO: NERD-Commenter(How to)
" }}}

" init {{{
filetype on
filetype plugin on
"filetype indent on
"filetype indent plugin on
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" 現在の autocommand を全て削除する
autocmd!
" }}}

" vim-update-bundles {{{
"---------------------------------------------
" BUNDLE: git://github.com/vim-scripts/pathogen.vim.git
"---------------------------------------------
" BUNDLE: git://github.com/vim-scripts/desert256.vim.git
" BUNDLE: git://github.com/vim-scripts/Lucius.git
" BUNDLE: git://github.com/vim-scripts/scala.vim.git
" BUNDLE: git://github.com/vim-scripts/jQuery.git
" BUNDLE: git://github.com/vim-scripts/taglist.vim.git
" BUNDLE: git://github.com/vim-scripts/matchit.zip.git
"---------------------------------------------
" BUNDLE: git://github.com/vim-scripts/Align.git
" BUNDLE: git://github.com/vim-scripts/surround.vim.git
" BUNDLE: git://github.com/vim-scripts/The-NERD-Commenter.git
" BUNDLE: git://github.com/vim-scripts/YankRing.vim.git
" BUNDLE: git://github.com/vim-scripts/quickrun.vim.git
" BUNDLE: git://github.com/vim-scripts/neocomplcache.git
" BUNDLE: git://github.com/msanders/snipmate.vim.git
" BUNDLE: git://github.com/vim-scripts/sudo.vim.git
" BUNDLE: git://github.com/vim-scripts/javacomplete.git
"---------------------------------------------
" BUNDLE: git://github.com/vim-scripts/eregex.vim.git
" BUNDLE: git://github.com/vim-scripts/grep.vim.git
" BUNDLE: git://github.com/Sixeight/unite-grep.git
" BUNDLE: git://github.com/sgur/unite-qf.git
" BUNDLE: git://github.com/t9md/vim-unite-ack.git
"---------------------------------------------
" BUNDLE: git://github.com/vim-scripts/The-NERD-tree.git
" BUNDLE: git://github.com/Shougo/vimfiler.git
" #BUNDLE: git://github.com/Shougo/vimshell.git
" #BUNDLE: git://github.com/Shougo/vimproc.git
" BUNDLE: git://github.com/ervandew/screen.git
" BUNDLE: git://github.com/Shougo/unite.vim.git
" BUNDLE: git://github.com/tsukkee/unite-tag.git
"---------------------------------------------
" BUNDLE: git://github.com/thinca/vim-ref.git
" BUNDLE: git://github.com/motemen/git-vim.git
" BUNDLE: git://github.com/vim-scripts/Gist.vim.git
" BUNDLE: git://github.com/vim-scripts/Source-Explorer-srcexpl.vim.git
" BUNDLE: git://github.com/vim-scripts/TaskList.vim.git
" BUNDLE: git://github.com/oscarh/vimerl.git integration
" BUNDLE: git://github.com/vim-scripts/vim-erlang-skeleteons.git
" BUNDLE: git://github.com/vim-scripts/python_open_module.git
" BUNDLE: git://github.com/vim-scripts/virtualenv.vim.git
" #BUNDLE: git://github.com/vim-scripts/VimPdb.git
" BUNDLE: git://github.com/vim-scripts/neco-look.git
" BUNDLE: git://github.com/vim-scripts/project.tar.gz.git
" BUNDLE: git://github.com/kana/vim-fakeclip.git
" BUNDLE: git://github.com/vim-scripts/Google-translator.git
" BUNDLE: git://github.com/kevinw/pyflakes-vim.git
" BUNDLE: git://github.com/kevinw/pyflakes.git
" ln -s ~/.vim/bundle/pyflakes/* ~/.vim/bundle/pyflakes-vim/ftplugin/python/pyflakes/.
"---------------------------------------------
" }}}

" basic setting {{{
let mapleader = "\<Space>"
set nonumber
syntax on
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
     set t_Co=256
    "colorscheme desert256
    colorscheme lucius
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
nnoremap <silent> <ESC><ESC> :nohlsearch<Enter><ESC>

" OSのクリップボードを使用する
"set clipboard=unnamed

" カーソル行をハイライト
set nocursorline
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

" comment {{{
" vimの改行時に自動でコメントが挿入されるのをやめたい
"http://d.hatena.ne.jp/yuichi_katahira/20090117/1232209418
autocmd FileType * setlocal formatoptions-=ro
" }}}

" exit {{{
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
inoremap <C-q> <ESC>
nnoremap <C-q> <ESC>
" }}}

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
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj
nnoremap <UP> gk
nnoremap <DOWN> gj
vnoremap <UP> gk
vnoremap <DOWN> gj

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
nnoremap + <C-w>+
nnoremap - <C-w>-
nnoremap { <C-w><
nnoremap } <C-w>>
nnoremap = <C-w>=

"Insert Mode での移動
"inoremap <C-h> <C-o>gh
"inoremap <C-l> <C-o>gl
"inoremap <C-k> <C-o>gk
"inoremap <C-j> <C-o>gj

inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
"inoremap <C-u> <C-o>d0
inoremap <C-u> <C-o>u
inoremap <C-r> <C-o><C-r>
inoremap <C-d> <C-o>D
inoremap <C-v> <C-o>"*p

"Command Mode での移動
cnoremap <C-h> <LEFT>
cnoremap <C-l> <RIGHT>
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

" vimrc {{{
" vimrcを読んだり書いたり
nnoremap <Leader>.. :<C-u>source ~/.vimrc<Enter>
nnoremap <Leader>.e :<C-u>edit ~/.vimrc<Enter>
nnoremap <Leader>.E :<C-u>vnew ~/.vimrc<Enter>
" }}}

" tab {{{
nnoremap <Leader>p  :<C-u>tabnew<Enter>
nnoremap <Leader>l  :<C-u>tabn<Enter>
nnoremap <Leader>h  :<C-u>tabp<Enter>
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
nnoremap <silent> <Leader>j :<C-u>bn!<Enter>
nnoremap <silent> <Leader>k :<C-u>bp!<Enter>
" }}}

" toggle {{{
nnoremap <silent> <C-j> :<C-u>set invnumber<Enter>
nnoremap <silent> <C-k> :<C-u>set invcursorline<Enter>
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

" -------------------- plugin --------------------
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
let g:unite_enable_start_insert=0
"let g:unite_source_file_mru_limit = 200

" 常用
nnoremap <Leader>ff :<C-u>Unite source<Enter>
" Grep
nnoremap <Leader>fg :<C-u>Unite grep:-iR
" Ref
nnoremap <Leader>f/ :<C-u>Unite ref/

" ファイル再帰表示
nnoremap <silent> <Leader>fr :<C-u>Unite file_rec<Enter>
" バッファ一覧
nnoremap <silent> <Leader>fb :<C-u>Unite buffer<Enter>
" ファイル一覧
nnoremap <silent> <Leader>fl :<C-u>UniteWithBufferDir -buffer-name=files file<Enter>
" 最近使用したファイル一覧
nnoremap <silent> <Leader>fm :<C-u>Unite file_mru<Enter>
" ファイル関連全て
nnoremap <silent> <Leader>fa :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<Enter>
" Snippet
nnoremap <silent> <Leader>fs :<C-u>Unite snippet<Enter>
" Command
nnoremap <silent> <Leader>fc :<C-u>Unite Command


function! s:unite_my_settings()
    " ウィンドウを分割して開く
    autocmd FileType unite :nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
    autocmd FileType unite :inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
    " ウィンドウを縦に分割して開く
    autocmd FileType unite :nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
    autocmd FileType unite :inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
    " ESC*2で終了する
    autocmd FileType unite :nnoremap <silent> <buffer> <ESC><ESC> :q<Enter>
    autocmd FileType unite :inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
endfunction
autocmd FileType unite call s:unite_my_settings()

" 様々なショートカット
call unite#set_substitute_pattern('file', '\$\w\+', '\=eval(submatch(0))', 200)
call unite#set_substitute_pattern('file', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/"', 2)
call unite#set_substitute_pattern('file', '^@', '\=getcwd()."/*"', 1)
call unite#set_substitute_pattern('file', '^;r', '\=$VIMRUNTIME."/"')
call unite#set_substitute_pattern('file', '^\~', escape($HOME, '\'), -2)
call unite#set_substitute_pattern('file', '\\\@<! ', '\\ ', -20)
call unite#set_substitute_pattern('file', '\\ \@!', '/', -30)
" }}}

" vimerl integrate branch {{{
autocmd FileType erlang :setlocal omnifunc=erlangcomplete#Complete
let g:erlangManPath = '/usr/lib64/erlang/man'
" let g:erlangFold=1
" let g:erlangFoldSplitFunction=1
let g:erlangCheckFile = "~/.vim/bundle/vimerl/compiler/erlang_check.erl"
let g:erlangCompleteFile  = '~/.vim/bundle/vimerl/autoload/erlang_complete.erl'
let g:erlangRefactoring = 1
" }}}

" neocomplcache {{{
" autocmd BufFilePost \[ref-* silent execute ":NeoComplCacheCachingBuffer"
" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

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
let g:neocomplcache_min_keyword_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_same_filetype_lists = {
    \ 'c' : 'ref-man,ref-erlang',
    \ 'erlang' : 'ref-erlang',
    \ 'int-erl' : 'erlang,ref-erlang'
    \ }
let g:neocomplcache_keyword_patterns = {
    \ 'erlang' : '\v\h\w*:(\h\w+)*'
    \}
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'    : '',
    \ 'vimshell'   : $HOME.'/.vimshell_hist',
    \ 'erlang'     : $HOME.'/.vim/dict/erlang.dict',
    \ 'javascript' : $HOME . '/.vim/dict/javascript.dict'
    \ }

" 補完候補の数
let g:neocomplcache_max_list = 1000
" 1番目の候補を自動選択
let g:neocomplcache_enable_auto_select = 1
" 辞書読み込み
noremap  <Leader>n. :<C-u>NeoComplCacheCachingDictionary<Enter>

" スニペット
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
let g:neocomplcache_snippets_dir='~/.vim/bundle/snipmate.vim/snippets'

" <TAB> completion.
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

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
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
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
"let g:vimshell_split_command = 'split'
"let g:vimshell_smart_case = 1
"let g:vimshell_prompt = $USER."% "
"let g:vimshell_user_prompt = 'printf("%s %s", fnamemodify(getcwd(), ":~"), vimshell#vcs#info("(%s)-[%b]"))'
"autocmd FileType vimshell
"  \ call vimshell#hook#set('chpwd', ['g:chpwd_for_vimshell'])
"function! g:chpwd_for_vimshell(args, context)
"  call vimshell#execute('ls')
"endfunction
"nnoremap <Leader>s :<C-u>VimShell<Enter>
"nnoremap <Leader>S :<C-u>VimShellTerminal 
"autocmd FileType erlang :nnoremap <Leader>s :<C-u>VimShellTerminal /usr/bin/erl<Enter>
"autocmd FileType python :nnoremap <Leader>s :<C-u>VimShellTerminal /usr/bin/python<Enter>
"autocmd FileType sh     :nnoremap <Leader>s :<C-u>VimShellTerminal bash<Enter>
" }}}

" vim-ref {{{
let g:ref_open = 'tabnew'
nnoremap <Leader>/ :<C-u>Ref alc <C-r><C-w><Enter>
nnoremap <Leader>? :<C-u>Ref alc <C-r><C-w>
autocmd FileType python :nnoremap <Leader>/ :<C-u>Ref pydoc <C-r><C-w><Enter>
autocmd FileType python :nnoremap <Leader>? :<C-u>Ref pydoc <C-r><C-w>
autocmd FileType erlang :nnoremap <Leader>/ :<C-u>Ref erlang <C-r><C-w><Enter>
autocmd FileType erlang :nnoremap <Leader>? :<C-u>Ref erlang <C-r><C-w>
autocmd FileType perl   :nnoremap <Leader>/ :<C-u>Ref perldoc <C-r><C-w><Enter>
autocmd FileType perl   :nnoremap <Leader>? :<C-u>Ref perldoc <C-r><C-w>
autocmd FileType sh     :nnoremap <Leader>/ :<C-u>Ref man <C-r><C-w><Enter>
autocmd FileType sh     :nnoremap <Leader>? :<C-u>Ref man <C-r><C-w>
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
nnoremap <silent> <C-h> :<C-u>TlistToggle<Enter>
" }}}

" NERD_tree {{{
nnoremap <silent> <C-l> :NERDTreeToggle<Enter>
" 右に表示
let g:NERDTreeWinPos = "right"
" デフォルトのファイラを変更しない
let g:NERDTreeHijackNetrw = 0

"let g:NERDTreeQuitOnOpen = 1
"let g:NERDTreeChDirMode = 1
" }}}

" javacomplete {{{
autocmd FileType java :setlocal omnifunc=javacomplete#Complete
autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo
" }}}

" TaskList {{{
let g:tlWindowPosition = 1
let Tlist_Auto_Highlight_Tag = 1
"let Tlist_Auto_Open = 1
let Tlist_Display_Tag_Scope = 1
let Tlist_Compact_Format = 1
" }}}

" vim-erlang-skeleteons {{{
let g:erl_author = "Junichi Shinohara"
"let g:erl_company = "HDE Inc"
let g:erl_replace_buffer=1
"let g:erl_tpl_dir="/home/junichi/.templates"
" }}}

" Pydiction {{{
    let g:pydiction_location = ' ~/.vim/bundle/Pydiction/complete-dict'
" }}}

" quickrun {{{
" <Leader>e でそのコマンドを実行
nnoremap <Leader>r :QuickRun<Enter>
let g:quickrun_config = {}
let g:quickrun_config.erlang = {'command' : 'erle'}
" }}}

" project.vim {{{
nmap <silent> <C-a> <Plug>ToggleProject
" }}}

" screen.vim {{{
nmap <silent> <C-s><C-a> :ScreenShell<CR>
nmap <silent> <C-s><C-s> vip:ScreenSend<CR>
vmap <silent> <C-s><C-s> :ScreenSend<CR>
nmap <silent> <C-s><C-q> :ScreenQuit<CR>
autocmd FileType python :nmap <C-s><C-a> :ScreenShell python<CR>
autocmd FileType erlang :nmap <C-s><C-a> :ScreenShell erl<CR>
" }}}

" Google-translator {{{
let g:langpair = 'en|ja'
let g:vtranslate = "T"
" }}}
