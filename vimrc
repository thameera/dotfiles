let mapleader = ","

" For vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'tpope/vim-sensible'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-obsession'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'ajh17/VimCompletesMe'

Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'

" Previously used plugins
"Bundle 'scrooloose/nerdtree'
""Bundle 'Lokaltog/powerline'
""Bundle 'mhinz/vim-startify'
"Bundle 'Raimondi/delimitMate'
""Bundle 'SirVer/ultisnips'
""Bundle 'suan/vim-instant-markdown'
""Bundle 'chilicuil/vim-sml-coursera'
"Bundle 'mikewest/vimroom'
"Bundle 'tpope/vim-fugitive'
"Bundle 'gregsexton/gitv'
"Bundle 'rking/ag.vim'
"Bundle 'groenewege/vim-less'
"Bundle 'Shougo/neocomplete.vim'
"Bundle 'tpope/vim-dispatch'
""Bundle 'Valloric/YouCompleteMe'
"Bundle 'sheerun/vim-polyglot'
"Bundle 'fholgado/minibufexpl.vim'
"Bundle 'mattn/flappyvird-vim'

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

" Insert mode calculator
" Press <C-A> after typing an operation
inoremap <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

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

"Run q macro with Q
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Auto-save on buffer lose focus
:au BufLeave,FocusLost * silent! update

"Tabs
" Move tabs
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
" new tab
nnoremap <leader>tt :tabnew
" Left/right arrow keys to navigate tabs
nnoremap <silent> <Left> :tabprevious<CR>
nnoremap <silent> <Right> :tabnext<CR>
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


" NERDTree
"autocmd VimEnter * if !argc() | Startify | NERDTree | execute "normal \<c-w>w" | endif " NERDTree + Startify
"map <C-e> :NERDTreeToggle<CR>

"ctags related
" open definition in a new tab:
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR> 

"Always on rainbow parentheses 
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" emmet
"Enable only for html/css files
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Abbreviations "
function JSAbbrevs()
  iab clog console.log('');<Esc>2hi
endfunction

augroup Abbrevs
  autocmd!
  au BufNewFile,BufRead *.js,*.html,*.html call JSAbbrevs()
augroup END
" /Abbreviations "

