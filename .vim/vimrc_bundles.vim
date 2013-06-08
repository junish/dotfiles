" NeoBundle {{{

" -------- Core

" Color Scheme
NeoBundle 'vim-scripts/Lucius.git'
NeoBundle 'vim-scripts/desert256.vim.git'

" Finder
NeoBundle 'Shougo/unite.vim.git' "Like Finder
NeoBundle 'Shougo/unite-build.git' "Extend Unite For Build.
NeoBundle 'Shougo/unite-ssh.git' "Extend Unite For SSH.
NeoBundle 'tsukkee/unite-help.git' "Extend Unite For Help
NeoBundle 'tsukkee/unite-tag.git' "Extend Unite For Tag
NeoBundle 'thinca/vim-unite-history.git' "Extend Unite For History
NeoBundleLazy 'ujihisa/unite-colorscheme.git' "Extend Unite For ColorScheme
NeoBundleLazy 'ujihisa/unite-locate.git' "Extend Unite For Locate
NeoBundle 'Sixeight/unite-grep.git' "Extend Unite For Grep
NeoBundle 't9md/vim-unite-ack.git' "Extend Unite For Ack
NeoBundle 'ujihisa/neco-look.git' "Extend Unite For English Words
NeoBundleLazy 'ujihisa/neco-ghc.git' "Extend Unite For Haskell
NeoBundle 'pasela/unite-webcolorname.git' "Extend Unite For Web Color Name
NeoBundle 'osyo-manga/unite-quickfix.git' "Extend Unite For Make

NeoBundle 'Shougo/vimshell.git' "Shell
NeoBundle 'http://conque.googlecode.com/svn/trunk/' "Shell
NeoBundle 'vim-scripts/sudo.vim.git' "With Sudo
NeoBundle 'thinca/vim-ref.git' "Refer To Everything
NeoBundle 'vim-scripts/taglist.vim.git' "List Tags
NeoBundle 'Source-Explorer-srcexpl.vim.git' "Find Defined Variable

NeoBundle 'tpope/vim-eunuch.git' "Rename, Remove, Find, Locate, Sudo 

NeoBundle 'git://gist.github.com/791985.git' "Super Smooth Scroll
NeoBundle 'kana/vim-smartword.git' "Smart Word Move

" Matching
NeoBundle 'vim-scripts/matchit.zip.git' "Matching
NeoBundle 'kana/vim-smarttill.git' "?
NeoBundle 'anyakichi/vim-textobj-xbrackets.git', {'depends':
    \ [ 'kana/vim-textobj-user.git' ]}
NeoBundle 'anyakichi/vim-surround.git' "Extend Text Object, Fork tpope/...
NeoBundle 'repeat.vim' "Repeat surround.vim, etc...
NeoBundle 't9md/vim-quickhl.git' "Multi Highlight
NeoBundle 'nathanaelkane/vim-indent-guides.git' "Indent Highlight
NeoBundle 'eregex.vim.git'

" Tidy
NeoBundle 'h1mesuke/vim-alignta.git' " Multi Bytle Align
NeoBundle 'thinca/vim-qfreplace.git'
NeoBundle 't9md/vim-textmanip.git' "Extend Visual Mode Operation
NeoBundle 'kana/vim-operator-user.git' "簡単にoperatorを定義できるようにする
NeoBundle 'kana/vim-operator-replace.git' "yankしたものでreplaceする
NeoBundle 'kana/vim-smartchr.git' " ==などの前後を整形
NeoBundle 'tpope/vim-speeddating.git' " Inc/Dec Date

" Complete
NeoBundle 'Shougo/neocomplcache.git', {'depends' :
    \ [ 'Shougo/neocomplcache-snippets-complete.git',
    \   ['rstacruz/sparkup.git', {'rtp': 'vim'}]
    \ ]}
NeoBundle 'vim-scripts/autodate.vim.git' "Incriment/Decriment Date

" Build
NeoBundle 'vim-scripts/errormarker.vim.git' "Flymake Some Lang
NeoBundle 'thinca/vim-quickrun.git' "Easy Execute make Command
NeoBundle 'thinca/vim-qfreplace.git' "Replace in QuickFix Window
NeoBundle 'vim-scripts/Vdebug.git' "For Xdebug

