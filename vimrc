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
Plugin 'd-karl/fzf.vim'
Plugin 'Yilin-Yang/vim-markbar'
Plugin 'wellle/targets.vim'
Plugin 'thiagoalessio/rainbow_levels.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jwhitley/vim-matchit'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'simnalamburt/vim-mundo'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-repeat'
Plugin 'machakann/vim-highlightedyank'
Plugin 'd-karl/YankRing.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
" Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'
Plugin 'luochen1990/rainbow'
Plugin 'LStinson/TclShell-Vim'
Plugin 'vim-scripts/EvalSelection.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'junegunn/vim-peekaboo'
Plugin 'frioux/vim-regedit'
Plugin 'tpope/vim-unimpaired'
Plugin 'metakirby5/codi.vim'
Plugin 'godlygeek/tabular'
Plugin 'qpkorr/vim-bufkill'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-line'
Plugin 'martong/vim-compiledb-path'
Plugin 'skywind3000/asyncrun.vim'

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
"set highlight 	                                 " conflict with highlight current line
set ignorecase
set smartcase

" editor settings
set history=1000
set confirm                                      " prompt when existing from an unsaved file

" folding
set foldenable
set foldlevelstart=6

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

" Default Indentation
set autoindent
set expandtab       " expand tab to space
set smartindent     " indent when
set tabstop=4      " tab width
set shiftwidth=4
set softtabstop=4   " backspace
" set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop

" autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType cpp setlocal textwidth=99
"}}}

" -----------------
" User-defined functions
"------------------
" function to toggle ycm auto completion, so default vim autocomplete {{{
" can be used.
inoremap <C-x> <C-r>=DisableYCMAuto()<CR><C-x>

augroup RestoreYcm
    autocmd!
    autocmd InsertLeave * :call EnableYCMAuto()
augroup END

function! EnableYCMAuto()
    if g:ycm_manual_disable == 0
        let g:ycm_auto_trigger=1
    endif
endfunction

function! DisableYCMAuto()
    if g:ycm_manual_disable == 0
        let g:ycm_auto_trigger=0
    endif
    return ''
endfunction

let g:ycm_manual_disable = 0
function! ToggleYcm()
    if g:ycm_auto_trigger == 0
        let g:ycm_auto_trigger=1
        let g:ycm_manual_disable=0
        echo "YCM enabled!"
    else
        let g:ycm_auto_trigger=0
        let g:ycm_manual_disable=1
        echo "YCM disabled!"
    endif
endfunction
"}}}

" function to clear a register {{{
command! -nargs=1 ClearReg call ClearReg( <args> )
function! ClearReg(reg)
    call setreg(a:reg, [])
endfunction

