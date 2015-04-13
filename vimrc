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
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-surround'
Plugin 'richsoni/vim-ecliptic'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'tpope/vim-abolish'

" Reqd for vim-easytags
Plugin 'xolox/vim-misc'

" :UpdateTags to create tags file
" Ctrl+] to jump to definition
Plugin 'xolox/vim-easytags'

" ,tb to show tagbar (mapped below)
Plugin 'majutsushi/tagbar'

Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
Plugin 'gregsexton/MatchTag'
Plugin 'mxw/vim-jsx'

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

"breakindent ftw
set breakindent
set showbreak=>>

" Exception for python, sh, cpp files
au FileType python,sh,c,cpp,h,java set tabstop=4 shiftwidth=4 softtabstop=4

set tabpagemax=20

" Turn mouse on in normal mode
set mouse=n

" Shortcut for desktop clipboard
nnoremap + "+

" Map \ to , coz , was mapped to be the Leader
nnoremap \ ,

" Indent with Tab/Shift+Tab in visual mode
xmap <Tab> >
xmap <S-Tab> <

" Delete to black hole register with X
noremap X "_d
nnoremap XX "_dd

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

" Moar copy paste mappings
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
imap <C-V> <C-R>+

" Select the text just pasted
noremap gV `[v`]

" Edit/reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Swap files directory
set directory=~/tmp
set backupdir=~/tmp

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

"Buffers
" Left/right arrow keys to navigate buffers
nnoremap <silent> <Left> :bp<CR>
nnoremap <silent> <Right> :bn<CR>

"Tabs
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

"netrw
let g:netrw_liststyle=3  " nerd-tree like

"Background color
"highlight Normal ctermbg=235
"colorscheme darkblue

"Line numbers
set nu
set rnu  " relative line numbers
" Toggle line numbers
nmap <C-N><C-N> :set invnumber<CR>
" Set a better color to line numbers
"highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=234 gui=NONE guifg=DarkGrey guibg=NONE

" Ack
nnoremap <leader>a :Ack! 

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](tmp|node_modules|build|git|svn)$',
  \ 'file': '\v\.(rnc|exe|dll|png|jpg|ico)'
  \ }


" NERDTree
"autocmd VimEnter * if !argc() | Startify | NERDTree | execute "normal \<c-w>w" | endif " NERDTree + Startify
"map <C-e> :NERDTreeToggle<CR>

"Always on rainbow parentheses 
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" emmet
"Enable only for html/css files
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Abbreviations "
function JSAbbrevs()
  iab clog console.log();<Esc>hi
endfunction

function CppAbbrevs()
    iab scn std::cin >>
    iab sct std::cout <<
    iab sen std::endl
endfunction

augroup Abbrevs
  autocmd!
  au BufNewFile,BufRead *.js,*.html,*.html call JSAbbrevs()
  au BufNewFile,BufRead *.cpp,*.h call CppAbbrevs()
augroup END
" /Abbreviations "

" Ack motions
" eg: \aw to ack the current word. Also \at* etc
nnoremap <silent> \a :set opfunc=<SID>AckMotion<CR>g@
xnoremap <silent> \a :<C-U>call <SID>AckMotion(visualmode())<CR>

function! s:CopyMotionForType(type)
  if a:type ==# 'v'
    silent execute "normal! `<" . a:type . "`>y"
  elseif a:type ==# 'char'
    silent execute "normal! `[v`]y"
  endif
endfunction

function! s:AckMotion(type) abort
  let reg_save = @@

  call s:CopyMotionForType(a:type)

  execute "normal! :Ack! --literal " . shellescape(@@) . "\<cr>"

  let @@ = reg_save
endfunction
" /Ack motions

" easytags
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" tagbar
" Open/close tagbar with ,tb
nmap <silent> <leader>tb :TagbarToggle<CR>

" vim-jsx
let g:jsx_ext_required = 0