" Comment
NeoBundle 'tyru/caw.vim.git' "Vimlike Comment In/Out

" Copy
NeoBundle 'kana/vim-fakeclip.git' "Copy By Vim To Clipboard.
NeoBundle 'vim-scripts/YankRing.vim.git'

" Folding
NeoBundle 'LeafCage/foldCC.git' "Pretty Folding Message

" Git 
NeoBundle 'tpope/vim-fugitive.git' "Git Management For Status Line
NeoBundle 'vim-scripts/Gist.vim.git' "Gist of Github
NeoBundle 'motemen/git-vim.git' "Git Management

" Browsing
NeoBundleLazy 'yuratomo/w3m.vim.git'
NeoBundle 'tyru/open-browser.vim.git' "Open URL

" ???
NeoBundle 'ujihisa/vimshell-ssh.git'
NeoBundleLazy 'tyru/operator-html-escape.vim.git'
NeoBundle 'tyru/restart.vim.git'
NeoBundle 'tyru/vim-altercmd.git'
NeoBundle 'tyru/winmove.vim.git'
NeoBundle 'vim-scripts/netrw.vim.git'
NeoBundleLazy 'vim-ruby/vim-ruby.git'
NeoBundle 'deris/vim-loadafterft.git'

" -------- FileType

" Python
NeoBundle 'fs111/pydoc.vim.git' "PyDoc
NeoBundleLazy 'klen/python-mode.git' "All In One
autocmd FileType python NeoBundleSource python-mode
NeoBundle 'vim-scripts/python_fold.git' "Filding For Python
NeoBundle 'vim-scripts/python_open_module.git'
NeoBundle 'vim-scripts/virtualenv.vim.git'
NeoBundle 'eth0jp/python-xdebug.git' "For Xdebug
"NeoBundle 'vim-scripts/VimPdb.git'
"NeoBundle 'kevinw/pyflakes.git'
"NeoBundleLazy 'kevinw/pyflakes-vim.git', {
"    \ 'build' : {
"    \     'mac' : 'ln -s ~/.vim/bundle/pyflakes/* ~/.vim/bundle/pyflakes-vim/ftplugin/python/pyflakes/',
"    \     'unix' : 'ln -s ~/.vim/bundle/pyflakes/* ~/.vim/bundle/pyflakes-vim/ftplugin/python/pyflakes/'
"    \     }
"    \ }

" Markdown
NeoBundle 'tpope/vim-markdown.git' "For Markdown

" HTML + CSS
NeoBundle 'scrooloose/syntastic.git' "?
NeoBundle 'hokaccha/vim-html5validator.git' "HTML5 Validator
NeoBundle 'rstacruz/sparkup.git' "Like Zen Cording
"NeoBundle 'mattn/zencoding-vim.git'
NeoBundle 'tyru/operator-html-escape.vim.git' "Escape HTML
NeoBundle 'vim-scripts/VST.git'
NeoBundle 'vim-scripts/VOoM.git'

NeoBundle 'cakebaker/scss-syntax.vim.git' "SCSS Syntax
NeoBundle 'ehynds/vim-css-color.git' "Auto Coloring
NeoBundleLazy 'hail2u/vim-css3-syntax.git' "CSS3 Syntax

" Perl
NeoBundleLazy 'c9s/perlomni.vim.git' "Omni Complete For Perl
NeoBundle 'hotchpotch/perldoc-vim.git' "PerlDoc
NeoBundleSource perlomni.vim

" Scala
NeoBundle 'vim-scripts/scala.vim.git'

" Javascript
NeoBundle 'vim-scripts/jQuery.git'

NeoBundle 'oscarh/vimerl.git', {"rev": "integration"}
NeoBundle 'vim-scripts/vim-erlang-skeleteons.git'

" -------- Library
NeoBundle 'vim-jp/vimdoc-ja.git' "Japanese Vimdoc

