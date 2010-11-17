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
" #BUNDLE: https://github.com/vim-scripts/pathogen.vim.git
"---------------------------------------------
"表示系
"---------------------------------------------
" BUNDLE: https://github.com/vim-scripts/desert256.vim.git
" BUNDLE: https://github.com/vim-scripts/scala.vim.git
" BUNDLE: https://github.com/vim-scripts/jQuery.git
" BUNDLE: https://github.com/DexterTheDragon/vim-rest.git
" BUNDLE: https://github.com/vim-scripts/Smooth-Scroll.git
" BUNDLE: https://github.com/vim-scripts/taglist.vim.git
" #BUNDLE: https://github.com/vim-scripts/Source-Explorer-srcexpl.vim.git
" BUNDLE: https://github.com/vim-scripts/matchit.zip.git
"---------------------------------------------
"編集系
"---------------------------------------------
" BUNDLE: https://github.com/vim-scripts/Align.git
" BUNDLE: https://github.com/vim-scripts/surround.vim.git
" BUNDLE: https://github.com/vim-scripts/The-NERD-Commenter.git
" BUNDLE: https://github.com/vim-scripts/YankRing.vim.git
" BUNDLE: https://github.com/vim-scripts/quickrun.vim.git
" BUNDLE: https://github.com/vim-scripts/neocomplcache.git
" BUNDLE: https://github.com/vim-scripts/snipMate.git
" BUNDLE: https://github.com/vim-scripts/sudo.vim.git
" BUNDLE: https://github.com/vim-scripts/javacomplete.git
"---------------------------------------------
"検索系
"---------------------------------------------
" BUNDLE: https://github.com/vim-scripts/eregex.vim.git
" BUNDLE: https://github.com/vim-scripts/grep.vim.git
"---------------------------------------------
"バッファ管理系
"---------------------------------------------
" BUNDLE: https://github.com/Shougo/unite.vim.git
"---------------------------------------------
"ファイル系
"---------------------------------------------
" BUNDLE: https://github.com/vim-scripts/The-NERD-tree.git
" BUNDLE: https://github.com/Shougo/vimfiler.git
" BUNDLE: https://github.com/Shougo/vimshell.git
"---------------------------------------------
"開発系
"---------------------------------------------
" BUNDLE: https://github.com/thinca/vim-ref.git
" BUNDLE: https://github.com/motemen/git-vim.git
" BUNDLE: https://github.com/vim-scripts/Gist.vim.git
" #BUNDLE: https://github.com/vim-scripts/trinity.vim.git
"---------------------------------------------
"その他
"---------------------------------------------
" BUNDLE: https://github.com/Shougo/vimproc.git
" BUNDLE: https://github.com/guyon/quiz-vim.git
" #BUNDLE: https://github.com/vim-scripts/NERD_tree-Project.git
" #BUNDLE: https://github.com/vim-scripts/FindInNERDTree.git
" #BUNDLE: https://github.com/vim-scripts/trinity.vim.git
" }}}

" basic setting {{{
let mapleader = "\<Space>"
set number
syntax on
filetype plugin on
filetype indent on
set laststatus=2
set cmdheight=2
set showcmd
set wrap
set showmatch
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
nmap <ESC><ESC> :nohlsearch<Enter><ESC>

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
function! s:change_width()
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
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-o> :<C-u>call <SID>max_width()<Enter>:<C-u>call <SID>max_height()<Enter>
nnoremap <C-c><C-c> :<C-u>quit<Enter>
nnoremap + <C-w>+
nnoremap - <C-w>-
nnoremap <S-LEFT> <C-w><
nnoremap <S-RIGHT> <C-w>>
nnoremap = <C-w>=

"Insert Mode での移動
"inoremap <C-h> <LEFT>
inoremap <C-l> <RIGHT>

" Insert Mode で Bashな操作
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
inoremap <C-u> <C-o>d0
inoremap <C-k> <C-o>D
"inoremap <C-h> <C-o>X "TODO 先頭末尾の処理
"inoremap <BS> <C-o>X "TODO 先頭末尾の処理
inoremap <C-d> <C-o>x
inoremap <Delete> <C-o>x
"inoremap <C-w> <C-o>TODO

"Command Mode での移動
cnoremap <C-h> <LEFT>
cnoremap <C-l> <RIGHT>
" }}}

" vimのヘルプを素早く引く
nnoremap <Leader>hh :<C-u>help<Space><C-r><C-w><Enter>
nnoremap <Leader>HH :<C-u>help<Space>

" Vim Open /close {{{
"素早く保存、終了
nnoremap <Leader>w :<C-u>write<Enter>
nnoremap <Leader>q :<C-u>quit<Enter>
nnoremap <Leader>Q :<C-u>quitall<Enter>
"バッファが編集中でもその他のファイルを開けるように
set hidden
"外部のエディタで編集中のファイルが変更されたら自動で読み直す
set autoread
" }}}

"<Leader>e でそのコマンドを実行
"nnoremap <Leader>r :execute '!' &ft ' %'<Enter>
nnoremap <Leader>r :QuickRun<Enter>

"vimrcを読んだり書いたり
nnoremap <Leader>.. :<C-u>source ~/.vimrc<Enter>
nnoremap <Leader>.e :<C-u>edit ~/.vimrc<Enter>
nnoremap <Leader>.E :<C-u>vnew ~/.vimrc<Enter>

