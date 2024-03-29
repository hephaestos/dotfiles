syntax on 
set t_kb=
set nocompatible
set backspace=eol,indent,start
set autoindent
set smartindent

" don't highlight the last search upon startup
set viminfo="h"

" Do C-style auto indentation on C/C++/Perl files only :)
:filetype on
:autocmd FileType c,cpp,perl :set cindent

" stop Vim from beeping all the time
set vb

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
syntax enable
set ruler
set background=dark

set noshowmode	"Tell you if you are in insert mode

set showmatch	"Match parenthesis, i.e. ) with (  and } with {
set incsearch
set ignorecase	"Ignore case when doing searches
set smartcase

set report=0	"Tell you how many lines have been changed

set scrolloff=5
set wildmode=longest,list
set incsearch
set hlsearch

set showtabline=2

"Pro gamer line numbers
"set relativenumber
set number
set cursorline

"Fuzzy file search
set path+=**
set wildmenu

"Tag finding. this builds the tag file
command! MakeTags !ctags -R .

"vim-plug
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot', { 'commit': '2c5af8f' }            "Syntax Highlighting
Plug 'scrooloose/syntastic'		                                "Syntax Checker
Plug 'Raimondi/delimitMate'		                                "Autoclose and indent
Plug 'vim-airline/vim-airline'                                  "Light as air statusline
Plug 'vim-airline/vim-airline-themes'                           "Make it pretty
Plug 'edkolev/tmuxline.vim'                                     "Let's get tmux looking nice too
Plug 'airblade/vim-gitgutter'                                   "Git info
Plug 'tpope/vim-fugitive'                                       "Git wrapper
Plug 'junegunn/gv.vim'                                          "Git commit browser
Plug 'tpope/vim-surround'		                                "Adds actions for surrounding (s)
Plug 'tpope/vim-commentary'		                                "Adds actions for commenting out lines (gc)
Plug 'preservim/nerdtree'	                                    "File Tree
"Plug 'Xuyuanp/nerdtree-git-plugin'                             "Git indicators for nerdtree (Not working :/)
Plug 'ryanoasis/vim-devicons'	                                "Icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                  "Pretty colors for nerdtree
Plug 'scrooloose/nerdtree'		                                "File Tree
Plug 'vimwiki/vimwiki'			                                "Vim Wiki
Plug 'arcticicestudio/nord-vim'                                 "Nord theme
Plug 'ayu-theme/ayu-vim'                                        "Ayu theme

call plug#end()

set termguicolors
let ayucolor="mirage"
try
    colorscheme ayu
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme solarized
endtry

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme = 'ayu_mirage'
	
"For devicons
set encoding=UTF-8

"Gets YCM/TabNine out of the way of Syntastic
let g:ycm_show_diagnostics_ui = 0

"Keeps YCM/TabNine from intercepting Up and Down
let g:ycm_key_list_select_completion = ['<TAB>']
inoremap <silent><Down> <C-R>=pumvisible() ? "\<lt>C-y>\<lt>Down>" : "\<lt>Down>"<CR>
let g:ycm_key_list_select_previous_completion = ['<S-Tab>']
inoremap <silent><Up> <C-R>=pumvisible() ? "\<lt>C-y>\<lt>Up>" : "\<lt>Up>"<CR>

"Keeps me from being a noob
nnoremap <Left> :echo "ಠ_ಠ"<CR>
nnoremap <Right> :echo "ಠ_ಠ"<CR>
nnoremap <Up> :echo "ಠ_ಠ"<CR>
nnoremap <Down> :echo "ಠ_ಠ"<CR>

nnoremap <C-q> :term<CR> 
nnoremap <C-Q> :vert term<CR> 

"set statusline+=&#warningmsg#
"set statusline+=&{SyntasticStatuslineFlag()}
"set statusline+=%

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'clang++'

let g:delimitMate_expand_cr = 2
let g:delimitMate_balance_matchpairs = 1

"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
"set laststatus=2

"C-n opens nerdtree
map <C-n> :NERDTreeToggle<CR>
"Closes vim if only NERDTree is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

"folding
set foldmethod=syntax   
set foldnestmax=10
set nofoldenable
set foldlevel=2

"Handy Things
nnoremap <space> :nohlsearch<CR>
nnoremap ; :
