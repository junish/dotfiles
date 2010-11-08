" pathogen {{{
filetype off
call pathogen#runtime_append_all_bundles()
filetype indent plugin on
" }}}

"http://d.hatena.ne.jp/yuichi_katahira/20090117/1232209418
"vimの改行時に自動でコメントが挿入されるのをやめたい
autocmd FileType * setlocal formatoptions-=ro

" vim-update-bundles {{{
"vim-scripts
" BUNDLE: https://github.com/vim-scripts/desert256.vim.git
" BUNDLE: https://github.com/vim-scripts/scala.vim.git
" BUNDLE: https://github.com/vim-scripts/jQuery.git
" BUNDLE: https://github.com/vim-scripts/neocomplcache.git
" BUNDLE: https://github.com/vim-scripts/quickrun.vim.git
" BUNDLE: https://github.com/vim-scripts/snipMate.git
" BUNDLE: https://github.com/vim-scripts/Gist.vim.git
" #BUNDLE: https://github.com/vim-scripts/The-NERD-tree.git
" #BUNDLE: https://github.com/vim-scripts/The-NERD-Commenter.git
" #BUNDLE: https://github.com/vim-scripts/NERD_tree-Project.git
" #BUNDLE: https://github.com/vim-scripts/FindInNERDTree.git
" #BUNDLE: https://github.com/vim-scripts/trinity.vim.git
"not vim-scripts
" BUNDLE: https://github.com/motemen/git-vim.git
" BUNDLE: https://github.com/thinca/vim-ref.git
" BUNDLE: https://github.com/Shougo/unite.vim.git
" BUNDLE: https://github.com/Shougo/vimfiler.git
" BUNDLE: https://github.com/Shougo/vimproc.git
" BUNDLE: https://github.com/Shougo/vimshell.git
" }}}

" charactor code {{{
set encoding=utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp
set fileformats=unix,dos,mac
" }}}

" status line {{{
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set wildmode=list:longest
" }}}

" display {{{
set number
syntax on
filetype on
set laststatus=2
set cmdheight=2
set showcmd
set wrap
set showmatch
" }}}

" search {{{
set history=1000
set incsearch
set ignorecase
set smartcase
set hlsearch
" }}}

" tab {{{
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
"set backupdir=$HOME . '/.vimbak'
"set directory=$HOME . '/.vimswp'
" }}}

" highlight {{{
" 全角スペースに青い下線を引く
if exists('&ambiwidth')
    set ambiwidth=double
endif
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
autocmd WinEnter * match ZenkakuSpace /　/

" タブに緑の下線を引く
set list
"set listchars=tab:\ \ ,trail:\ 
set listchars=tab:\ \ 
highlight SpecialKey cterm=underline ctermfg=lightgreen
" }}}

"バッファの自動保存
"http://vim-users.jp/2009/07/hack36/
set autowrite
" set autowriteall
autocmd CursorHold *  wall
autocmd CursorHoldI *  wall

" ctags {{{
set tags=./tags
set tags+=tags;
set tags+=./**/tags
" }}}

"表示行単位で行移動する
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" open/close {{{
"zzとZZを入れ替える
nnoremap zz ZZ
nnoremap ZZ zz

"バッファが編集中でもその他のファイルを開けるように
set hidden
"外部のエディタで編集中のファイルが変更されたら自動で読み直す
set autoread
" }}}

"<Space>e でそのコマンドを実行
"nnoremap <Space>r :execute '!' &ft ' %'<Enter>
nnoremap <Space>r :QuickRun<Enter>

"vimrcを読んだり書いたり
nnoremap <Space>.. :<C-u>source ~/.vimrc<Enter>
nnoremap <Space>.e :<C-u>vnew ~/.vimrc<Enter>
nnoremap <Space>.E :<C-u>edit ~/.vimrc<Enter>

" tab {{{
nnoremap <Space>tn  :<C-u>tabnew<Enter>:pwd<Enter>
nnoremap <Space>tz  :<C-u>tabclose<Enter>
nnoremap <Space>tj  :<C-u>tabnext<Enter>
nnoremap <Space>tk  :<C-u>tabprevious<Enter>
" }}}

