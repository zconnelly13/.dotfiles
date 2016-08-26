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
Plugin 'jtratner/vim-flavored-markdown'
call vundle#end()
filetype plugin indent on

" Syntastic Stuff
:let g:syntastic_python_checkers = ['flake8']
:let g:syntastic_css_checkers = ['csslint']
:let g:syntastic_coffeescript_checkers = ['coffeelint']
:let g:syntastic_json_checkers = ['jsonlint']
:let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" Dvorak Motion
:nnoremap h <Down>
:nnoremap t <Up>
:nnoremap n <Left>
:nnoremap s <Right>

" Dvorak Save / Quit
:nnoremap m :noh<Enter>:w!<Enter>
:nnoremap M :q!<Enter>

" Dvorak Search
:nnoremap ; /<Up>
:nnoremap Z N
:nnoremap z n

" Settings
:set smartindent
:set number
:set so=5

" Tab Settings
:set tabstop=2
:set shiftwidth=2
:set expandtab

" Vimdiff
:nnoremap [ <C-W><C-H>
:nnoremap ] <C-W><C-L>
:nnoremap { <C-W><C-J>
:nnoremap } <C-W><C-K>

" Control-d to delete into a null buffer
" this is useful when you want to delete before pasting and not override
" what's in your pase buffer
:nnoremap <C-d> "_d

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

" I LIKE A LOT OF OF TABS OKAY
:set tabpagemax=200

" persistent undo history
:set undofile

" Don't make backups at all
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

set winwidth=79

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>