" Vim Plugin Library
NeoBundle 'Shougo/vimproc.git', {
    \ 'build' : {
    \     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }


" -------- Validate

" Installation check.
"if neobundle#exists_not_installed_bundles()
"  echomsg 'Not installed bundles : ' .
"        \ string(neobundle#get_not_installed_bundle_names())
"  echomsg 'Please execute ":NeoBundleInstall" command.'
"  finish
"endif
" }}}

" Lucius {{{
hi clear
"colorscheme desert256
let g:lucius_style="light"
colorscheme lucius
" }}}


" quickhl.vim {{{
nnoremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR><Plug>(quickhl-reset)
" }}}

" foldCC {{{
set foldtext=FoldCCtext()
" }}}

" neocomplcache {{{
" autocmd BufFilePost \[ref-* silent execute ":NeoComplCacheCachingBuffer"

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 0
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 4
let g:neocomplcache_min_keyword_length = 4
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

if !exists('g:neocomplcache_same_filetype_lists')
    let g:neocomplcache_same_filetype_lists = {}
endif
let g:neocomplcache_same_filetype_lists.c = 'ref-man,ref-erlang'
let g:neocomplcache_same_filetype_lists.erlang = 'ref-erlang'
let g:neocomplcache_same_filetype_lists['int-erl'] = 'erlang,ref-erlang'

if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns.default = '\h\w*'
let g:neocomplcache_keyword_patterns.erlang = '\v\h\w*:(\h\w+)*'

if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::' " https://github.com/c9s/perlomni.vim

if !exists('g:neocomplcache_context_filetype_lists')
    let g:neocomplcache_context_filetype_lists = {}
endif
let g:neocomplcache_context_filetype_lists.perl6 = [{'filetype' : 'pir', 'start' : 'Q:PIR\s*{', 'end' : '}'}]
let g:neocomplcache_context_filetype_lists.vim = [{'filetype' : 'python', 'start' : '^\s*python <<\s*\(\h\w*\)', 'end' : '^\1'}]

if !exists('g:neocomplcache_dictionary_filetype_lists')
    let g:neocomplcache_dictionary_filetype_lists = {}
endif
let g:neocomplcache_dictionary_filetype_lists.default = ''
let g:neocomplcache_dictionary_filetype_lists.vimshell = $HOME.'.vimshell_hist'
let g:neocomplcache_dictionary_filetype_lists.erlang = $HOME.'/.vim/dict/erlang.dict'
let g:neocomplcache_dictionary_filetype_lists.javascript = $HOME.'/.vim/dict/javascript.dict'
let g:neocomplcache_dictionary_filetype_lists.php = $HOME.'/.vim/dict/php.dict'
let g:neocomplcache_dictionary_filetype_lists.python = $HOME.'/.vim/dict/python.dict'
let g:neocomplcache_dictionary_filetype_lists.c = $HOME.'/.vim/dict/c.dict'
let g:neocomplcache_dictionary_filetype_lists.cpp = $HOME.'/.vim/dict/cpp.dict'

if !exists('g:neocomplcache_filename_include_exprs')
    let g:neocomplcache_filename_include_exprs = {}
endif
let g:neocomplcache_filename_include_exprs.perl = 'fnamemodify(substitute(v:fname, "/", "::", "g"), ":r")'

if !exists('g:neocomplcache_filename_include_exts')
    let g:neocomplcache_filename_include_exts = {}
endif
let g:neocomplcache_filename_include_exts.cpp = ['', 'h', 'hpp', 'hxx']

if !exists('g:neocomplcache_delimiter_patterns')
    let g:neocomplcache_delimiter_patterns= {}
endif
let g:neocomplcache_delimiter_patterns.vim = ['#']
let g:neocomplcache_delimiter_patterns.cpp = ['::']

if !exists('g:neocomplcache_vim_completefuncs')
    let g:neocomplcache_vim_completefuncs = {}
endif
let g:neocomplcache_vim_completefuncs.Ref = 'ref#complete'

" 補完候補の数
let g:neocomplcache_max_list = 1000
" 1番目の候補を自動選択
let g:neocomplcache_enable_auto_select = 1
" 辞書読み込み
noremap  <Leader>n. :<C-u>NeoComplCacheCachingDictionary<CR>
" スニペット
let g:neocomplcache_snippets_dir='~/.vim/bundle/snipmate.vim/snippets'

" neocomplcache補完
inoremap <expr><C-n><C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"

" スニペット補完
imap <expr><C-n><C-s> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
smap <expr><C-n><C-s> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"

" 補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"

" 補完をキャンセル
inoremap <expr><C-c>  neocomplcache#cancel_popup()

" <C-e> でポップアップキャンセル
inoremap <expr><C-e> neocomplcache#smart_close_popup()
" }}}

" unite.vim {{{
let g:unite_enable_start_insert=0
let g:unite_source_file_mru_limit = 1000
let g:unite_cursor_line_highlight = 'TabLineSel'
"let g:unite_abbr_highlight = 'TabLine'
let g:unite_winheight = 7
let g:unite_split_rule = 'botright'

" For optimize.
let g:unite_source_file_mru_filename_format = ''

" For ack.
if executable('ack-grep')
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
    let g:unite_source_grep_recursive_opt = ''
endif

" 常用
nnoremap <Leader>ff :<C-u>Unite source<CR>

" Grep
nnoremap <Leader>fg :<C-u>Unite grep:.:-iR:

" Ref
nnoremap <Leader>f/ :<C-u>Unite ref/

" ファイル再帰表示
nnoremap <silent> <Leader>fr :<C-u>Unite file_rec<CR>

" バッファ一覧
nnoremap <silent> <Leader>fb :<C-u>Unite buffer<CR>

" ファイル一覧
nnoremap <silent> <Leader>fl :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

" 最近使用したファイル一覧
nnoremap <silent> <Leader>fm :<C-u>Unite file_mru<CR>

" ファイル関連全て
nnoremap <silent> <Leader>fa :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" Snippet
nnoremap <silent> <Leader>fs :<C-u>Unite snippet<CR>

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
    autocmd FileType unite :nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
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

" vimshell {{{
let g:vimshell_split_command = 'split'
let g:vimshell_smart_case = 1
let g:vimshell_prompt = $USER."% "
"let g:vimshell_user_prompt = 'printf("%s %s", fnamemodify(getcwd(), ":~"), vimshell#vcs#info("(%s)-[%b]"))'
"autocmd FileType vimshell
"  \ call vimshell#hook#set('chpwd', ['g:chpwd_for_vimshell'])
"function! g:chpwd_for_vimshell(args, context)
"  call vimshell#execute('ls')
"endfunction
nnoremap <Leader>s :<C-u>VimShell<CR>
nnoremap <Leader>S :<C-u>VimShellTerminal 
autocmd FileType erlang :nnoremap <Leader>s :<C-u>VimShellTerminal /usr/bin/erl<CR>
autocmd FileType python :nnoremap <Leader>s :<C-u>VimShellTerminal /usr/bin/python<CR>
autocmd FileType sh     :nnoremap <Leader>s :<C-u>VimShellTerminal bash<CR>
" }}}


" surround {{{
" 選択範囲を指定文字でくくる
nmap s <Plug>Ysurround
nmap ss <Plug>Yssurround
" }}}

" vim-ref {{{
let g:ref_open = 'tabnew'
nnoremap <Leader>/ :<C-u>Ref alc <C-r><C-w><CR>
nnoremap <Leader>? :<C-u>Ref alc <C-r><C-w>
autocmd FileType python :nnoremap <Leader>/ :<C-u>Ref pydoc <C-r><C-w><CR>
autocmd FileType python :nnoremap <Leader>? :<C-u>Ref pydoc <C-r><C-w>
autocmd FileType erlang :nnoremap <Leader>/ :<C-u>Ref erlang <C-r><C-w><CR>
autocmd FileType erlang :nnoremap <Leader>? :<C-u>Ref erlang <C-r><C-w>
autocmd FileType perl   :nnoremap <Leader>/ :<C-u>Ref perldoc <C-r><C-w><CR>
autocmd FileType perl   :nnoremap <Leader>? :<C-u>Ref perldoc <C-r><C-w>
autocmd FileType sh     :nnoremap <Leader>/ :<C-u>Ref man <C-r><C-w><CR>
autocmd FileType sh     :nnoremap <Leader>? :<C-u>Ref man <C-r><C-w>
" }}}
"
" Gist.vim {{{
if has('mac')
    let g:gist_clip_command = 'pbcopy'
else
    let g:gist_clip_command = 'xclip -selection clipboard'
endif
" }}}
"
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
"
" unite-tag {{{
nnoremap <C-]> :<C-u>UniteWithCursorWord -immediately tag<Enter>
nnoremap <silent> <Leader>ft :<C-u>Unite tag<Enter>
" }}}
"
" vimerl integrate branch {{{
autocmd FileType erlang :setlocal omnifunc=erlangcomplete#Complete
let g:erlangManPath = '/usr/lib64/erlang/man'
" let g:erlangFold=1
" let g:erlangFoldSplitFunction=1
let g:erlangCheckFile = "~/.vim/bundle/vimerl/compiler/erlang_check.erl"
let g:erlangCompleteFile  = '~/.vim/bundle/vimerl/autoload/erlang_complete.erl'
let g:erlangRefactoring = 1
if has('mac')
    let g:erlangWranglerPath = "/usr/local/share/wrangler/"
