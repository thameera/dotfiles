let mapleader = ","

" For vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
"Bundle 'Lokaltog/powerline'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'tpope/vim-obsession'
Bundle 'tpope/vim-sensible'
Bundle 'mhinz/vim-startify'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Raimondi/delimitMate'
"Bundle 'SirVer/ultisnips'
Bundle 'suan/vim-instant-markdown'
Bundle 'chilicuil/vim-sml-coursera'
Bundle 'mikewest/vimroom'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'
Bundle 'rking/ag.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'groenewege/vim-less'
Bundle 'Shougo/neocomplete.vim'

syntax on
filetype plugin indent on

" Move to prev/next line after reaching first/last char
set whichwrap+=<,>,h,l,[,]

set bs=indent,eol,start   " allow backspacing over everything
set softtabstop=2   " no of spaces for tab when editing
set tabstop=2       " no. of spaces for tab in file
set expandtab       " expand tabs into spaces
set smarttab        " smart tabulation n backspace

set autoindent
set smartindent
set ci   " copyindent
set pi   " preserveindent
set shiftwidth=2    " no. of spaces for step in autoindent

" Exception for python, sh, cpp files
au FileType python,sh,c,cpp,h,java set tabstop=4 shiftwidth=4 softtabstop=4

au FileType python set foldmethod=indent

set tabpagemax=20

" Turn mouse on in normal mode
set mouse=n

" Shortcut for desktop clipboard
nnoremap + "+

" Indent with Tab/Shift+Tab in visual mode
xmap <Tab> >
xmap <S-Tab> <

" Delete to black hole register with X
noremap X "_d
nnoremap XX "_dd

" Edit/reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Swap files directory
set directory=~/tmp

"Search
" highlight search results
set hlsearch
" switch off current search with ,/
nnoremap <silent> <Leader>/ :nohlsearch<CR>

"case sensitivity
set ignorecase
set smartcase  " case sensitive if term contains uppercase letters
set wildignorecase " case insensitive filename completion

set wildignore=*.pyc,*.o,*.lo,*.la,*.exe,*.swp,*.db,*.bak,*.old,*.dat,*~,~*

" preserve undo btvn sessions
set undofile
"set undo directory. Having un~ files everywhere is messy
set undodir=~/.tmp

" Write with sudo
cmap w!! w !sudo tee > /dev/null %

" Auto-save on buffer lose focus
:au BufLeave,FocusLost * silent! update

"Tabs
" Navigate tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" Move tabs
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
" new tab
nnoremap <leader>tt :tabnew
" Use <Leader>tl to move to last viewed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

"Windows
set splitbelow
set splitright

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

"Background color
highlight Normal ctermbg=235

"Line numbers
set nu
set rnu  " relative line numbers
" Toggle line numbers
nmap <C-N><C-N> :set invnumber<CR>
" Set a better color to line numbers
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=234 gui=NONE guifg=DarkGrey guibg=NONE

" Ack
nnoremap <leader>a :Ack 

" CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()


" NERDTree
"autocmd VimEnter * if !argc() | Startify | NERDTree | execute "normal \<c-w>w" | endif " NERDTree + Startify
map <C-e> :NERDTreeToggle<CR>

" startify
let g:startify_custom_header = map(split(system('fortune -as | cowsay'), '\n'), '" ". v:val') + ['']

"ctags related
" open definition in a new tab:
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR> 

"Powerline
"python from powerline.bindings.vim import source_plugin; source_plugin()

"Always on rainbow parentheses 
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

