" Plug
call plug#begin()

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'wincent/terminus'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'

Plug 'vim-scripts/AutoComplPop'

Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'

Plug 'editorconfig/editorconfig-vim'

" Search with ack
Plug 'wincent/ferret', { 'on': ['Ack', 'Acks'] }

Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'

Plug 'janko-m/vim-test', { 'for': ['ruby', 'python', 'javascript'] }

Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'posva/vim-vue', { 'for': 'vue' }

Plug 'scrooloose/syntastic'

call plug#end()

let mapleader=","

set encoding=utf-8

set ruler
set number
set colorcolumn=100

set wildmenu

set nobackup
set nowritebackup
set noswapfile

set listchars=tab:▸\ ,eol:¬,trail:·
set list
set lisp " Autocompletado encuentre las cadenas con '-'

set splitbelow
set splitright
set autoread

set complete=.,w,b,u,t
set completeopt=longest,menuone,preview
set omnifunc=syntaxcomplete#Complete

set mouse=a

au VimResized *:wincmd = " Redimensionar los splits al rediucir la ventana.

set cursorline
augroup cline
  au!
  au WinLeave,InsertEnter * set nocursorline
  au WinEnter,InsertLeave * set cursorline
augroup END


noremap <F1> <nop>
inoremap <F1> <nop>

map vimrc :tabnew ~/.vimrc<cr>

nnoremap <leader>q <esc>:q<cr>

noremap <F2> <esc>:w<cr>
inoremap <F2> <esc>:w<cr>
vnoremap <F2> <esc>:w<cr>

noremap <F3> :NERDTreeToggle<cr>
inoremap <F3> <esc>:NERDTreeToggle<cr>
noremap <F4> <esc>:NERDTreeFind<cr>

inoremap kj <esc>l

" Duplicar linea
nnoremap dl :t.<cr>

noremap j gj
noremap k gk

nnoremap tn :tabn<cr>
nnoremap tp :tabp<cr>
nnoremap tm :tabm<cr>
nnoremap tt :tabnew<cr>

noremap <TAB><TAB> <C-w><C-w>

" Para mover bloques de texto y lineas.
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Se vuelver a seleccionar el texto despues de identarlo
vnoremap < <gv
vnoremap > >gv
nnoremap > <c-w>>
nnoremap < <c-w><

" Selecciona la linea actual sin seleccionar la identación.
nnoremap vv ^vg_

cmap w!! %!sudo terr > /dev/null %

noremap <silent><space> :nohls<cr>

set incsearch
set ignorecase
set smartcase
set hlsearch
set scrolloff=10

nnoremap n nzzzv
nnoremap N Nzzzv

let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '__pycache__']
let NERDTreeHighlightCursorline = 1

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

let g:ctrlp_map= '<leader>e'
noremap <leader>b :CtrlPBuffer<cr>
noremap <leader>f :CtrlPLine<cr>
noremap <leader>m :CtrlPMRUFiles<cr>

let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_python_pylint_post_args='--disable=C0301,C0111'
let g:syntastic_python_flake8_post_args='--ignore=E501,D100,D101,D102,D103'
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let test#strategy = 'dispatch'
nmap <silent> <leader>rt :TestNearest --keepdb<CR>
nmap <silent> <leader>rT :TestFile --keepdb<CR>
nmap <silent> <leader>ra :TestSuite --keepdb<CR>
nmap <silent> <leader>rl :TestLast<CR>
nmap <silent> <leader>rg :TestVisit<CR>

let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "right"

let g:tagbar_compact = 1
let g:tagbar_sort = 0
nmap <leader>t :TagbarToggle<CR>
