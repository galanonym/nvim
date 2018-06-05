call plug#begin()
"COLORSCHEME
Plug 'morhetz/gruvbox' "colorscheme

"ESSENTIAL
Plug 'tpope/vim-sensible' "sensible defaults
Plug 'tpope/vim-unimpaired' "use [ and ] commands
Plug 'tpope/vim-commentary' "use gcc to comment
Plug 'easymotion/vim-easymotion' "better line jumps
" Plug 'tpope/vim-vinegar' "better netrw

"MISC
Plug 'tpope/vim-sleuth' "automatically set tabwidth
Plug 'jiangmiao/auto-pairs' "autoclose brackets, quotes and parenthesis
Plug 'ctrlpvim/ctrlp.vim' "fuzzy search files and buffers
Plug 'vim-airline/vim-airline' "better bottom line
Plug 'Yggdroot/indentLine' "guidelines for indents
Plug 'itchyny/vim-cursorword' "underline word under cursor

"SESSIONS
Plug 'farmergreg/vim-lastplace' "remember cursor position vertically
Plug 'thaerkh/vim-workspace' "session management, undo history, auto-save 

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

"SNIPPETS
Plug 'SirVer/ultisnips' "snippets
Plug 'honza/vim-snippets' "snippet library
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
set termguicolors "add 256 color support
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
nmap <F3> :CtrlPBuffer<CR>

"DEOPLETE
let g:deoplete#enable_at_startup = 1

"ALE + ESLINT
nmap <silent> <Right> :ALENext<cr>
nmap <silent> <Left> :ALEPrevious<cr>

"WORKSPACE
let g:workspace_autosave_untrailspaces=0 "do not automatically remove spaces
let g:workspace_session_name='.nvim-session'
let g:workspace_undodir='~/.config/.temp/undodir'
