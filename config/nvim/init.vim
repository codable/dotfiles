" Vundle required
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'codable/diffreview'
Plugin 'Conque-GDB'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'elzr/vim-json'
Plugin 'godlygeek/tabular'
Plugin 'haya14busa/vim-poweryank'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'majutsushi/tagbar'
Plugin 'matchit.zip'
Plugin 'moll/vim-node'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'rhysd/vim-clang-format'
Plugin 'roryokane/detectindent'
Plugin 'scrooloose/nerdtree'
Plugin 'steffanc/cscopemaps.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-markdown'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vim-scripts/php.vim-html-enhanced'
Plugin 'vim-scripts/winmanager'
call vundle#end()            " required
filetype plugin indent on    " required

" Syntax
syntax on

" Color scheme
set background=light
colorscheme solarized
let g:airline_theme='solarized'
let g:airline_solarized_bg='light'

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
let g:clang_format#command='clang-format-5.0'
let g:clang_format#auto_format=1

" Yank to local
augroup YankOverTerminal
   autocmd!
   autocmd TextYankPost * call poweryank#osc52(join(v:event.regcontents))
augroup END
