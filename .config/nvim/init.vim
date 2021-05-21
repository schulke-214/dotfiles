"""""""""""""""""""""""""""""""""""""""""""
""""""""""" github/schulke-214 """"""""""""
"""""""""""""""""""""""""""""""""""""""""""

set nocompatible                           " required
filetype off                               " required

"""""""""""""""" vim plug """""""""""""""""

call plug#begin('~/.local/share/nvim/plug')

" syntax support
Plug 'vim-syntastic/syntastic'

" ux
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mg979/vim-visual-multi'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" customization
Plug 'doums/darcula'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" LaTeX
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()

""""""""""""""""" config """"""""""""""""""

" core
set mouse=a
set nowrap
set backspace=indent,eol,start
set number
set laststatus=2
set encoding=utf-8
set list
set listchars=tab:➞\ ,extends:›,precedes:‹,nbsp:·,trail:·,space:·
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*

autocmd ColorScheme * highlight SpecialKey ctermfg=darkgray
autocmd ColorScheme * highlight NonText ctermfg=darkgray

" tabs
set tabstop=4
set shiftwidth=4
set smarttab
set noexpandtab

" theme
syntax on
set t_Co=256
colorscheme darcula

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'

" coc
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-eslint', 
  \ 'coc-git',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-json', 
  \ 'coc-pairs',
  \ 'coc-prettier', 
  \ 'coc-pyright',
  \ 'coc-rls',
  \ 'coc-snippets',
  \ 'coc-tslint',
  \ 'coc-tsserver',
  \ 'coc-vimtex',
  \ ]

" nerdtree
let g:NERDTreeRespectWildIgnore=1          " Hide the files that match wildignore
let g:NERDTreeShowHidden=1                 " Show hidden files
let g:NERDTreeWinSize=40                   " Set the window width of NERDTree
let g:NERDSpaceDelims = 1                  " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1              " Use compact syntax for prettified multi-line comments
let g:NERDCommentEmptyLines = 1            " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1       " Enable trimming of trailing whitespace when uncommenting
let g:NERDTreeDirArrowExpandable = '+'     " Set the expand icon
let g:NERDTreeDirArrowCollapsible = '-'    " Set the collapse icon
let g:NERDTreeIgnore=[
  \ 'node_modules',
  \ '.git'
  \ ]

" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
"vmap <C-j> <Plug>(coc-snippets-select)

" keybindings
map <C-e> :NERDTreeToggle<CR>

