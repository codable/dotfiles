" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'codable/diffreview'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'digitaltoad/vim-jade'
Plug 'elzr/vim-json'
Plug 'godlygeek/tabular'
Plug 'hynek/vim-python-pep8-indent'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'moll/vim-node'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'rhysd/vim-clang-format'
Plug 'roryokane/detectindent'
Plug 'scrooloose/nerdtree'
Plug 'steffanc/cscopemaps.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/php.vim-html-enhanced'
Plug 'vim-scripts/winmanager'
" Initialize plugin system
call plug#end()

filetype plugin indent on    " required

" Syntax
syntax on

" Color scheme
set background=dark
colorscheme solarized
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Share clipboard with OS
set clipboard=unnamed

" Better tab
set shiftwidth=4
set tabstop=4
set expandtab

" Tell bad spaces
:match Error /\s\+$/

" Always show status bar
set laststatus=2

" Detect indent
augroup DetectIndent
   autocmd!
   autocmd BufReadPost *  DetectIndent
augroup END

" Generate meta files for cscope and ctags
nmap <C-\>m :!cscope -Rqb<CR>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Setup clang format
let g:clang_format#command='clang-format-6.0'
let g:clang_format#auto_format=1
let g:clang_format#enable_fallback_style=0

" Setup YouCompleteMe
set encoding=utf-8
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" Backspace fix
set backspace=indent,eol,start

" The Silver Searcher
let g:ackprg = 'ag --vimgrep'
nnoremap <leader>k :Ack <cword><CR>