else
    let g:erlangWranglerPath = "/usr/lib64/erlang/lib/wrangler-0.9.4/"
endif
nmap <Leader>re :call ErlangExtractFunction("n")<ENTER>
vmap <Leader>re :call ErlangExtractFunction("v")<ENTER>
map  <Leader>rf :call ErlangRenameFunction()<ENTER>
map  <Leader>rv :call ErlangRenameVariable()<ENTER>
map  <Leader>rm :call ErlangRenameModule()<ENTER>
map  <Leader>rp :call ErlangRenameProcess()<ENTER>
nmap <Leader>rt :call ErlangTupleFunArgs("n")<ENTER>
vmap <Leader>rt :call ErlangTupleFunArgs("v")<ENTER>
" }}}
"
" vimfiler {{{
"" :help vimfiler-examples
"call vimfiler#set_execute_file('vim', 'vim')
"call vimfiler#set_execute_file('txt', 'notepad')
""let g:vimfiler_split_command = ''
""let g:vimfiler_edit_command = 'tabedit'
""let g:vimfiler_pedit_command = 'vnew'
"let g:vimfiler_external_copy_directory_command = 'cp -r $src $dest'
"let g:vimfiler_external_copy_file_command = 'cp $src $dest'
"let g:vimfiler_external_delete_command = 'rm -r $srcs'
"let g:vimfiler_external_move_command = 'mv $srcs $dest'
""let g:vimfiler_as_default_explorer = 1
"let g:vimfiler_as_default_explorer = 0
"" Enable file operation commands.
""let g:vimfiler_safe_mode_by_default = 0 
""nnoremap <Leader>E :<C-u>VimFilerSplit<Enter>
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
nnoremap <silent> <Leader>h :<C-u>TlistToggle<Enter>
" }}}