nnoremap <silent> <localleader>[ :call ToggleYcm()<CR>
inoremap <silent> <localleader>[ <c-o>:call ToggleYcm()<CR>
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
" let g:gutentags_project_root=['CM_Project']
let g:gutentags_cache_dir='/home/dak/.vim/tags-cache/'
let g:gutentags_ctags_exclude=['.ccls*','.git']
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

" Yankring settings{{{
let g:yankring_min_element_length = 2
function! YRRunAfterMaps()
    nnoremap <silent>  Y   :<C-U>YRYankCount 'y$'<CR>
    unmap @
endfunction
"}}}

" Ultisnippets trigger settings{{{
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:snips_author="dak"

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
let NERDTreeChDirMode=2
let g:NERDTreeDirArrows=0
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=0
let NERDTreeWinPos = "right"
"}}}

" nerdcommenter{{{
let NERDSpaceDelims=1
" nmap <D-/> :NERDComToggleComment<cr>
let NERDCompactSexyComs=1
"}}}

" fzf vim keybindings{{{
noremap <leader>ff :Files<CR>
noremap <leader>fb :Buffers<CR>
noremap <leader>b  :Buffers<CR>
noremap <leader>fw :Windows<CR>
noremap <leader>fh :History<CR>
noremap <leader>f/ :History/<CR>
noremap <leader>f: :History:<CR>
noremap <leader>fc :Commands<CR>
noremap <leader>f? :Helptags<CR>
noremap <leader>fl :Lines<CR>
noremap <leader>fT :Tags<CR>
noremap <leader>ft :BTags<CR>
noremap <leader>fm :Marks<CR>
noremap <leader>fy :Yanks<CR>
noremap <leader>fgc :Commits<CR>
noremap <leader>fs :Snippets<CR>
noremap <leader>fgs :GFiles?<CR>
noremap <leader>fgf :GFiles<CR>

" navigate preview window in GFiles?
let $FZF_DEFAULT_OPTS = '--bind up:preview-up,down:preview-down,left:preview-page-up,right:preview-page-down'
"}}}

" vim fugitive `{{{
autocmd BufReadPost fugitive://* set bufhidden=delete

" Enable spell check for commit messages
autocmd FileType gitcommit setlocal spell

noremap <leader>gd :Gvdiff<CR>
noremap <leader>gs :Gstatus<CR>
noremap <leader>gsd :Gsdiff<CR>
noremap <leader>gvd :Gvdiff<CR>
noremap <leader>gc  :Gcommit<CR>
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
            \ 'ctermfgs': ['lightblue', 'lightyellow', 'red', 'darkgreen', 'darkyellow', 'lightred', 'yellow', 'cyan', 'magenta', 'white']
            \}
"}}}

" Keybindings for plugin toggle{{{
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nmap <F2> :IndentGuidesToggle<cr>
nmap <F3> :set hlsearch!<CR>
nmap <F4> :MundoToggle<cr>
nmap <F5> :TagbarToggle<cr>
nmap <F6> <Plug>ToggleMarkbar
nmap <F7> :NERDTreeToggle<cr>
" toggle guide at column 80
nnoremap <F8> :call <SID>ToggleColorColumn()<cr>
nmap  <D-/> :
nnoremap <leader>a :Rg<space>
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
let g:ale_tcl_nagelfar_executable='nagelfar'
let g:ale_set_quickfix=1
let g:ale_open_list='on_save'
let g:ale_completion_enabled=0
let g:ale_completion_max_suggestions=25
set completeopt=menu,menuone,preview,noselect,noinsert

let g:ale_linters={
\   'tcl': ['nagelfar'],
\   'c': ['ccls'],
\   'cpp': ['ccls'],
\}

let g:ale_cpp_ccls_init_options={'cacheDirectory': '/tmp/ccls'}

let g:ale_tcl_nagelfar_options='-filter "*Unknown command*"'

let g:ale_fixers={'cpp': ['uncrustify']}
let g:ale_c_uncrustify_options='-l CPP -c /home/dak/tools/code\ fixing/cpp.cfg'
let g:ale_fix_on_save=1

" autocommand to open quickfix list as the bottom window
augroup quickfix_move
    autocmd!
    autocmd FileType qf wincmd J
augroup END

" Bindings
nmap <leader>af <Plug>(ale_fix)
nmap <leader>ah <Plug>(ale_hover)
nmap <leader>ar <Plug>(ale_find_references)
nmap <leader>ad <Plug>(ale_go_to_definition)
nmap <leader>at <Plug>(ale_go_to_definition_in_tab)
nmap <leader>av <Plug>(ale_detail)


"}}}

" Codi{{{
let g:codi#autocmd='InsertLeave'
"}}}

" -----------------
" Useful Functions
"------------------
" Vim settings{{{
let g:load_doxygen_syntax=1
set scrolloff=10
"}}}

" Personal bindings{{{
" abbreviation for make in quickfix list
ca amake AsyncRun make

" remove trailing whitspace
nnoremap <leader>rw :%s/\s\+$//e<CR>
" open a terminal in a vert split
nnoremap <silent> <leader>t :vert terminal<CR>
nnoremap <silent> <leader>th :terminal<CR>
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
nnoremap <leader>bdt :windo diffthis<CR>
nnoremap <leader>bdo :windo diffoff<CR>
nnoremap <leader>do :diffoff<CR>
nnoremap <leader>dg :diffget<CR>
nnoremap <leader>dp :diffput<CR>
nnoremap <leader>du :diffupdate<CR>
"}}}

" quickfix list open / closing
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qc :cclose<CR>

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

" Shortcut to insert empty lines before and after current line
nnoremap <leader>o o<Esc>d0
nnoremap <leader>O O<Esc>d0

" Shortcut to open tag definition in vsplit
nmap ] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" selection shortcuts
nnoremap <leader>sa ggVG

" navigate buffers with arrow keys
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

" navigate buffers with personal shortcuts
nnoremap <leader>h :bprev<CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>x :BD<CR>
nnoremap <leader>X :bd<CR>
nnoremap gb :BF<CR>
nnoremap gB :BB<CR>

" Save on ctrl-s
nnoremap <c-s> :w<CR>
"}}}

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
noremap <leader>cd :call GoColorsDark()<CR>
noremap <leader>ch :call GoColorsBright()<CR>

call GoColorsDark()
"}}}

set guioptions=cm

" when running inside tmux
if $TMUX != ''
    set notermguicolors
    set background=dark
endif

" vim:sw=4:ts=4:tw=79:fdl=0:fdm=marker:
