set encoding=utf-8

" Vim-plug initialization

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')

if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

call plug#begin("~/.vim/plugged")

" Override configs by directory.
" Create a .vim.custom file in the directory you want to customize.
Plug 'arielrossanigo/dir-configs-override.vim'

" File browser
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Change cursor in Insert and Replace
Plug 'wincent/terminus' 

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color scheme
Plug 'chriskempson/base16-vim'

" Code commenter
Plug 'scrooloose/nerdcommenter'

" Better motion
Plug 'easymotion/vim-easymotion'

" Class/module browser
Plug 'majutsushi/tagbar'

" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

" Ack code search (requires ack or ag installed in the system)
Plug 'mileszs/ack.vim'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Surround
Plug 'tpope/vim-surround'

" Autocompletion
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'vim-scripts/AutoComplPop'

" Syntactic analysis
Plug 'scrooloose/syntastic'

" Run tests
Plug 'janko-m/vim-test', { 'for': ['python'] }
Plug 'tpope/vim-dispatch' " asynchronous

" Note
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc' " needed for vim-notes

" Code snippets
Plug 'SirVer/ultisnips'

call plug#end()


if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" no vi-compatible
set nocompatible

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" always show status bar
set ls=2

" incremental search
set incsearch

" highlighted search results
set hlsearch

" syntax highlight on
syntax on

" swap, backup and undo files
set directory=~/.vim/dirs/tmp     " folder for swap files
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " folder for backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo " if you exit vim and later start, vim remembers information like, command line history, search history, marks, etc ...

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" tabs and spaces handling
set expandtab " hitting Tab in insert mode will produce the appropriate number of spaces
set tabstop=4 " tell vim how many columns a tab counts for
set softtabstop=4 " control how many columns vim uses when you hit Tab in insert mode
set shiftwidth=4 " control how many columns text is indented with the reindent operations (<< and >>)


" show
set ruler " show the line and column number of the cursor position
set number " precede each line with its line number

" show tabs, eol and spaces
set list
" chars to use to show the tabs, eol and spaces
set listchars=tab:▸\ ,eol:¬,trail:·

" show rule in colum 100
set colorcolumn=100

" how to split windows
set splitbelow
set splitright

au VimResized *:wincmd = " resize splits when windows are reduced

" show cursor line
set cursorline

augroup cline
  " delete any old autocommand
  au! 
  " remove cursor line on windows leave and when on insert mode
  au WinLeave,InsertEnter * set nocursorline
  " show cursor line on window enter or when exit from insert mode
  au WinEnter,InsertLeave * set cursorline
augroup END

" use 256 colors when possible
colorscheme base16-materia
set t_Co=256
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set wildmenu

" when scrolling, keep cursor 5 lines away from screen border
set scrolloff=5

" save as sudo
cmap w!! w !sudo tee "%"

" search
set incsearch " incremental search
set ignorecase " search is case insensitive but you can add \C to make it sensitive
set smartcase " will automatically switch to a case-sensitive search if you use any capital letters

" ============================== 
" mappings
" ============================== 

" :map and :noremap are recursive and non-recursive

let mapleader=","

" quit file
nnoremap <leader>q <esc>:q<cr>

" go to normal mode. amazing!!
inoremap kj <esc>l

" move between windows
noremap <TAB><TAB> <C-w><C-w>

" do nothing when F1 is pressed
noremap <F1> <nop>
inoremap <F1> <nop>

" key mapping for save file
nnoremap <F2> <esc>:w<CR>
inoremap <F2> <esc>:w<CR>
vnoremap <F2> <esc>:w<CR>
nnoremap <leader>s <esc>:w<CR>
inoremap<leader>s <esc>:w<CR>
vnoremap <leader>s <esc>:w<CR>

" tab navigation mappings
nnoremap tn :tabn<CR>
nnoremap tp :tabp<CR>
nnoremap tm :tabm<CR>
nnoremap tt :$tabnew<CR>

" move text lines and blocks
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" reselect text after indentation
vnoremap < <gv
vnoremap > >gv
nnoremap > <c-w>>
nnoremap < <c-w><

" override next and previous search to show in the middle of the screen (zz)
" and also open just enough folds (zv) to make the line in which the cursor 
" is located not folded.
nnoremap n nzzzv
nnoremap N Nzzzv

" clear search results
nnoremap <silent><space> :nohl<CR>

" select current line without identation
nnoremap vv ^vg_

" duplicate line
nnoremap dl :t.<CR>

" remap up and down keys to navigate on warp lines
noremap j gj
noremap k gk

" repeat t/T/f/F search easily
nnoremap ñ ;

" disable arrow keys
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" ???
set complete=.,w,b,u,t
set completeopt=longest,menuone " Use the popup menu also when there is only one match.
set completeopt-=preview   " Hide the documentation preview window
set omnifunc=syntaxcomplete#Complete


" ============================
" Plugins configuration
" ============================

" NERDTree ------------------------------

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap <F4> :NERDTreeFind<CR>
" dont show this files
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '__pycache__']
" show cursor line
let NERDTreeHighlightCursorline = 1

" Autorefresh on tree focus
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()

" Ariline -------------------------------
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" Fuzzy finder -------------------------
nnoremap <leader>e :GFiles<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>m :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>W :Windows<CR>
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--preview', '--info=inline']}, <bang>0)

" Ack ----------------------------------
cnoreabbrev Ack Ack!
nnoremap <Leader>w :Ack! --py --ignore migrations --ignore tests<space>
let g:ackprg = "ag --vimgrep"
let g:ackhighlight = 1

" Syntastic ----------------------------

let g:syntastic_python_checkers = ['flake8', 'mypy']
let g:syntastic_python_flake8_post_args='--ignore=E501,D100,D101,D102,D103'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Tagbar ------------------------------
let g:tagbar_compact = 1
let g:tagbar_sort = 1
let g:tagbar_autoclose = 1
let g:tagbar_foldlevel = 0
let g:tagbar_width = 60
" open Tagbar
nnoremap <leader>t :TagbarToggle<CR>


" Jedi-vim ------------------------------

let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "right"

" Rename
let g:jedi#rename_command = '<leader>R'
" Go to definition
let g:jedi#goto_command = '<leader>d'
" Find ocurrences
let g:jedi#usages_command = '<leader>o'
" Find assignments
let g:jedi#goto_assignments_command = '<leader>a'

" Vim tests -----------------------------

" run tests in a vim8 terminal
let g:test#strategy = "vimterminal"

nmap <silent> <leader>rt :TestNearest<CR>
nmap <silent> <leader>rT :TestFile<CR>
nmap <silent> <leader>ra :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>
nmap <silent> <leader>rg :TestVisit<CR>

" Vim notes -----------------------------

let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.txt'

" Ultinips ------------------------------

let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.
