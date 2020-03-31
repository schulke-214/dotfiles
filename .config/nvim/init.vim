"""""""""""""""""""""""""""""""""""""""""""
""""""""""" github/schulke-214 """"""""""""
"""""""""""""""""""""""""""""""""""""""""""

set nocompatible		" required
filetype off			" required

""""""""""""""""" vundle """"""""""""""""""

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" core
Plugin 'VundleVim/Vundle.vim'

" ux
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-syntastic/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'christoomey/vim-tmux-navigator'

" generic code support
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'lambdatoast/elm.vim'

" markdown / writing
Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'LanguageTool'

" customization 
Plugin 'AnsiEsc.vim'
Plugin 'jdsimcoe/abstract.vim'
Plugin 'wadackel/vim-dogrun'
Plugin 'nightsense/snow'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'AlessandroYorba/Sierra'
Plugin 'daylerees/colour-schemes'
Plugin 'effkay/argonaut.vim'
Plugin 'ajh17/Spacegray.vim'
Plugin 'atelierbram/Base2Tone-vim'
Plugin 'colepeters/spacemacs-theme.vim'
Plugin 'dylanaraps/wal.vim'
Plugin 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

call vundle#end()		" required
filetype plugin indent on	" required

""""""""""""""""" config """"""""""""""""""
" core
let g:elite_mode=1
set nowrap
set backspace=indent,eol,start
set number
set laststatus=2
set list
set listchars=tab:➞\ ,extends:›,precedes:‹,nbsp:·,trail:·,space:·
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
colorscheme abstract
let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

" nerdcommenter
let g:NERDSpaceDelims = 1                   " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1               " Use compact syntax for prettified multi-line comments
let g:NERDCommentEmptyLines = 1             " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1        " Enable trimming of trailing whitespace when uncommenting

" markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" writing
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
let g:languagetool_jar  = '/opt/languagetool/languagetool-commandline.jar'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" supertab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" coc
let g:coc_global_extensions = [
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-python',
  \ 'coc-java',
  \ 'coc-rls',
  \ 'coc-vimtex',
  \ 'coc-vetur',
  \ 'coc-json', 
  \ 'coc-pairs',
  \ 'coc-snippets',
  \ 'coc-git',
  \ 'coc-emmet',
  \ 'coc-highlight',
  \ 'coc-tslint',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ ]

" fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'
  \ }

let g:fzf_layout = { 'down': '~40%' }
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \ }

let g:fzf_history_dir = '~/.local/share/fzf-history'

""""""""""""""""""""

map <C-e> :NERDTreeToggle<CR>
map <C-f> <Plug>Sneak_s
map <C-F> <Plug>Sneak_S

" ressources:
" - https://github.com/amacgregor/dot-files/blob/master/vimrc
" - https://dev.to/allanmacgregor/vim-is-the-perfect-ide-e80