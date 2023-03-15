" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/vim/plugged')
Plug 'Chiel92/vim-autoformat'
Plug 'Valloric/YouCompleteMe'
Plug 'codable/diffreview'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'digitaltoad/vim-jade'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'godlygeek/tabular'
Plug 'hynek/vim-python-pep8-indent'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'moll/vim-node'
Plug 'morhetz/gruvbox'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'rhysd/vim-clang-format'
Plug 'roryokane/detectindent'
Plug 'steffanc/cscopemaps.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
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
colorscheme gruvbox
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
nmap <C-\>m :!cscope -Rqb<CR>:!ctags -R --c++-kinds=+p --fields=+iaS --extras=+q --exclude=output --exclude=results .<CR>

" Setup clang format
let g:clang_format#command='clang-format-6.0'
let g:clang_format#detect_style_file=1
let g:clang_format#enable_fallback_style=0
let g:formatter_yapf_style = 'google'
let g:formatters_python = ['yapf']

" Setup YouCompleteMe
set encoding=utf-8
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" Backspace fix
set backspace=indent,eol,start

" Vertical diff
set diffopt+=vertical

" The Silver Searcher
let g:ackprg = 'ag --vimgrep'
nnoremap <leader>k :Ack \\b<cword>\\b<CR>

" The Git grep
let g:ackprg = 'ag --vimgrep'
nnoremap <leader>g :Ggrep \\b<cword>\\b<CR>

" Search selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
vnoremap /g y:Ggrep '<C-R>=escape(@",'/\')<CR>'<CR>

setlocal spell spelllang=en_us

set exrc
