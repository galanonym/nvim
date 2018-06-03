call plug#begin()
Plug 'tpope/vim-sensible' "sensible defaults
Plug 'tpope/vim-unimpaired' "use [ and ] commands
Plug 'tpope/vim-commentary' "use gcc to comment
Plug 'tpope/vim-vinegar' "better netrw
Plug 'morhetz/gruvbox' "colorscheme
Plug 'easymotion/vim-easymotion' "better line jumps

Plug 'jiangmiao/auto-pairs' "autoclose brackets, quotes and parenthesis
Plug 'pangloss/vim-javascript' "javascript syntax
Plug 'farmergreg/vim-lastplace' "remember cursor position
Plug 'ctrlpvim/ctrlp.vim' "fuzzy search files and buffers
Plug 'vim-airline/vim-airline' "better bottom line
Plug 'Yggdroot/indentLine' "guidelines for indents
Plug 'itchyny/vim-cursorword' "underline word under cursor
" Plug '907th/vim-auto-save' "autosave after edit

" Plug 'maralla/completor.vim' "autocomplete with tern
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' } "better autocomplete, run 'do' in /Plugged/YouCompleteMe if errors

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'w0rp/ale' "automatic linting
Plug 'prettier/vim-prettier', { 'do': 'npm install' } "Pretty automatic javascript
" Plug 'scrooloose/nerdtree' "file explorer
Plug 'francoiscabrol/ranger.vim' "file explorer
Plug 'rbgrouleff/bclose.vim' "needed by ranger.vim

Plug 'SirVer/ultisnips' "snippets
Plug 'honza/vim-snippets'
call plug#end()

"BASICS
set hidden "files will be hidden and not closed when buffer changes
set encoding=utf8
set title "set filename in window title tab

"BACKUP
set nobackup "get rid of annoying ~file
set nowb
set noswapfile

"MAP
inoremap jj <ESC>
nmap <F2> :Ranger<CR>

"NETRW
let g:netrw_liststyle = 3 "tree list style

"THEME
set number "line numbers
set cursorline "highlight line at cursor position
syntax on "syntax highlight
"matching bracets underlined instead of cursor changing
hi MatchParen cterm=underline ctermbg=none ctermfg=none
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro "disable continuation of comments

"COLORSCHEME
set background=dark "dark gruvbox theme
let g:gruvbox_italic=1 "enable italic for gruvbox, must be before colorscheme
let g:gruvbox_contrast_dark='hard' "darker gruvbox
colorscheme gruvbox

"TABS
set expandtab "spaces instead of tabs
set shiftwidth=2 "one tab 2 spaces
set tabstop=2

"SEARCH
set showmatch "highlight search
set hlsearch "highlight stays after search

"EASYMOTION
"two characters easymotion line jumps
nmap <Space> <Plug>(easymotion-s)

"CTRLP
set wildignore+=*/_/*,*/node_modules/*,*/components/*,*.zip
let g:ctrlp_working_path_mode='ra'

"AUTOSAVE PLUGIN
let g:auto_save = 1 "enable on start

"YOU COMPLETE ME TERN
" set completeopt-=preview
" let g:ycm_add_preview_to_completeopt=0

"DEOPLETE
let g:deoplete#enable_at_startup = 1

"NERDTREE
" nmap <F2> :NERDTreeFind<CR>
" let g:NERDTreeWinSize=35
" let NERDTreeShowHidden=1 "show .hidden files

