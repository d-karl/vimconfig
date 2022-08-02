language en_US.utf8

" Plugins via vundle manager

set nocompatible
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim/

" Load plugins using vundle{{{
call vundle#begin()
" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'https://github.com/wesQ3/vim-windowswap'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'wellle/targets.vim'
Plugin 'thiagoalessio/rainbow_levels.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jwhitley/vim-matchit'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'svermeulen/vim-yoink'
Plugin 'svermeulen/ncm2-yoink'
Plugin 'simnalamburt/vim-mundo'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-repeat'
Plugin 'machakann/vim-highlightedyank'
Plugin 'scrooloose/nerdtree'
Plugin 'PhilRunninger/nerdtree-visual-selection'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rbong/vim-flog'
" Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'
Plugin 'luochen1990/rainbow'
Plugin 'LStinson/TclShell-Vim'
Plugin 'vim-scripts/EvalSelection.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'junegunn/vim-peekaboo'
Plugin 'frioux/vim-regedit'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-markdown'
Plugin 'metakirby5/codi.vim'
Plugin 'godlygeek/tabular'
Plugin 'qpkorr/vim-bufkill'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-line'
Plugin 'martong/vim-compiledb-path'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'mhinz/vim-startify'
Plugin 'easymotion/vim-easymotion'

" ncm 2 and sources
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'ncm2/ncm2'
Plugin 'ncm2/ncm2-bufword'
Plugin 'ncm2/ncm2-path'
Plugin 'ncm2/ncm2-ultisnips'
" Plugin 'ncm2/ncm2-vim-lsp'
" Plugin 'fgrsnau/ncm-otherbuf'
Plugin 'autozimu/LanguageClient-neovim'
Plugin 'prabirshrestha/async.vim'
Plugin 'jackguo380/vim-lsp-cxx-highlight'

Plugin 'othree/xml.vim'
Plugin 'prendradjaja/vim-vertigo'
Plugin 'm-pilia/vim-ccls'
" vim-lsp needs special branch ultisnips-integration for snipppts to work!
" Plugin 'prabirshrestha/vim-lsp'
" Plugin 'thomasfaingnaert/vim-lsp-snippets'
" Plugin 'thomasfaingnaert/vim-lsp-ultisnips'
Plugin 'liuchengxu/vista.vim'
Plugin 'jceb/vim-orgmode'
Plugin 'numirias/semshi'
Plugin 'kkoomen/vim-doge'
Plugin 'wellle/context.vim'

if has('nvim')
    Plugin 'ncm2/float-preview.nvim'
endif

" Color Schemes{{{
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'chriskempson/vim-tomorrow-theme'
"}}}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"}}}

let mapleader = " "
let maplocalleader = "\\"

" Vim Settings{{{
"--------
" color scheme
set background=dark
colorscheme PaperColor

" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline " cursorcolumn

" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set encoding=utf-8

" persistent undo
set undofile
set undodir=$HOME/.vim/undo-dir

set nowrapscan
set hidden

" enable syntax hightlight and completion
syntax on
" search
set incsearch
set nohlsearch
"set highlight 	                                 " conflict with highlight current line
set ignorecase
set smartcase

" editor settings
set history=1000
set confirm                                      " prompt when existing from an unsaved file

" folding
set foldenable
set foldlevelstart=8

set backspace=indent,eol,start                   " More powerful backspacing
set t_Co=256                                     " Explicitly tell vim that the terminal has 256 colors "
set mouse=a                                      " use mouse in all modes
set report=0                                     " always report number of lines changed                "
set scrolloff=5                                  " 5 lines above/below cursor when scrolling
set number                                       " show line numbers
set relativenumber                               " show relativenumber
set showmatch                                    " show matching bracket (briefly jump)
set showcmd                                      " show typed command in status bar
set title                                        " show file in titlebar
set laststatus=2                                 " use 2 lines for the status bar
set matchtime=2                                  " show matching bracket for 0.2 seconds
set directory=~/.vim/tmp                         " move swp file to /tmp
set virtualedit=onemore
set visualbell                                   " use visual bell instead of beeping

set wildmenu
set wildmode=longest,full

" Default Indentation
set autoindent
set expandtab       " expand tab to space
set smartindent     " indent when
set tabstop=4      " tab width
set shiftwidth=4
set softtabstop=4   " backspace
" set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType cpp setlocal textwidth=100

autocmd FileType xml setlocal tabstop=2
autocmd FileType html setlocal shiftwidth=2
autocmd FileType xml setlocal shiftwidth=2
"}}}

" function to clear a register {{{
command! -nargs=1 ClearReg call ClearReg( <args> )
function! ClearReg(reg)
    call setreg(a:reg, [])
endfunction
"}}}

" Use FZF on quickfix and LocationList contents{{{
command! QuickFix call <SID>QuickFix()
command! LocationList call <SID>LocationList()

function! s:QuickFix() abort
  call s:FuzzyPick(getqflist(), 'cc')
endfunction

function! s:LocationList() abort
  call s:FuzzyPick(getloclist(0), 'll')
endfunction

function! s:FuzzyPick(items, jump) abort
  let items = map(a:items, {idx, item ->
      \ string(idx).' '.bufname(item.bufnr).' '.item.text})
  call fzf#run(fzf#wrap('fuzzy-pick', {'source': items, 'sink': function('<SID>Pick', [a:jump]),
      \'options': '--with-nth 2.. --reverse', 'down': '40%'}))
endfunction

function! s:Pick(jump, item) abort
  let idx = split(a:item, ' ')[0]
  execute a:jump idx + 1
endfunction
"}}}
"-----------------
" Plugin settings
"-----------------
" Airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#keymap_ignored_filetypes = ['vimfiler', 'nerdtree']
let g:airline#extensions#tabline#show_close_button = 0
let airline#extensions#tabline#ignore_bufadd_pat = '\c\vgundo|undotree|vimfiler|tagbar|nerd_tree'
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'mixed-indent-file' ]

" disable airline branch symbol since it slowed things down
" too much
let g:airline#extensions#branch#enabled = 0


" enable/disable YCM integration >
let g:airline#extensions#ycm#enabled = 1
" set error count prefix >
let g:airline#extensions#ycm#error_symbol = 'E:'
" set warning count prefix >
let g:airline#extensions#ycm#warning_symbol = 'W:'

let g:airline#extensions#tabline#ignore_bufadd_pat = 'gundo|undotree|vimfiler|tagbar|nerd_tree|NERD_tree|startify'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Windowswap Airline integration
let g:airline#extensions#windowswap#enabled = 1
let g:airline#extensions#windowswap#indicator_text = 'WS'
"}}}

"Gutentags{{{
let g:gutentags_cache_dir='~/.vim/tags-cache/'
let g:gutentags_ctags_exclude=['.ccls*','.git','CMakeFiles','MakeFile*','build*']
let g:gutentags_generate_on_missing=0
let g:gutentags_generate_on_new=0
let g:gutentags_generate_on_empty_buffer=0
let g:gutentags_enabled=0
"}}}

" FZF Config{{{
" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
"}}}

" Ycm settings{{{
let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_complete_in_comments = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0

let g:ycm_extra_conf_globlist=['/fs/.ycm_extra_conf.py']

" disable Vim omnifunc in c and c++ files
autocmd FileType c setlocal omnifunc=
autocmd FileType cpp setlocal omnifunc=
"}}}

" Ultisnippets trigger settings{{{
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:snips_author="KDAN"
let g:UltiSnipsRemoveSelectModeMappings = 0

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"}}}

" EvalSelection{{{
let g:evalSelectionRubyDir = '~/.vim/bundle/EvalSelection.vim/ruby/'
"}}}

