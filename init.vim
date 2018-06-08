call plug#begin()
"COLORSCHEME
Plug 'sjl/badwolf' "colorscheme

"ESSENTIAL
Plug 'tpope/vim-sensible' "sensible defaults
Plug 'tpope/vim-unimpaired' "use [ and ] commands
Plug 'tpope/vim-commentary' "use gcc to comment
Plug 'easymotion/vim-easymotion' "better line jumps

"MISC
" Plug 'tpope/vim-sleuth' "automatically set tabwidth
Plug 'jiangmiao/auto-pairs' "autoclose brackets, quotes and parenthesis
Plug 'ctrlpvim/ctrlp.vim' "fuzzy search files and buffers
Plug 'vim-airline/vim-airline' "better bottom line
Plug 'vim-airline/vim-airline-themes' "add themes for airline
Plug 'Yggdroot/indentLine' "guidelines for indents
Plug 'itchyny/vim-cursorword' "underline word under cursor
Plug 'tpope/vim-repeat' "more . repeats for other plugins
Plug '907th/vim-auto-save' "autosave after edit

"SESSIONS
Plug 'tpope/vim-obsession' "manage sessions
Plug 'farmergreg/vim-lastplace' "remember cursor position vertically

"SYNTAX
Plug 'pangloss/vim-javascript' "javascript syntax

"COMPLETION
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }

"LINTING
Plug 'w0rp/ale' "automatic linting
Plug 'prettier/vim-prettier', { 'do': 'npm install' } "Pretty automatic javascript

"FILE EXPLORER
Plug 'francoiscabrol/ranger.vim' "file explorer
Plug 'rbgrouleff/bclose.vim' "needed by ranger.vim in neovim

"SEARCH
Plug 'jremmen/vim-ripgrep'

"SNIPPETS
Plug 'SirVer/ultisnips' "snippets
Plug 'honza/vim-snippets' "snippet library
call plug#end()

"BASICS
set hidden "files will be hidden and not closed when buffer changes
set encoding=utf8
set title "set filename in window title tab
set clipboard=unnamedplus "use system clipboard for yank

"BACKUP
set nobackup "get rid of annoying ~file
set nowb
set noswapfile

"MAP
inoremap jj <ESC>
nmap <F2> :Ranger<CR>
" nmap <F2> :Exp<CR>

"THEME
set number "line numbers
set cursorline "highlight line at cursor position
syntax on "syntax highlight
"matching bracets underlined instead of cursor changing
hi MatchParen cterm=underline ctermbg=none ctermfg=none
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro "disable continuation of comments

"COLORSCHEME
set termguicolors "add 256 color support
colorscheme badwolf
" change comments to italic, must come after colorscheme
highlight Comment gui=italic 

"TABS
set expandtab "spaces instead of tabs
set shiftwidth=2 "one tab 2 spaces
set tabstop=2

"SEARCH
set showmatch "highlight search
set hlsearch "highlight stays after search

"NETRW
let g:netrw_liststyle = 3 "tree list style

"AUTOSAVE
" let g:auto_save=1

"EASYMOTION
"two characters easymotion line jumps
nmap <Space> <Plug>(easymotion-s)

"AIRLINE
let g:airline#extensions#tabline#enabled=1 "enable tabline on the top
let g:airline#extensions#tabline#formatter='unique_tail' "change default tabline format

"CTRLP
set wildignore+=*/_/*,*/node_modules/*,*/components/*,*.zip
let g:ctrlp_working_path_mode='ra'
nmap <F3> :CtrlPBuffer<CR>

"DEOPLETE
let g:deoplete#enable_at_startup=1
let g:deoplete#sources#ternjs#omit_object_prototype=0 " Do not show object.prototype suggestions

"ALE + ESLINT
nmap <silent> <Right> :ALENext<cr>
nmap <silent> <Left> :ALEPrevious<cr>