" tab {{{
"https://github.com/cooldaemon/myhome.git
nnoremap <Leader>t :tabnew<Enter>
nnoremap <Leader>T :tabclose<Enter>
"nnoremap <RIGHT> :tabn<Enter>
"nnoremap <LEFT> :tabp<Enter>
nnoremap <Leader>l :tabn<Enter>
nnoremap <Leader>h :tabp<Enter>
" }}}

" buffer {{{
"https://github.com/cooldaemon/myhome.git
"nnoremap <DOWN> :bn!<Enter>
"nnoremap <UP> :bp!<Enter>
nnoremap <Leader>j :bn!<Enter>
nnoremap <Leader>k :bp!<Enter>
" }}}

" toggle {{{
function! ToggleNumber()
    if &number == 0
        set number
    else
        set nonumber
    endif
endfunction
nnoremap <Leader>n :call ToggleNumber()<Enter>
function! ToggleCursorLine()
    if &cursorline == 0
        set cursorline
    else
        set nocursorline
    endif
endfunction
nnoremap <Leader>c :call ToggleCursorLine()<Enter>
" }}}

" html escape function {{{
function! HtmlEscape() 
    silent s/&/\&amp;/eg 
    silent s/</\&lt;/eg 
    silent s/>/\&gt;/eg 
endfunction 

function! HtmlUnEscape() 
    silent s/&lt;/</eg 
    silent s/&gt;/>/eg 
    silent s/&amp;/\&/eg 
endfunction
" }}}

"vimを終了してもUndoする
"http://vim-users.jp/2010/07/hack162/
if has('persistent_undo')
  set undodir=~/.vimundo
  augroup vimrc-undofile
    autocmd!
    autocmd BufReadPre ~/* setlocal undofile
  augroup END
endif

"vim戦闘力を測る
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

" unite.vim {{{
" http://d.hatena.ne.jp/thinca/20101027/1288190498
call unite#set_substitute_pattern('file', '\$\w\+', '\=eval(submatch(0))', 200)
call unite#set_substitute_pattern('file', '[^~.]\zs/', '*/*', 20)
call unite#set_substitute_pattern('file', '/\ze[^*]', '/*', 10)
call unite#set_substitute_pattern('file', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/*"', 2)
call unite#set_substitute_pattern('file', '^@', '\=getcwd()."/*"', 1)
call unite#set_substitute_pattern('file', '^\\', '~/*')
call unite#set_substitute_pattern('file', '^;v', '~/.vim/*')
call unite#set_substitute_pattern('file', '^;r', '\=$VIMRUNTIME."/*"')
call unite#set_substitute_pattern('file', '\*\*\+', '*', -1)
call unite#set_substitute_pattern('file', '^\~', escape($HOME, '\'), -2)
call unite#set_substitute_pattern('file', '\\\@<! ', '\\ ', -20)
call unite#set_substitute_pattern('file', '\\ \@!', '/', -30)

nnoremap <Leader>fu :<C-u>Unite buffer file_mru bookmark file<Enter>
nnoremap <Leader>FU :<C-u>Unite 
nnoremap <Leader>ff :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<Enter>
nnoremap <Leader>fb :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<Enter>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    " Overwrite settings.
    nmap <buffer> <ESC> <Plug>(unite_exit)
    imap <buffer> jj <Plug>(unite_insert_leave)
    "imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
    " Start insert.
    "let g:unite_enable_start_insert = 1
endfunction"}}}
let g:unite_source_file_mru_limit = 200
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
"let g:neocomplcache_snippets_dir='~/.vim/snippets'

" 辞書読み込み
noremap  <Leader>n. :<C-u>NeoComplCacheCachingDictionary<Enter>

" スニペット
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
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
nnoremap <Leader>E :<C-u>VimFilerSplit<Enter>
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
nnoremap <Leader>hm :<C-u>Ref man <C-r><C-w><Enter>
nnoremap <Leader>HM :<C-u>Ref man 
nnoremap <Leader>hp :<C-u>Ref pydoc <C-r><C-w><Enter>
nnoremap <Leader>HP :<C-u>Ref pydoc 
nnoremap <Leader>he :<C-u>Ref erlang <C-r><C-w><Enter>
nnoremap <Leader>HE :<C-u>Ref erlang 
"nnoremap <Leader>hj :<C-u>Ref jsdoc <C-r><C-w><Enter>
"nnoremap <Leader>HJ :<C-u>Ref jsdoc 
"nnoremap <Leader>hsc :<C-u>Ref scaladoc <C-r><C-w><Enter>
"nnoremap <Leader>HSC :<C-u>Ref scaladoc 
"nnoremap <Leader>hr :<C-u>Ref rubydoc <C-r><C-w><Enter>
"nnoremap <Leader>HR :<C-u>Ref rubydoc 
"nnoremap <Leader>hph :<C-u>Ref phpdoc <C-r><C-w><Enter>
"nnoremap <Leader>HPH :<C-u>Ref phpdoc 
" }}}

" surround {{{
" 選択範囲を指定文字でくくる
nmap s <Plug>Ysurround
nmap ss <Plug>Yssurround
" }}}

" grep {{{
" カーソル下の単語をGrepBufferする
nnoremap <Leader>gg :<C-u>GrepBuffer <C-r><C-w><Enter>
" }}}

" tlist {{{
nnoremap e :<C-u>TlistToggle<Enter>
" }}}

" NERD_tree {{{
nnoremap E :NERDTreeToggle<Enter>
let g:NERDTreeWinPos = "right"
" }}}

" javacomplete {{{
autocmd FileType java :setlocal omnifunc=javacomplete#Complete
autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo
" }}}
