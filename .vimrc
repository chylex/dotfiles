set autoindent
set encoding=utf-8
set ignorecase
set incsearch
set history=1024
set hlsearch
set mouse=a
set number
set relativenumber
set scrolloff=12
set shiftwidth=0
set showmatch
set sidescrolloff=48
set smartcase
set tabstop=4
set wildmenu
set wrap

" Color scheme
syntax enable
colorscheme peachpuff
highlight LineNr    ctermfg=244
highlight IncSearch ctermfg=251
highlight Search    ctermfg=251
highlight Visual    ctermfg=240 ctermbg=250

" Swap navigation after 'f' or 't'
noremap ; ,
noremap , ;

" Edit from cursor to start/end of parenthesized block
nnoremap c) c])
nnoremap d) d])
nnoremap c( c[((
nnoremap d( c[((<ESC>l

" Edit from cursor to end of special characters
nnoremap c" ct"
nnoremap d" dt"
nnoremap c' ct'
nnoremap d' dt'
nnoremap c] ct]
nnoremap d] dt]

" Indent keeping selection
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Turn capital letters into opposite actions
nnoremap E ge
nnoremap U :redo<CR>

" Reselect pasted text
nnoremap gp `[v`]

" Alternative way to enter visual block mode
nnoremap <Space>v <C-V>
