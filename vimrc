" Plugins via vundle manager

filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#rc()
" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Visual stuff
Plugin 'vim-airline/vim-airline'
" The following attempts to use a nice triangle separator for airline.
" this did not work in chrom os ssh client as the triangles were too small
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#keymap_ignored_filetypes = ['vimfiler', 'nerdtree']
let g:airline#extensions#tabline#show_close_button = 0
let airline#extensions#tabline#ignore_bufadd_pat = '\c\vgundo|undotree|vimfiler|tagbar|nerd_tree'

" enable/disable YCM integration >
let g:airline#extensions#ycm#enabled = 1
" set error count prefix >
let g:airline#extensions#ycm#error_symbol = 'E:'
" set warning count prefix >
let g:airline#extensions#ycm#warning_symbol = 'W:'

" let g:airline#extensions#tabline#left_sep = '>'
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#right_sep = '<'
" let g:airline#extensions#tabline#left_alt_sep = '<'

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

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" FZF Config
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

Plugin 'vim-airline/vim-airline-themes'

" XTabline to improve on Airline
" Plugin 'mg979/vim-xtabline'

" required!
Plugin 'gmarik/vundle'

" Code Completions
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
" Ycm settings
let g:ycm_server_python_interpreter = '/usr/bin/python2'

" Fast navigation
" Plugin 'jwhitley/vim-matchit'
" Plugin 'Lokaltog/vim-easymotion'

" Fast editing
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'sjl/gundo.vim'
Plugin 'mbbill/undotree'
" Plugin 'godlygeek/tabular'
" Plugin 'nathanaelkane/vim-indent-guides'

" IDE features
Plugin 'scrooloose/nerdtree'
Plugin 'https://github.com/wesQ3/vim-windowswap'

" Windowswap Airline integration
let g:airline#extensions#windowswap#enabled = 1
let g:airline#extensions#windowswap#indicator_text = 'WS'

" Snippets
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
" Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
" Plugin 'Lokaltog/vim-powerline'
" Plugin 'scrooloose/syntastic'
" Plugin 'bronson/vim-trailing-whitespace'

" Other Utils
" Plugin 'humiaozuzu/fcitx-status'
" Plugin 'nvie/vim-togglemouse'

" Syntax/Indent for language enhancement
" markup language
" Plugin 'tpope/vim-markdown'
" Plugin 'timcharper/textile.vim'
" Golang
" Plugin 'fatih/vim-go'

" Rainbow parantheses
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 0 "0 if you want to enable it later via :RainbowToggle

" Color Schemes
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'chriskempson/vim-tomorrow-theme'

" TCL support
Plugin 'LStinson/TclShell-Vim'
filetype plugin indent on     " required!
Plugin 'vim-scripts/EvalSelection.vim'
let g:evalSelectionRubyDir = '~/.vim/bundle/EvalSelection.vim/ruby/'

" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set encoding=utf-8

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" enable syntax hightlight and completion
syntax on

" Vim UI
"--------
" color scheme
set background=dark
colorscheme Tomorrow-Night-Eighties

" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline " cursorcolumn

" search
set incsearch
"set highlight 	                                                  " conflict with highlight current line
set ignorecase
set smartcase

" editor settings
set history=1000
set nocompatible
set nofoldenable                                                  " disable folding"
set confirm                                                       " prompt when existing from an unsaved file
set backspace=indent,eol,start                                    " More powerful backspacing
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "
set mouse=a                                                       " use mouse in all modes
set report=0                                                      " always report number of lines changed                "
set scrolloff=5                                                   " 5 lines above/below cursor when scrolling
set number                                                        " show line numbers
set relativenumber                                                " show relativenumber
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set directory=~/.vim/tmp                                          " move swp file to /tmp
set virtualedit=onemore

" Default Indentation
set autoindent
set expandtab       " expand tab to space
set smartindent     " indent when
set tabstop=40      " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
" set textwidth=79
" set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120