" easy-motion{{{
nnoremap <leader>n <Plug>(easymotion-jumptoanywhere)
let g:EasyMotion_re_anywhere = '\v' .
  \       '(<.|^$)' . '|' .
  \       '(.>|^$)' . '|' .
  \       '(\l)\zs(\u)' . '|' .
  \       '(_\zs.)' . '|' .
  \       '(#\zs.)'
"}}}

" Tagbar{{{
let g:tagbar_left=1
let g:tagbar_width=40
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_autoclose = 1

" UndoTree
let g:undoTree_SplitWidth = 40

" tag for markdown
let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
            \ 'h:Heading_L1',
            \ 'i:Heading_L2',
            \ 'k:Heading_L3'
            \ ]
            \ }
"}}}

" Nerd Tree{{{
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=0
let g:NERDTreeDirArrows=0
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=0
let NERDTreeWinPos = "right"
"}}}

" nerdcommenter{{{
let NERDSpaceDelims=1
"}}}

" fzf vim keybindings{{{
noremap <leader>ff :Files<CR>
noremap <leader>fb :Buffers<CR>
noremap <leader>o  :Buffers<CR>
noremap <leader>fw :Windows<CR>
noremap <leader>fh :History<CR>
noremap <leader>f/ :History/<CR>
noremap <leader>f: :History:<CR>
noremap <leader>fc :Commands<CR>
noremap <leader>f? :Helptags<CR>
noremap <leader>fl :Lines<CR>
noremap <leader>fT :Tags<CR>
noremap <leader>ft :Vista finder fzf<CR>
noremap <leader>fm :Marks<CR>
noremap <leader>fM :Maps<CR>
noremap <leader>fgl :Commits<CR>
noremap <leader>fs :Snippets<CR>
noremap <leader>fgs :GFiles?<CR>
noremap <leader>fgf :GFiles --recurse-submodules<CR>
noremap <leader>fq :QuickFix<CR>

" auto completion
imap <c-x><c-K> <plug>(fzf-complete-word)
imap <c-x><c-F> <plug>(fzf-complete-path)
imap <c-x><c-L> <plug>(fzf-complete-line)
" CTRL-A CTRL-Q to select all and build quickfix list

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  echo "setqf called!"
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_preview_window = ''

" navigate preview window in GFiles?
let $FZF_DEFAULT_OPTS = '-m --bind up:preview-up,down:preview-down,left:preview-page-up,right:preview-page-down --bind ctrl-a:select-all'
"}}}

" vim fugitive - flog `{{{
autocmd BufReadPost fugitive://* set bufhidden=delete
nnoremap <leader>gpu :Git push origin --set-upstream =expand('<cWORD>')<cr><cr>
nnoremap <leader>gdm :Git push origin --set-upstream =expand('<cWORD>')<cr><cr>:copen<cr>2j2W"+yiW

" Enable spell check for commit messages
autocmd FileType gitcommit setlocal spell

" Get rid of deprecated q map in fugitive
nnoremap q q
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gsd :Gsdiff<CR>
nnoremap <leader>gvd :Gvdiff<CR>
nnoremap <leader>gc  :Gcommit<CR>
nnoremap <leader>gf :Git clang-format<CR>

nnoremap <leader>gk :Flogsplit<CR>
nnoremap <leader>gka :Flogsplit -all<CR>
"}}}

" always split windows vertically{{{
set splitright
set diffopt+=vertical
silent! set splitvertical
"}}}

" Rainbow Parantheses{{{
let g:rainbow_active = 0 "0 if you want to enable it later via :RainbowToggle
nnoremap <leader>ra :RainbowToggle<CR>
let g:rainbow_conf = {
            \ 'ctermfgs': ['lightblue', 'lightyellow', 'red', 'darkgreen', 'darkyellow', 'lightred', 'yellow', 'cyan', 'magenta', 'white'],
            \	'separately': {
            \		'*': {},
            \       'cpp': {
            \	        'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold', 'start=/</ end=/>/ fold']
            \        },
            \   },
            \}
"}}}

