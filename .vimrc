set autoindent
set backspace=indent,eol,start
set encoding=utf-8
set guifont=Cascadia_Mono:h12:cANSI:qDRAFT
set guioptions-=t " Remove menu tearoff
set history=1024
set hlsearch
set ignorecase
set incsearch
set infercase
set laststatus=2
set linebreak
set list
set listchars=lead:·,trail:·,tab:→\ ,extends:>,precedes:<
set modeline
set modelines=2
set mouse=a
set noerrorbells
set noshowcmd
set noshowmode
set nrformats-=octal
set number
set relativenumber
set scrolloff=999
set shiftwidth=0
set shortmess-=S " Show search count
set shortmess-=l " Show full description for lines and bytes
set showbreak=↪\ 
set showmatch
set sidescrolloff=999
set smartcase
set tabstop=4
set ttimeout
set ttimeoutlen=50
set ttymouse=xterm2
set virtualedit=onemore
set wildmenu
set winaltkeys=no
set wrap

" Windows paths
set packpath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME
set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME

" Color scheme
syntax enable

if has("gui_running")
  colorscheme retrobox
  highlight NonText ctermfg=14 guifg=#7c6f64
else
  colorscheme custom
  highlight LineNr    ctermfg=244
  highlight IncSearch ctermfg=251 ctermbg=238
  highlight Search    ctermfg=251 ctermbg=238
  highlight Visual    ctermfg=240 ctermbg=250
endif

highlight SpecialKey ctermfg=8 guifg=#584f46

" Windows GUI
if has("win32") && has("gui_running")
  au GUIEnter * simalt ~x " Maximize window
  set listchars+=tab:▶\ 
  set renderoptions=type:directx " Fix unicode rendering
  set showbreak=→\ 
endif

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
map ů %
nnoremap ú @@
noremap , +

noremap § `
noremap §§ ``
nnoremap m§ m

sunmap ů
sunmap §

" Enter visual block mode
noremap <M-v> <C-v>

" Navigate camel humps (https://github.com/vim-scripts/camelcasemotion)
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

nnoremap gj j
xnoremap gj j
nnoremap gk k
xnoremap gk k

" Navigate unmatched parentheses/braces
noremap g( [(
noremap g) ])
noremap g{ [{
noremap g} ]}

" Edit from cursor to start/end of parenthesized block
nnoremap c) c])
nnoremap d) d])
nnoremap c( c[((
nnoremap d( c[((<Esc>l

" Create lines
nnoremap go o<Esc>$
nnoremap gO O<Esc>$
nnoremap g<CR> i<CR><Esc>l

" Edit current line
nnoremap C cc
xnoremap C cc
nnoremap D dd
xnoremap D dd
nnoremap < <<
nnoremap > >>

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

" Use Ctrl for selection and clipboard
nnoremap <C-a> ggVG
xnoremap <C-a> ggoG

xnoremap <C-c> "+y
xnoremap <C-x> "+x

noremap <C-v> "+gP
inoremap <C-v> <C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR>
cnoremap <C-v> <C-r>+

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