" syntax support

"-----------------
" Plugin settings
"-----------------
" tabbar
let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1

hi Tb_Normal guifg=white ctermfg=white
hi Tb_Changed guifg=green ctermfg=green
hi Tb_VisibleNormal ctermbg=252 ctermfg=235
hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white

" easy-motion
let g:EasyMotion_leader_key = '<Leader>'

" Tagbar
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_autoclose = 1

" tag for markdown
let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
            \ 'h:Heading_L1',
            \ 'i:Heading_L2',
            \ 'k:Heading_L3'
            \ ]
            \ }

" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let g:NERDTreeDirArrows=0
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=0
let NERDTreeWinPos = "right"

" nerdcommenter
let NERDSpaceDelims=1
" nmap <D-/> :NERDComToggleComment<cr>
let NERDCompactSexyComs=1

" powerline
"let g:Powerline_symbols = 'fancy'

" fzf vim keybindings
noremap <leader>ff :Files<CR>
noremap <leader>fb :Buffers<CR>
noremap <leader>fw :Windows<CR>
noremap <leader>fh :History<CR>
noremap <leader>fs :History/<CR>
noremap <leader>fc :Commands<CR>
noremap <leader>f? :Helptags<CR>
noremap <leader>fl :Lines<CR>

" vim fugitive keybindings`
noremap <leader>gd :Gvdiff<CR>
noremap <leader>gs :Gstatus<CR>
noremap <leader>gsd :Gsdiff<CR>
noremap <leader>gvd :Gvdiff<CR>
noremap <leader>gc  :Gcommit<CR>

" Rainbow Parantheses
nnoremap <leader>ra :RainbowToggle<CR>
let g:rainbow_conf = {
            \ 'ctermfgs': ['lightblue', 'lightyellow', 'red', 'darkgreen', 'darkyellow', 'lightred', 'yellow', 'cyan', 'magenta', 'white']
            \}

" Keybindings for plugin toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nmap <F5> :TagbarOpen<cr>
nmap <F6> :NERDTreeToggle<cr>
nmap <F3> :UndotreeToggle<cr>
nmap <F4> :IndentGuidesToggle<cr>
nmap  <D-/> :
nnoremap <leader>a :Ack<space>
nnoremap <leader>v V`]

" Useful Functions
"------------------
" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" jk in insert mode to exit
inoremap jk <Esc>

" selection shortcuts
nnoremap <leader>sa ggVG

" navigate buffers with arrow keys
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

" navigate buffers with personal shortcuts
nnoremap <leader>j :bprev<CR>
nnoremap <leader>k :bnext<CR>
nnoremap <leader>x :bdel<CR>
nnoremap gb :bnext<CR>
nnoremap gB :bprev<CR>

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
nnoremap ; :
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

" for macvim
if has("gui_running")
    "set go=aAce  " remove toolbar
    set transparency=2
    ""不全屏为set nofu
    set nofu
    set guifont=Monaco:h13
    set showtabline=2
    set columns=140
    set lines=40
    set guioptions=mr       "c去掉"
    set guioptions=         " 隐藏全部
    set guioptions+=m       " 隐藏菜单栏
    set guioptions-=T       " 隐藏工具栏
    set guioptions-=L       " 隐藏左侧滚动条
    "set guioptions+=r      " 隐藏右侧滚动条
    "set guioptions-=b      " 隐藏底部滚动条
    "set showtabline-=0     " 隐藏Tab栏
    noremap <D-M-Left> :tabprevious<cr>
    noremap <D-M-Right> :tabnext<cr>
    map <D-1> 1gt
    map <D-2> 2gt
    map <D-3> 3gt
    map <D-4> 4gt
    map <D-5> 5gt
    map <D-6> 6gt
    map <D-7> 7gt
    map <D-8> 8gt
    map <D-9> 9gt
    map <D-0> :tablast<CR>
endif