" NERD_tree {{{
nnoremap <silent> <Leader>l :NERDTreeToggle<Enter>
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
"
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
" <Leader>m でそのコマンドを実行
nnoremap <Leader>m :QuickRun<Enter>
let g:quickrun_config = {}
let g:quickrun_config.erlang = {'command' : 'make'}
" }}}

" project.vim {{{
nmap <silent> <Leader>a <Plug>ToggleProject
" }}}

" screen.vim {{{
"nmap <silent> <C-s><C-a> :ScreenShell<CR>
"nmap <silent> <C-s><C-s> vip:ScreenSend<CR>
"vmap <silent> <C-s><C-s> :ScreenSend<CR>
"nmap <silent> <C-s><C-q> :ScreenQuit<CR>
"autocmd FileType python :nmap <C-s><C-a> :ScreenShell python<CR>
"autocmd FileType erlang :nmap <C-s><C-a> :ScreenShell erl<CR>
" }}}

" Google-translator {{{
let g:langpair = 'en|ja'
let g:vtranslate = "T"
" }}}

" vim-haml {{{
autocmd BufRead,BufNewFile *.scss setlocal filetype=scss
" }}}

" vim-haml {{{
let g:syntastic_auto_loc_list=1
let g:syntastic_auto_jump=1
" }}}
