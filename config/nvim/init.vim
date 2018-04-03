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
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vim-scripts/php.vim-html-enhanced'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/winmanager'
call vundle#end()            " required
filetype plugin indent on    " required

" Syntax
syntax on

" Use dark backgroud theme
set background=light

" Customizations
colorscheme solarized

" Share clipboard with OS
set clipboard=unnamed

" Use paste mode to solve paste indent issue
set paste

" Better tab
set shiftwidth=4
set tabstop=4
set expandtab

" Tell bad spaces
:match Error /\s\+$/

" Always show status bar
set laststatus=2

" CtrlP
map mo :CtrlP .<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*.o,.*,*.jar,node_modules

augroup DetectIndent
   autocmd!
   autocmd BufReadPost *  DetectIndent
augroup END

nmap <C-\>m :!cscope -Rqb<CR>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Yank to local
augroup YankOverTerminal
   autocmd!
   autocmd TextYankPost * call poweryank#osc52(join(v:event.regcontents))
augroup END