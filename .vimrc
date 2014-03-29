"Vundle Stuff
set nocompatible            
filetype off                 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'
filetype plugin indent on     

"Vundle Plugins
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'davidhalter/jedi-vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'Shougo/neocomplcache.vim'
let g:neocomplcache_enable_at_startup = 1

" Dvorak Motion
:nnoremap h <Down>
:nnoremap t <Up>
:nnoremap n <Left>
:nnoremap s <Right>

" Dvorak Save / Quit
:nnoremap m :w!<Enter>
:nnoremap M :q!<Enter>

" Dvorak Search
:nnoremap ; /<Up>
:nnoremap Z N
:nnoremap z n

" Replace One Character
:nnoremap - :exec "normal i".nr2char(getchar())."\e"<CR>

" Center Screen on Cursor
:nnoremap <Enter> zz

" Settings
:set smartindent
:set number
:set so=5

" Tab Settings
:set tabstop=4
:set shiftwidth=4
:set expandtab

" Vimdiff
:nnoremap [ <C-w><Left>
:nnoremap ] <C-w><Right>
:nnoremap { <C-w><Down>
:nnoremap } <C-w><Up>

"Autocomplete
":inoremap <Tab> <C-n>

:nnoremap <C-d> "_d

"Committing
:nnoremap <C-m> :!hg com -m ""<Left>

"E goes to end of word
:nnoremap E ea

"Color
:set t_Co=256
:filetype plugin on
:syntax on
:colorscheme candy
