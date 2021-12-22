:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

" UI plugins
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/tpope/vim-endwise'
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/sheerun/vim-polyglot'

" Bundles
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/OmniSharp/omnisharp-vim'
Plug 'https://github.com/elixir-editors/vim-elixir'
Plug 'https://github.com/slashmili/alchemist.vim'
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/tpope/vim-rails'

" Tools
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/ervandew/supertab'
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/nathanaelkane/vim-indent-guides'	
Plug 'https://github.com/vim-autoformat/vim-autoformat'
Plug 'https://github.com/github/copilot.vim'

set encoding=UTF-8

call plug#end()

nmap <F8> :TagbarToggle<CR>

:colorscheme sonokai

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" indent guide	
let g:indent_guides_enable_on_vim_startup = 1	
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=2	
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=blue ctermbg=3

" vim-autoformat 	
let g:python3_host_prog="/usr/bin/python3"	
noremap <F3> :Autoformat<CR>	
au BufWrite * :Autoformat

" Esc substitutes
:imap kj <Esc>
:imap jk <Esc>

" Change to tab #
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" Plugin keybindings
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nnoremap <C-p> :Files<Cr>
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Coc plugins
" CocInstall coc-git coc-snippets coc-tsserver coc-html coc-css
" CocInstall coc-emmet coc-highlight coc-eslint coc-json coc-rls
" CocInstall coc-yaml coc-vetur coc-solargraph coc-prettier 
" CocInstall coc-pairs coc-tslint coc-python coc-omnisharp coc-elixir
" OmnisharpInstall

" Install exuberant
		
let g:formatterpath = ['/home/phamd/.rbenv/shims/htmlbeautifier']