" toggle {{{
function! ToggleNumber()
    if &number == 0
        set number
    else
        set nonumber
    endif
endfunction
nnoremap <Space>n :call ToggleNumber()<Enter>
" }}}

" html escape function
"function! HtmlEscape() 
"    silent s/&/\&amp;/eg 
"    silent s/</\&lt;/eg 
"    silent s/>/\&gt;/eg 
"endfunction 
"
"function! HtmlUnEscape() 
"    silent s/&lt;/</eg 
"    silent s/&gt;/>/eg 
"    silent s/&amp;/\&/eg 
"endfunction 

" ---- plugin ----
" Gist.vim {{{
if has('mac')
    let g:gist_clip_command = 'pbcopy'
else
    let g:gist_clip_command = 'xclip -selection clipboard'
endif
" }}}

" git-vim (motemen) {{{
"let g:git_command_edit = 'rightbelow vnew'
nnoremap <Space>gd :<C-u>GitDiff --no-prefix --cached<Enter>
nnoremap <Space>gD :<C-u>GitDiff --no-prefix<Enter>
nnoremap <Space>gs :<C-u>GitStatus<Enter>
nnoremap <Space>gl :<C-u>GitLog<Enter>
nnoremap <Space>gL :<C-u>GitLog -u \| head -10000<Enter>
if globpath(&rtp, 'plugin/shadow.vim') != ''
  nnoremap <Space>ga :<C-u>call GitAddBoth()<Enter>
else
  nnoremap <Space>ga :<C-u>GitAdd<Enter>
endif
nnoremap <Space>gA :<C-u>GitAdd <cfile><Enter>
nnoremap <Space>gc :<C-u>GitCommit<Enter>
nnoremap <Space>gC :<C-u>GitCommit --amend<Enter>
nnoremap <Space>gp :<C-u>Git push
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
if has('win32') || has('win64')
  call unite#set_substitute_pattern('file', '^;p', 'C:/Program Files/*')
endif

call unite#set_substitute_pattern('file', '\*\*\+', '*', -1)
call unite#set_substitute_pattern('file', '^\~', escape($HOME, '\'), -2)
call unite#set_substitute_pattern('file', '\\\@<! ', '\\ ', -20)
call unite#set_substitute_pattern('file', '\\ \@!', '/', -30)

" http://d.hatena.ne.jp/basyura/20101005/p1
nnoremap <Space>uu  :<C-u>Unite bookmark buffer_tab file_mru file<Enter>
nnoremap <Space>ub  :<C-u>Unite buffer<Enter>
nnoremap <Space>uk  :<C-u>Unite bookmark<Enter>
nnoremap <Space>uf  :<C-u>Unite file<Enter>
nnoremap <Space>um  :<C-u>Unite file_mru<Enter>
nnoremap <Space>ur  :<C-u>Unite file_rec<Enter>
"nnoremap <Space>ut  :<C-u>Unite tab<Enter>
nnoremap <Space>ut  :<C-u>Unite buffer_tab<Enter>
nnoremap <Space>ua  :<C-u>UniteBookmarkAdd 
nnoremap <Space>ui  :<C-u>UniteWithInput 
" }}}

" neocomplcache {{{
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
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

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <Enter>: close popup and save indent.
"inoremap <expr><Enter>  neocomplcache#smart_close_popup() . "\<Enter>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup() . "\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup() . "\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

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
let g:vimfiler_as_default_explorer = 1

" Enable file operation commands.
"let g:vimfiler_safe_mode_by_default = 0 

nnoremap <Space>e :<C-u>VimFilerSplit<Enter>
" }}}

" vimshell {{{
nnoremap <Space>ss :<C-u>VimShellPop<Enter>
nnoremap <Space>st :<C-u>VimShellTerminal 
nnoremap <Space>py :<C-u>VimShellTerminal python<Enter>
nnoremap <Space>sh :<C-u>VimShellTerminal bash<Enter>
" }}}

" NERDTree {{{
"nnoremap <Space>e :<C-u>NERDTreeToggle<Enter>
" }}}
