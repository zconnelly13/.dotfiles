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
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'flazz/vim-colorschemes'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'leafgarland/typescript-vim'
Plugin 'munshkr/vim-tidal'
Plugin 'gfontenot/vim-xcode'
Plugin 'keith/swift.vim'
Plugin 'tokorom/syntastic-swiftlint.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'chaimleib/vim-renpy'
Plugin 'jparise/vim-graphql'
Plugin 'hashivim/vim-terraform'
Plugin 'rust-lang/rust.vim'
Plugin 'psf/black'
call vundle#end()
filetype plugin indent on

:set encoding=utf-8

" Syntastic Stuff
:let g:syntastic_python_checkers = ['flake8']
:let g:syntastic_css_checkers = ['csslint']
:let g:syntastic_coffeescript_checkers = ['coffeelint']
:let g:syntastic_json_checkers = ['jsonlint']
:let g:syntastic_swift_checkers = ['swiftlint', 'swiftpm']
:let g:syntastic_typescript_checkers = ['eslint']
:let g:syntastic_typescript_eslint_exec = 'eslint_d'
:let g:syntastic_javascript_checkers = ['eslint_d']
:let g:syntastic_markdown_checkers = ['mdl']
:let g:syntastic_lua_checkers = ["luac", "luacheck"]
:let g:syntastic_dart_checkers = ['dartanalyzer']
:let g:syntastic_stylus_checkers = ['stylint']
:let g:syntastic_yaml_checkers = ['yamllint']
:let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_swift_swiftlint_use_defaults = 1 
:nnoremap ,n :lnext<enter>
:nnoremap ,p :lnext<enter>
:nnoremap ,l :!black %<enter>

" Highlight the current line
:set cursorline

" Map Leader
:let mapleader = ","

" Go to Definiton
let g:jedi#goto_assignments_command = "<leader>o"
set tags=tags

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

" Marks
:nnoremap ' m

" Settings
:set smartindent
:set number
:set so=5
:set ruler

" Tab Settings
:set tabstop=4
:set shiftwidth=4
:set expandtab

" Vimdiff
:nnoremap [ <C-W><C-H>
:nnoremap ] <C-W><C-L>
:nnoremap { <C-W><C-J>
:nnoremap } <C-W><C-K>

" Tabs
:nnoremap T :tabp<Enter>
:nnoremap H :tabn<Enter>

" Control-d to delete into a null buffer
" this is useful when you want to delete before pasting and not override
" what's in your paste buffer
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
au BufWritePre *.ts call TrimEndLines()
au BufWritePre *.js call TrimEndLines()
au BufWritePre *.ts call TrimEndLines()
au BufWritePre *.jsx call TrimEndLines()
au BufWritePre *.list call TrimEndLines()
au BufWritePre *.md call TrimEndLines()
au BufWritePre *.swift call TrimEndLines()
au BufWritePre *.yml call TrimEndLines()
au BufWritePre *.css call TrimEndLines()
au BufWritePre *.html call TrimEndLines()

" Remove trailing whitespace on file save
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.ts :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.jsx :%s/\s\+$//e
autocmd BufWritePre *.list :%s/\s\+$//e
autocmd BufWritePre *.md :%s/\s\+$//e
autocmd BufWritePre *.styl :%s/\s\+$//e
autocmd BufWritePre *.swift :%s/\s\+$//e
autocmd BufWritePre *.yml :%s/\s\+$//e
autocmd BufWritePre *.css :%s/\s\+$//e

" Markdown syntax highlighting
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Auto reload with linter
autocmd BufNewFile,BufReadPost *.jsx set autoread

" Set .styl files as stylus!?
autocmd BufNewFile,BufRead *.styl set filetype=stylus

" Scrolling
:set mouse=a

" Renaming tmux panes
autocmd BufEnter,BufReadPost,FileReadPost,BufNewFile,BufWritePre * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux rename-window [empty]")

" Share clipboard in tmux
:set clipboard=unnamed

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
set noswapfile
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

set winwidth=79
set columns=80

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SELECTA
"
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" ipdb
nnoremap <leader>i oimport ipdb; ipdb.set_trace()  # noqa:E702<Esc>

" go to next linting error
nnoremap <leader>u :ll<cr>

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file in various ways.
nnoremap <leader>t :call SelectaCommand("find . \\( -name 'node_modules' -prune -o -name 'venv' -prune -o -name '.git' -prune \\) -o -print \| grep -v '~'", "", ":tabe")<cr>
nnoremap <leader>s :call SelectaCommand("find . \\( -name 'node_modules' -prune -o -name 'venv' -prune -o -name '.git' -prune \\) -o -print \| grep -v '~'", "", ":vsplit")<cr>
nnoremap <leader>e :call SelectaCommand("find . \\( -name 'node_modules' -prune -o -name 'venv' -prune -o -name '.git' -prune \\) -o -print \| grep -v '~'", "", ":e")<cr>

nnoremap '' ``
nnoremap <leader>j :%!python3 -m "json.tool"<Enter>

" Git Grep
nnoremap <leader>g :call SelectaCommand("git grep -ni '' \| grep -v '~'", "\| awk -F \":\" '{print \"+\"$2 \" \" $1}'", ":tabe")<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" This must go at the bottom?
:hi CursorLineNr cterm=NONE

nnoremap <leader>f :!eslint_d % --fix<enter>

nnoremap <leader>b :Git blame<enter>
