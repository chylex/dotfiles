set autoindent
set encoding=utf-8
set history=1024
set hlsearch
set ignorecase
set incsearch
set infercase
set laststatus=2
set linebreak
set listchars=space:·,tab:>·,trail:~,extends:>,precedes:<
set mouse=a
set noerrorbells
set nomodeline
set noshowcmd
set noshowmode
set number
set nrformats-=octal
set relativenumber
set scrolloff=999
set shiftwidth=0
set showbreak=↪
set showmatch
set sidescrolloff=999
set smartcase
set tabstop=4
set ttymouse=xterm2
set wildmenu
set wrap

" Show full description for lines and bytes
set shortmess-=l

" Show search count
set shortmess-=S

" Color scheme
syntax enable
colorscheme custom
highlight LineNr    ctermfg=244
highlight IncSearch ctermfg=251 ctermbg=238
highlight Search    ctermfg=251 ctermbg=238
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

" Move some commands closer on Czech keyboard layout
nnoremap ú @@
noremap ů ;
map § %

" Navigate to end of previous word
noremap <A-b> ge
noremap <A-S-b> gE

" Navigate soft-wrapped lines
nnoremap <expr> j v:count ? 'j' : 'gj'
vnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
vnoremap <expr> k v:count ? 'k' : 'gk'

" Navigate camel humps (https://github.com/vim-scripts/camelcasemotion)
map L <Plug>CamelCaseMotion_w
map H <Plug>CamelCaseMotion_b

" Edit camel humps (https://github.com/vim-scripts/camelcasemotion)
omap iL <Plug>CamelCaseMotion_iw
xmap iL <Plug>CamelCaseMotion_iw
omap iH <Plug>CamelCaseMotion_ib
xmap iH <Plug>CamelCaseMotion_ib

" Edit from cursor to start/end of parenthesized block
nnoremap c) c])
nnoremap d) d])
nnoremap c( c[((
nnoremap d( c[((<ESC>l

" Delete lines
nnoremap C cc
nnoremap D dd
vnoremap C cc
vnoremap D dd

" Enter visual block mode
nnoremap <Space>v <C-V>
onoremap <Space>v <C-V>

" Indent keeping selection
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Turn capital letters into opposite actions
nnoremap U :redo<CR>

" Reselect pasted text
nnoremap gp `[v`]

" Put without yank
xmap p gr

" Plugin: https://github.com/easymotion/vim-easymotion.git
map <Space> <Plug>(easymotion-prefix)

" Plugin: https://github.com/machakann/vim-highlightedyank
let g:highlightedyank_highlight_duration = 500

" Plugin: https://github.com/luochen1990/rainbow
let g:rainbow_active = 1

