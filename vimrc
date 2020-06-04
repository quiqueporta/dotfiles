" Plug
call plug#begin()

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'wincent/terminus' " Change cursor in Inssert and  Replace
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'

Plug 'vim-scripts/AutoComplPop'

Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'

Plug 'majutsushi/tagbar'

Plug 'editorconfig/editorconfig-vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

Plug 'tpope/vim-sleuth' " This plugin automatically adjusts 'shiftwidth' and 'expandtab'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'

Plug 'janko-m/vim-test', { 'for': ['ruby', 'python', 'javascript'] }

Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'hashivim/vim-terraform'
Plug 'joukevandermaas/vim-ember-hbs'

Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'


call plug#end()

let mapleader=","

set encoding=utf-8

set ruler
"set relativenumber
set number
"set number relativenumber

"augroup numbertoggle
  "autocmd!
  "autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  "autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

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

set undofile
set undodir=~/.vim/undodir

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

map vimrc :tabnew $MYVIMRC<cr>
" :source $MYVIMRC
nnoremap <leader>q <esc>:q<cr>
nnoremap <leader>s <esc>:w<cr>

noremap <F2> <esc>:w<cr>
noremap <C-S> <esc>:w<cr>
inoremap <F2> <esc>:w<cr>
inoremap <C-S> <esc>:w<cr>
vnoremap <F2> <esc>:w<cr>
vnoremap <C-S> <esc>:w<cr>

noremap <F3> :NERDTreeToggle<cr>
inoremap <F3> <esc>:NERDTreeToggle<cr>
noremap <F4> <esc>:NERDTreeFind<cr>

inoremap kj <esc>l

" Duplicar linea
nnoremap dl :t.<cr>

noremap j gj
noremap k gk

nnoremap ñ ;

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

nmap <silent><space> :nohl<CR>

set incsearch
set ignorecase
set smartcase
set hlsearch
set scrolloff=10

nnoremap n nzzzv
nnoremap N Nzzzv

let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '__pycache__']
let NERDTreeHighlightCursorline = 1

"if filereadable(expand("~/.vimrc_background"))
  "let base16colorspace=256
  "source ~/.vimrc_background
"endif

syntax on

colorscheme base16-materia
set t_Co=256
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

nmap <leader>e :Files<CR>
nmap <leader>l :Lines<CR>
nmap <leader>m :History<CR>
nmap <leader>b :Buffers<CR>
cnoreabbrev Ack Ack!
nnoremap <Leader>w :Ack! --py --ignore migrations --ignore tests<Space>
let g:ackprg = "ag --vimgrep"
let g:ackhighlight = 1
nmap <leader>W :Windows<CR>

let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_python_pylint_post_args='--disable=C0301,C0111'
let g:syntastic_python_flake8_post_args='--ignore=E501,D100,D101,D102,D103'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let test#python#runner = 'djangotest'
function! DockerTransform(cmd) abort
   return 'clear && docker-compose exec backend '. a:cmd
endfunction

let g:test#custom_transformations = {'docker': function('DockerTransform')}
let g:test#transformation = 'docker'

nmap <silent> <leader>rt :TestNearest --settings=agroptima.settings.test --keepdb --failfast<CR>
nmap <silent> <leader>rT :TestFile --settings=agroptima.settings.test --keepdb --failfast<CR>
nmap <silent> <leader>ra :TestSuite --settings=agroptima.settings.test --keepdb --failfast<CR>
nmap <silent> <leader>rl :TestLast --settings=agroptima.settings.test --keepdb --failfast<CR>
nmap <silent> <leader>rg :TestVisit --settings=agroptima.settings.test --keepdb --failfast<CR>

"nmap <silent> <leader>rt :TestNearest<CR>
"nmap <silent> <leader>rT :TestFile<CR>
"nmap <silent> <leader>ra :TestSuite<CR>
"nmap <silent> <leader>rl :TestLast<CR>
"nmap <silent> <leader>rg :TestVisit<CR>

let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#rename_command = "<leader>R"

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"

let g:fzf_buffers_jump = 1

let g:tagbar_compact = 1
let g:tagbar_sort = 1
let g:tagbar_autoclose = 1
let g:tagbar_foldlevel = 0
let g:tagbar_width = 60
nmap <leader>t :TagbarToggle<CR>

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1
let g:terraform_fmt_on_save=1

set completeopt-=preview   " Hide the documentation preview window

