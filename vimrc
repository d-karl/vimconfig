language en_US.utf8

" Plugins via vundle manager

filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#rc()
adding stuff just to test
" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Visual stuff
" Vim Airline{{{
Plugin 'vim-airline/vim-airline'
" The following attempts to use a nice triangle separator for airline.
" this did not work in chrom os ssh client as the triangles were too small
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#keymap_ignored_filetypes = ['vimfiler', 'nerdtree']
let g:airline#extensions#tabline#show_close_button = 0
let airline#extensions#tabline#ignore_bufadd_pat = '\c\vgundo|undotree|vimfiler|tagbar|nerd_tree'
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long', 'mixed-indent-file' ]

let airline#extensions#syntastic#stl_format_warn = ''

" disable fugitive integration since it slows down stuff very hard
let g:airline#extensions#branch#enabled = 1

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

" Windowswap
Plugin 'https://github.com/wesQ3/vim-windowswap'

" Windowswap Airline integration
let g:airline#extensions#windowswap#enabled = 1
let g:airline#extensions#windowswap#indicator_text = 'WS'
"}}}

"FZF {{{
Plugin 'junegunn/fzf'
Plugin 'd-karl/fzf.vim'

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
"}}}

Plugin 'vim-airline/vim-airline-themes'

" Code Completions{{{
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
" Ycm settings
let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_tags_files = 1
"}}}

" function to toggle ycm auto completion, so default vim autocomplete {{{
" can be used.
inoremap <C-x> <C-r>=DisableYCMAuto()<CR><C-x>

augroup RestoreYcm
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
    else
        let g:ycm_auto_trigger=0
        let g:ycm_manual_disable=1
    endif
endfunction
nnoremap <silent> <leader>[ :call ToggleYcm()<CR>
inoremap <silent> <leader>[ <c-o>:call ToggleYcm()<CR>
"}}}

" Fast navigation
Plugin 'jwhitley/vim-matchit'
Plugin 'Lokaltog/vim-easymotion'

" Fast editing
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mbbill/undotree'
" Plugin 'godlygeek/tabular'
" Plugin 'nathawordnaelkane/vim-indent-guides'

" vim-repeat since easyclip needs it
Plugin 'tpope/vim-repeat'

" Yanking / Deleting{{{
Plugin 'machakann/vim-highlightedyank'
Plugin 'd-karl/YankRing.vim'
let g:yankring_min_element_length = 2
let g:yankring_max_history = 50
function! YRRunAfterMaps()
    nnoremap <silent>  Y   :<C-U>YRYankCount 'y$'<CR>
endfunction

"}}}

" IDE features
Plugin 'scrooloose/nerdtree'

" Snippets{{{
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"}}}

" Tags
Plugin 'majutsushi/tagbar'
Plugin 'ludovicchabant/vim-gutentags'

Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'

" Syntax checking plus options{{{
Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_tcl_checkers = ["nagelfar"]
"}}}

" Rainbow parantheses{{{
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 0 "0 if you want to enable it later via :RainbowToggle
"}}}

" Color Schemes{{{
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'chriskempson/vim-tomorrow-theme'
"}}}

" TCL support{{{
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
"}}}

" Vim UI{{{
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
"set highlight 	                                 " conflict with highlight current line
set ignorecase
set smartcase

" editor settings
set history=1000
set nocompatible
set confirm                                      " prompt when existing from an unsaved file

" folding
set foldenable
set foldlevelstart=255

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

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
"}}}

"-----------------
" Plugin settings
"-----------------
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
noremap <leader>fw :Windows<CR>
noremap <leader>fh :History<CR>
noremap <leader>fs :History/<CR>
noremap <leader>fc :Commands<CR>
noremap <leader>f? :Helptags<CR>
noremap <leader>fl :Lines<CR>
noremap <leader>ft :Tags<CR>
noremap <leader>fm :Marks<CR>
"}}}

" vim fugitive keybindings`{{{
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
" dangerously removed an if here
cabbrev split vert split
cabbrev hsplit split
cabbrev help vert help
noremap <C-w>] :vert botright wincmd ]<CR>
noremap <C-w><C-]> :vert botright wincmd ]<CR>
"}}}

" Rainbow Parantheses{{{
nnoremap <leader>ra :RainbowToggle<CR>
let g:rainbow_conf = {
            \ 'ctermfgs': ['lightblue', 'lightyellow', 'red', 'darkgreen', 'darkyellow', 'lightred', 'yellow', 'cyan', 'magenta', 'white']
            \}
"}}}

" Keybindings for plugin toggle{{{
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nmap <F5> :TagbarToggle<cr>
nmap <F6> :NERDTreeToggle<cr>
nmap <F4> :UndotreeToggle<cr>
nnoremap <silent> <F7> :YRShow<CR>
nmap  <D-/> :
nnoremap <leader>a :Ack<space>
nnoremap <leader>v V`]
"}}}

" -----------------
" Useful Functions
"------------------
" Vim settings{{{
" allow repeating of yanks with . command
set cpoptions+=y
"}}}
" Personal bindings{{{
" remove trailing whitspace
nnoremap <leader>rw :%s/\s\+$//e<CR>

" jk in insert mode to exit
inoremap jk <Esc>

" user shortcuts to move to EOL/BOL
nnoremap <leader>l $
nnoremap <leader>h 0

" shortcut to paste last yanked buffer instead of last deleted
nnoremap <leader>p "0p
nnoremap <leader>P "0P

" Shortcut to insert empty lines before and after current line
nnoremap <leader>o o<c-U><Esc>
nnoremap <leader>O O<c-U><Esc>

" Shortcut to open tag definition in vsplit
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

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
nnoremap ; :
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

noremap <leader>cd :colorscheme Tomorrow-Night-Eighties<CR>
noremap <leader>ch :colorscheme Tomorrow<CR>
"}}}

" for macvim
if has("gui_running")
  set guioptions = cm
endif
" vim:fdm=marker:
