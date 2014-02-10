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
"Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-obsession'
Bundle 'tpope/vim-sensible'
Bundle 'ervandew/supertab'
Bundle 'mhinz/vim-startify'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Raimondi/delimitMate'
"Bundle 'SirVer/ultisnips'
Bundle 'suan/vim-instant-markdown'
Bundle 'chilicuil/vim-sml-coursera'
Bundle 'mikewest/vimroom'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'

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
set shiftwidth=2    " no. of spaces for step in autoindent

" Exception for python, sh, cpp files
au FileType python,sh,c,cpp,h set tabstop=4 shiftwidth=4 softtabstop=4

set tabpagemax=20

" Turn mouse on in normal mode
set mouse=n

"Search
" highlight search results
set hlsearch
" switch off current search with ,/
nnoremap <silent> <Leader>/ :nohlsearch<CR>

"case sensitivity
set ignorecase
set smartcase  " case sensitive if term contains uppercase letters
set wildignorecase " case insensitive filename completion

" preserve undo btvn sessions
set undofile
"set undo directory. Having un~ files everywhere is messy
set undodir=~/.tmp

" Write with sudo
cmap w!! w !sudo tee > /dev/null %

"Tabs
" Navigate tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" Move tabs
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
" new tab
nnoremap <leader>tt :tabnew<CR>
" Use <Leader>tl to move to last viewed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

"Background color
highlight Normal ctermbg=235

"Line numbers
set number
nmap <C-N><C-N> :set invnumber<CR>
" Set a better color to line numbers
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=234 gui=NONE guifg=DarkGrey guibg=NONE

" Ack
nnoremap <leader>a :Ack 

" NERDTree
"autocmd VimEnter * if !argc() | Startify | NERDTree | execute "normal \<c-w>w" | endif " NERDTree + Startify
map <C-e> :NERDTreeToggle<CR>

" startify
let g:startify_custom_header = map(split(system('fortune -as | cowsay'), '\n'), '" ". v:val') + ['']

"ctags related
" open definition in a new tab:
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR> 

"taglist
"map <F4> :TlistToggle<cr>

"Powerline
"python from powerline.bindings.vim import source_plugin; source_plugin()

"Tagbar
nmap <F6> :TagbarToggle<CR>

"Always on rainbow parentheses 
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

