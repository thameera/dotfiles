"set leader key to comma. Ain't easy to type \
"This need to be set before any plugins are loaded
let mapleader = ","

execute pathogen#infect()

syntax on
filetype plugin indent on

set shiftwidth=4
set tabstop=4
"set noautoindent
set autoindent
set smartindent
set tabpagemax=20
" set foldmethod=syntax

"search
" highlight search results
set hlsearch
" switch off current search with \/
nnoremap <silent> <Leader>/ :nohlsearch<CR>

"case sensitivity
set ignorecase " ic
set smartcase  " sc - case sensitive if term contains uppercase letters

"Ack is grep for vim
nnoremap <leader>a :Ack 

"map <F6> gT
"map <F7> gt
map <F12> zR

"for typing (personal use)
map <F9> r`l
map <F8> xxxr`l

nmap <F2> :w<CR>
imap <F2> <Esc>:w<CR>i

" navigating split screen
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" going to a split and maximizing it
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>k<C-W>_

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

"Tabs
" Navigate tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" Move tabs
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
" new tab
nnoremap <leader>t :tabnew<CR>

"Background color
:highlight Normal ctermbg=235

"Line numbers
set number " nu
:nmap <C-N><C-N> :set invnumber<CR>
" The following sets a better color to line numbers
:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=234 gui=NONE guifg=DarkGrey guibg=NONE

"ctags related
" open definition in a new tab:
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR> 

"taglist
map <F4> :TlistToggle<cr>

"Powerline
python from powerline.bindings.vim import source_plugin; source_plugin()

"Always on rainbow parentheses 
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

