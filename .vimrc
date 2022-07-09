set autoindent
set encoding=utf-8
set ignorecase
set incsearch
set history=1024
set hlsearch
set mouse=v
set noerrorbells
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
colorscheme custom
highlight LineNr    ctermfg=244
highlight IncSearch ctermfg=251
highlight Search    ctermfg=251
highlight Visual    ctermfg=240 ctermbg=250

" Map top row on Czech keyboard layout to digits
map + 1
map ě 2
map š 3
map č 4
map ř 5
map ž 6
map ý 7
map á 8
map í 9
map é 0

" Swap navigation after 'f' or 't'
noremap ; ,
noremap , ;

" Navigate to indents
nnoremap J +
vnoremap J +
nnoremap K -
vnoremap K -

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

" Alternative way to enter visual block mode
nnoremap <Space>v <C-V>

" Indent keeping selection
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Turn capital letters into opposite actions
nnoremap U :redo<CR>

" Reselect pasted text
nnoremap gp `[v`]

" Plugin: https://github.com/easymotion/vim-easymotion.git
map <Space> <Plug>(easymotion-prefix)

" Plugin: https://github.com/machakann/vim-highlightedyank
let g:highlightedyank_highlight_duration = 500

" Plugin: https://github.com/luochen1990/rainbow
let g:rainbow_active = 1

