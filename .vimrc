"Vundle Stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"Vundle Plugins
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'davidhalter/jedi-vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'flazz/vim-colorschemes'
Plugin 'kchmck/vim-coffee-script'
Plugin 'jtratner/vim-flavored-markdown'
call vundle#end()
filetype plugin indent on

" Syntastic Stuff
:let g:syntastic_python_checkers = ['pep8','pylint','flake8']
:let g:syntastic_css_checkers = ['csslint']
:let g:syntastic_coffeescript_checkers = ['coffeelint']

" Dvorak Motion
:nnoremap h <Down>
:nnoremap t <Up>
:nnoremap n <Left>
:nnoremap s <Right>

" Dvorak Save / Quit
:nnoremap m :w!<Enter>
:nnoremap M :q!<Enter>

" Center Screen on Cursor
:nnoremap <C-m> zz 

" Dvorak Search
:nnoremap ; /<Up>
:nnoremap Z N
:nnoremap z n

" Replace One Character
:nnoremap - :exec "normal i".nr2char(getchar())."\e"<CR>

" Settings
:set smartindent
:set number
:set so=5

" Tab Settings
:set tabstop=2
:set shiftwidth=2
:set expandtab

" Vimdiff
:nnoremap [ <C-w><Left>
:nnoremap ] <C-w><Right>
:nnoremap { <C-w><Down>
:nnoremap } <C-w><Up>

" Control-d to delete into a null buffer
" this is useful when you want to delete before pasting and not override
" what's in your pase buffer
:nnoremap <C-d> "_d

"E goes to end of word
:nnoremap E ea

"Color
:set t_Co=256
:filetype plugin on
:syntax on
:colorscheme xoria256

:set backupdir=~/.vim/tmp/

" Remove trailing ending lines
function TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction

au BufWritePre *.py call TrimEndLines()

" Remove trailing whitespace on file save
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e

" Markdown syntax highlighting
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Scrolling
:set mouse=a

" Renaming tmux panes
autocmd BufEnter,BufReadPost,FileReadPost,BufNewFile,BufWritePre * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux rename-window [empty]")

" Share clipboard in tmux
set clipboard=unnamed

" Set search options
:set incsearch
:set hlsearch

" Remember line where file was last opened
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
