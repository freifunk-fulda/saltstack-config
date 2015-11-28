" THIS FILE IS CONTROLLED BY SALTSTACK!

" Set a cool color scheme
colorscheme desert

" Nice backspace
set bs=2

" Case insensitive search
set ignorecase
set smartcase
set incsearch
set hlsearch

" Show line numbers
set nu
set numberwidth=5

" Tab width of 4 spaces for a tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set smarttab

" Automatical idention
set autoindent
set smartindent

" Enable filetype indention and highlighting
filetype off
filetype plugin indent on
syntax on

" Underline the current line
set cursorline

" Show right border
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Undo-Level at maximum
set ul=1000

" Show matching brackets and jump to them for 0 / 10 seconds
set showmatch
set matchtime=1

" Enable continous indentation
vnoremap < <gv
vnoremap > >gv

" Bind tab and window moving
map <C-k> <c-w>k
map <C-j> <c-w>j
map <C-h> <c-w>h
map <C-l> <c-w>l

map <C-n> <esc>:tabnext<CR>
map <C-m> <esc>:tabprev<CR>

map <C-t> <esc>:tabnew<CR>

" Enable folding
set foldenable
set foldmethod=indent
set foldcolumn=1
set foldlevelstart=5
nnoremap <space> za
highlight Folded ctermfg=gray
highlight Folded ctermbg=0
highlight FoldColumn ctermbg=0
highlight SpecialKey ctermfg=darkgray

" Show tailing spaces and tabs
set list
set listchars=tab:>>,trail:.

" Enable statusline
set laststatus=2

" Show context while scrolling
set scrolloff=5
