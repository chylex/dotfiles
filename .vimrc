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
set modeline
set modelines=2
set mouse=a
set noerrorbells
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
set ttimeout
set ttimeoutlen=50
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

" Fix Alt mappings (https://github.com/vim/vim/issues/2588#issuecomment-697959290)
for ord in range(65, 90) + range(97, 122)
  let char = nr2char(ord)
  exec printf("set <m-%s>=\<esc>%s", char, char)
  exec printf("tnoremap <silent> <m-%s> <esc>%s", char, char)
endfor

" Navigate editor tabs
noremap <M-h> gT
noremap <M-l> gt

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
noremap § ;
map ů %
map gů g%
sunmap ů

" Camel humps (https://github.com/vim-scripts/camelcasemotion)
map L <Plug>CamelCaseMotion_w
map H <Plug>CamelCaseMotion_b
sunmap L
sunmap H

omap iL <Plug>CamelCaseMotion_iw
xmap iL <Plug>CamelCaseMotion_iw
omap iH <Plug>CamelCaseMotion_ib
xmap iH <Plug>CamelCaseMotion_ib

" Navigate to end of previous word
noremap <M-b> ge
noremap <M-S-b> gE

" Navigate soft-wrapped lines
nnoremap <expr> j v:count ? 'j' : 'gj'
xnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
xnoremap <expr> k v:count ? 'k' : 'gk'

" Edit from cursor to start/end of parenthesized block
nnoremap c) c])
nnoremap d) d])
nnoremap c( c[((
nnoremap d( c[((<Esc>l

" Delete lines
nnoremap C cc
xnoremap C cc
nnoremap D dd
xnoremap D dd

" Enter visual block mode
map <M-v> <C-v>

" Indent keeping selection
xnoremap < <gv
xnoremap > >gv
xnoremap = =gv

" Turn capital letters into opposite actions
nnoremap U :redo<CR>

" Reselect pasted text
nnoremap gp `[v`]

" Put without yank
xnoremap p P
xnoremap P p

" Clear search highlights
nnoremap <Esc> :nohlsearch<Return><Esc>

" Update search register when using f/t
function FindChar(action, reverse, search_affix)
  let t:reverse_search = a:reverse
  let char = nr2char(getchar())
  
  if char == '\'
    let query = '\\'
  else
    let query = '\C\V'.char.'\v'
  endif
  
  if a:reverse
    call setreg('/', query.a:search_affix)
  else
    call setreg('/', a:search_affix.query)
  endif
  
  nohlsearch
  execute 'normal! '.a:action.char
endfunction

function FindCharVisual(action, reverse, search_affix)
  normal gv
  call FindChar(a:action, a:reverse, a:search_affix)
endfunction

function! ResetReverseSearchFlag()
  if getcmdtype() =~ "[/?]"
    let t:reverse_search = 0
  endif
endfunction

nmap f :call FindChar('f', 0, '')<CR>
nmap F :call FindChar('F', 1, '')<CR>
nmap t :call FindChar('t', 0, '\zs.\ze')<CR>
nmap T :call FindChar('T', 1, '\zs.\ze')<CR>

xmap f :call FindCharVisual('f', 0, '')<CR>
xmap F :call FindCharVisual('F', 1, '')<CR>
xmap t :call FindCharVisual('t', 0, '\zs.\ze')<CR>
xmap T :call FindCharVisual('T', 1, '\zs.\ze')<CR>

noremap <expr> n 'nN'[t:reverse_search]
noremap <expr> N 'Nn'[t:reverse_search]

cnoremap <CR> <cmd>call ResetReverseSearchFlag()<CR><CR>

" Plugin: https://github.com/easymotion/vim-easymotion.git
nmap <Space> <Plug>(easymotion-overwin-f)
xmap <Space> <Plug>(easymotion-s)
omap <Space> <Plug>(easymotion-s)

" Plugin: https://github.com/machakann/vim-highlightedyank
let g:highlightedyank_highlight_duration = 500

" Plugin: https://github.com/luochen1990/rainbow
let g:rainbow_active = 1