" Keybindings for plugin toggle{{{
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nmap <F2> :IndentGuidesToggle<cr>
nmap <F3> :set hlsearch!<CR>
nmap <F4> :MundoToggle<cr>
nmap <F5> :Vista!!<cr>
nmap <F6> <Plug>ToggleMarkbar
nmap <F7> :NERDTreeToggle<cr>
" toggle guide at column 80
nnoremap <F8> :call <SID>ToggleColorColumn()<cr>
nmap <F9> :amakeb<CR>
nmap <F10> :AsyncRun ninja -C build-android install-alcapone install-alster-services && ~/development/android/push_stripped_alcapone.sh<CR>
nmap <F11> :call <SID>SetBuildFolder()<cr>
nmap <F12> :atest<CR>

nnoremap <leader>a :Rg<space>
nnoremap <leader>A :Rg<space>=expand('<cword>')<cr><cr>
nnoremap <leader>v V`]
"}}}

" Markbar{{{
let g:markbar_marks_to_display = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
"}}}

"Rainbow Levels{{{
nmap <leader>rl :RainbowLevelsToggle<CR>
"}}}

" Peekaboo{{{
let g:peekaboo_delay=1000
let g:peekaboo_window='vert bo 40new'
"}}}

" Regedit{{{
nmap <leader>E <Plug>(RegEditPostfix)
"}}}

" ALE {{{
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_enter=0
let g:ale_lint_on_save=1
let g:ale_fix_on_save=0
let g:ale_tcl_nagelfar_executable='nagelfar'
let g:ale_set_quickfix=1
let g:ale_open_list=0
let g:ale_completion_enabled=0
let g:ale_completion_max_suggestions=25
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

let g:ale_cmake_cmakelint_options='--filter=-linelength'

let g:ale_cpp_clangtidy_executable='clang-tidy-9'
let g:ale_cpp_clangtidy_options='-std=c++17'
let g:ale_c_clangtidy_executable='clang-tidy-9'
let g:ale_c_clangtidy_options='-x c++ -std=c++17'
let g:ale_c_clangformat_executable='clang-format-9'

let g:ale_cpp_clangtidy_checks=['modernize*', 'bugprone*', '*cpp*', 'readability*', 'performance*', 'clang-analyzer*', '-readability-braces-around-statements', '-hicpp-braces-around-statements', '-readability-else-after-return', '-modernize-use-trailing-return-type']
let g:ale_c_clangtidy_checks=['readability*', 'performance*', '-readability-braces-around-statements', 'clang-analyzer*']

let g:ale_linters={
\   'tcl': ['nagelfar'],
\   'c'  : ['clangtidy'],
\   'cpp': ['clangtidy']
\}

let g:ale_fixers={
\   'c'  : ['clang-format'],
\   'cpp': ['clang-format']
\}

let g:ale_cpp_ccls_init_options={'cacheDirectory': '/tmp/ccls'}

let g:ale_tcl_nagelfar_options='-filter "*Unknown command*"'

augroup ale_disable_in_cpp
    autocmd!
    autocmd FileType cpp let b:ale_enabled=0
    autocmd FileType c let b:ale_enabled=0
    autocmd FileType c let b:ale_fix_on_save=0
    autocmd FileType python let b:ale_enabled=0
augroup END


augroup ale_lint_on_save
    autocmd!
    autocmd FileType tcl let g:ale_lint_on_save=1
augroup END

" autocommand to open quickfix list as the bottom window
augroup quickfix_move
    autocmd!
    autocmd FileType qf wincmd J
augroup END

" Bindings
nmap <leader>al <Plug>(ale_lint)
nmap <leader>af <Plug>(ale_fix)
nmap <leader>ah <Plug>(ale_hover)
nmap <leader>ar <Plug>(ale_find_references)
nmap <leader>ad <Plug>(ale_go_to_definition)
nmap <leader>at <Plug>(ale_go_to_definition_in_tab)
nmap <leader>av <Plug>(ale_detail)

function! ToggleALE()
    if b:ale_enabled == 0
        let b:ale_enabled=1
        echo "ALE linting enabled!"
    else
        let b:ale_enabled=0
        ALEDisable
        echo "ALE linting disabled!"
        ALEEnable
    endif
endfunction

nnoremap <leader>at :call ToggleALE()<cr>
"}}}

" Codi{{{
let g:codi#autocmd='InsertLeave'
let g:codi#log='/tmp/codi.log'
let g:codi#interpreters = {
   \ 'python': {
       \ 'bin': 'python3',
       \ 'prompt': '^\(>>>\|\.\.\.\) ',
       \ },
   \ }
"}}}

" AsyncRun{{{
let g:asyncrun_open=15
"}}}

" NCM2 {{{
" enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()
    " autocmd BufEnter * call  LanguageClient#setDiagnosticsList('Location')


    " IMPORTANTE: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
"}}}

"{{{ LSP
let g:LanguageClient_autoStart = 1

let g:semshi#mark_selected_nodes = 0

let g:LanguageClient_serverCommands = {
    \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'cuda': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'objc': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'python': ['pyls'],
    \ }

" au TextChangedI * call ncm2#auto_trigger()

let g:LanguageClient_settingsPath = '~/.vim/settings.json'
let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_hasSnippetSupport = 1
let g:LanguageClient_hoverPreview = 'Always'
let g:LanguageClient_useVirtualText = "All"
let g:LanguageClient_diagnosticsList = 'Location'

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'cpp', 'c']

" let g:LanguageClient_rootMarkers = {
"     \ 'cpp' : ['.git', '.ccls-root', '.project'],
"     \ 'c' : ['.git', '.ccls-root', '.project']
"     \ }

" color settings for semantic highlighting
highlight! link LspCxxHlGroupMemberVariable cppStlIterator
highlight! link LspCxxHlSymParameter vimFuncVar
highlight! link LspCxxHlGroupNamespace cppExceptions

nnoremap [lh :LspCxxHighlightDisable<cr>
nnoremap ]lh :LspCxxHighlight<cr>

" keybindings
nnoremap <silent> <leader>lm :call LanguageClient_contextMenu()<CR>
nnoremap <silent> <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>lv :call LanguageClient#textDocument_documentHighlight()<CR>
nnoremap <silent> <leader>lV :call LanguageClient#clearDocumentHighlight()<CR>
nnoremap <silent> <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>li :call LanguageClient#textDocument_implementation()<CR>
nnoremap <silent> <leader>lw :call LanguageClient#workspace_symbol(input('Search for symbol:'))<CR>
nnoremap <silent> <leader>lW :call LanguageClient#workspace_symbol(expand('<cword>'))<CR>
nnoremap <silent> <leader>ll :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <leader>lr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <leader>la :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <silent> <leader>le :call LanguageClient#explainErrorAtPoint()<CR>

" Custom cross-reference calls to CCLS
" bases
let g:ccls_quiet=1
nnoremap <silent> <leader>lB :CclsBaseHierarchy<cr>
" " derived
nnoremap <silent> <leader>lD :CclsDerivedHierarchy<cr>

" " caller
nnoremap <silent> <leader>lc :CclsCallHierarchy<cr>
" " callee
nnoremap <silent> <leader>lC :CclsCalleeHierarchy<cr>

" " $ccls/member
" " nested classes / types in a namespace
nnoremap <silent> <leader>ls :CclsMemberHierarchy<cr>
" " member functions / functions in a namespace
" nnoremap <leader>lf :call LanguageClient#findLocations({'method':'$ccls/member','kind':3})<cr>
" " member variables / variables in a namespace
nnoremap <silent> <leader>lM :CclsVars<cr>
" }}}

" Vista{{{
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_executive_for = {
  \ 'cpp': 'lcn',
  \ 'c': 'lcn',
  \ 'python': 'lcn',
  \ }

let g:vista_fzf_opt=['-m','--bind','up:preview-up,down:preview-down,left:preview-page-up,right:preview-page-down','--bind','ctrl-a:select-all']
let g:vista_sidebar_position='vertical botright'
let g:vista_sidebar_width=50
let g:vista_close_on_jump=1
let g:vista_keep_fzf_colors=1
"}}}

" Startify{{{
let g:startify_fortune_use_unicode=1
let g:startify_enable_special = 0
let g:startify_session_dir = '~/.vim/session'

autocmd User Startified for key in ['q'] |
      \ execute 'nunmap <buffer>' key | endfor
"}}}

" vertigo {{{
nnoremap <silent> <Space>j :<C-U>VertigoDown n<CR>
vnoremap <silent> <Space>j :<C-U>VertigoDown v<CR>
onoremap <silent> <Space>j :<C-U>VertigoDown o<CR>
nnoremap <silent> <Space>k :<C-U>VertigoUp n<CR>
vnoremap <silent> <Space>k :<C-U>VertigoUp v<CR>
onoremap <silent> <Space>k :<C-U>VertigoUp o<CR>
"}}}

" xml settings{{{
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
au FileType xml setlocal shiftwidth=2
"}}}

"Yoink{{{
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
"}}}

"Doge{{{
nmap <leader>lg :DogeGenerate<cr>
"}}}

au FileType html setlocal shiftwidth=2

let g:context_border_char = '－'
let g:context_enabled = 0

" -----------------
" Useful Functions
"------------------
" Vim settings{{{
let g:load_doxygen_syntax=1
let g:termdebug_wide=100
set scrolloff=10
set complete=.,w,b,u,t,k

" This fixed Konsole nvim not being resizable, but removes the nicer insert
" cursor.
" set guicursor=""
"}}}

" Personal bindings{{{
" abbreviation for make in quickfix list
let g:build_folder = 'build-relwithdeb'
function! s:SetBuildFolder()
    call inputsave()
    let l:build_folder_new = input("change build folder to: ", g:build_folder, "dir")
    if (l:build_folder_new != "")
        let g:build_folder = l:build_folder_new
    endif
    call inputrestore()
endfunction

let g:build_command = 'ninja'
function! s:SetBuildCommand()
    call inputsave()
    let l:build_command_new = input("change build command to: ", g:build_command, "shellcmd")
    if (l:build_command_new != "")
        let g:build_command = l:build_command_new
    endif
    call inputrestore()
endfunction

function! s:RemoveDeadHistEntry()
    call histdel(":", "^a$")
    call histdel(":", "^c$")
endfunction

command! RemoveDeadHistEntry : call s:RemoveDeadHistEntry()
command! SetBuildFolder :call s:SetBuildFolder()
command! SetBuildCommand :call s:SetBuildCommand()

nmap <leader>bf :SetBuildFolder
nmap <leader>bc :SetBuildCommand

ca amake AsyncRun =g:build_command
ca amakeb AsyncRun =g:build_command -C =g:build_folder
ca atest AsyncRun cd =g:build_folder && ctest -V
augroup python_unittest
    autocmd!
    autocmd FileType python compiler pyunit
    autocmd FileType python setlocal makeprg=python3.7\ -m\ unittest\ discover
augroup END
ca ptest AsyncRun python3.7 -m unittest

" jump to end of recently yanked text
nnoremap <leader>gy ']

" remove trailing whitspace
nnoremap <leader>rw :%s/\s\+$//e<CR>
" open a terminal in a vert split
nnoremap <silent> <leader>t :vert terminal<CR>
nnoremap <silent> <leader>th :terminal<CR>

" open a terminal in a vert split
if has('nvim')
    nnoremap <silent> <leader>th :split <bar> terminal<CR>
    nnoremap <silent> <leader>t :vsplit <bar> terminal<CR>
else
    nnoremap <silent> <leader>t :vert terminal<CR>
    nnoremap <silent> <leader>th :terminal<CR>
endif

set tw=79       " width of document (used by gd)
set nowrap      " don't automatically wrap on load
set fo-=t       " don't automatically wrap text when typing
let s:color_column_old = 0
set termguicolors
function! s:ToggleColorColumn()
    if &colorcolumn == 0
        windo let &colorcolumn = 80
    else
        windo let &colorcolumn = 0
    endif
endfunction

"diff mode {{{
nnoremap <leader>dt :diffthis<CR>
nnoremap <leader>wdt :windo diffthis<CR>
nnoremap <leader>wdo :windo diffoff<CR>
nnoremap <leader>do :diffoff<CR>
nnoremap <leader>dg :diffget<CR>
nnoremap <leader>dp :diffput<CR>
nnoremap <leader>du :diffupdate<CR>
"}}}

" quickfix list open / closing
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qc :cclose<CR>
nnoremap <leader>mc :lclose<CR>
nnoremap <leader>mo :lopen<CR>

" preview closing
nnoremap <leader>pc :pclose<CR>

" select last pasted text
nmap gV `[v`]

" jk in insert mode to exit
inoremap jk <Esc>

" user shortcuts to move to EOL/BOL
nnoremap <leader>l $
nnoremap <leader>h 0

" shortcut to paste last yanked buffer instead of last deleted
nnoremap <leader>p "0p
nnoremap <leader>P "0P

" Shortcut to open tag definition in vsplit
nmap ] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" selection shortcuts
nnoremap <leader>sa ggVG

" navigate buffers with arrow keys
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

" navigate buffers with personal shortcuts
nnoremap <leader>x :BD<CR>
nnoremap <leader>X :bd<CR>
nnoremap gb :BF<CR>
nnoremap gB :BB<CR>

" Save on ctrl-s
nnoremap <c-s> :w<CR>
"}}}

" Uniform navigation in terminal mode
if !has('nvim')
tnoremap <c-j> <c-w>j
tnoremap <c-k> <c-w>k
tnoremap <c-h> <c-w>h
tnoremap <c-l> <c-w>l
endif

if has('nvim')
  set inccommand=nosplit
  let g:float_preview#docked=0
  let g:ale_virtual_text_cursor=1
  let g:yoinkSavePersistently=1
  tnoremap <C-w>N <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>

  autocmd BufEnter term://* tnoremap <buffer> <C-h> <C-\><C-n><C-w>h
  autocmd BufEnter term://* tnoremap <buffer> <C-j> <C-\><C-n><C-w>j
  autocmd BufEnter term://* tnoremap <buffer> <C-k> <C-\><C-n><C-w>k
  autocmd BufEnter term://* tnoremap <buffer> <C-l> <C-\><C-n><C-w>l
  autocmd BufEnter term://* tnoremap <buffer> <Esc> <C-\><C-n>
endif

" Inherited configuration{{{
" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
            \ if ! exists("g:leave_my_cursor_position_alone") |
            \     if line("'\"") > 0 && line ("'\"") <= line("$") |
            \         exe "normal g'\"" |
            \     endif |
            \ endif

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" sublime key bindings
nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv

" eggcache vim
:command! W w
:command! WQ wq
:command! Wq wq
:command! Q q
:command! Qa qa
:command! QA qa

" colorscheme switching
function! GoColorsDark()
    set background=dark
    highlight ColorColumn guibg=#682627
endfunction

function! GoColorsBright()
    set background=light
    highlight ColorColumn guibg=#e8d0d1
endfunction
noremap <leader>vd :call GoColorsDark()<CR>
noremap <leader>vh :call GoColorsBright()<CR>

call GoColorsDark()
"}}}

set guioptions=cm

" when running inside tmux
" if $TMUX != ''
"     set notermguicolors
"     set background=dark
" endif

" remove dead hist entries
call s:RemoveDeadHistEntry()

if getcwd() =~# '/reports/.*'
    colorscheme Tomorrow-Night-Eighties
endif

" vim:sw=4:ts=4:tw=79:fdl=0:fdm=marker:
