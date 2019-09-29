call plug#begin()
"COLORSCHEME
Plug 'sjl/badwolf' "colorscheme

"ESSENTIAL
Plug 'tpope/vim-sensible' "sensible defaults
Plug 'tpope/vim-unimpaired' "use [ and ] commands
Plug 'tpope/vim-commentary' "use gcc to comment
Plug 'wellle/targets.vim' "better targets
Plug 'easymotion/vim-easymotion' "better line jumps

"MISC
Plug 'tpope/vim-sleuth' "automatically set tabwidth
Plug 'jiangmiao/auto-pairs' "autoclose brackets, quotes and parenthesis
Plug 'ctrlpvim/ctrlp.vim' "fuzzy search files and buffers
Plug 'vim-airline/vim-airline' "better bottom line
Plug 'vim-airline/vim-airline-themes' "add themes for airline
Plug 'nathanaelkane/vim-indent-guides' "guidelines for indents
Plug 'itchyny/vim-cursorword' "underline word under cursor
Plug 'tpope/vim-repeat' "more . repeats for other plugins
Plug 'wesQ3/vim-windowswap' "swap window plugin
Plug 'terryma/vim-smooth-scroll' "smooth scroll

"SESSIONS
Plug 'tpope/vim-obsession' "manage sessions
Plug 'farmergreg/vim-lastplace' "remember cursor position vertically

"SYNTAX
Plug 'pangloss/vim-javascript' "javascript syntax
Plug 'tbastos/vim-lua' "nicer lua syntax
Plug 'lumiliet/vim-twig' "twig syntax
Plug 'nikvdp/ejs-syntax' "ejs syntax

"COMPLETION
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }

"LINTING
Plug 'w0rp/ale' "automatic linting
Plug 'prettier/vim-prettier', { 'do': 'npm install' } "Pretty automatic javascript

"FILE EXPLORER
Plug 'scrooloose/nerdtree'
Plug 'orderthruchaos/sbd.vim' "smart buffer delete fixes :bd in default nerdtree

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
set scrolloff=999 "always stay in the middle when scrolling

"BACKUP
set nobackup "get rid of annoying ~file
set nowb
set noswapfile

"MAP
inoremap jj <ESC>
nmap <F2> :NERDTreeFind<cr>

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

"SEARCH
set showmatch "highlight search
set hlsearch "highlight stays after search

"NETRW
let g:netrw_liststyle = 3 "tree list style
let g:netrw_winsize=25 "winsize 25%
let g:netrw_browse_split=4 "open files in prev window

"EASYMOTION
"two characters easymotion line jumps
nmap <Space> <Plug>(easymotion-s)

"AIRLINE
let g:airline#extensions#tabline#enabled=1 "enable tabline on the top
let g:airline#extensions#tabline#formatter='unique_tail_improved' "change default tabline format

"CTRLP
set wildignore+=*/_/*,*/node_modules/*,*/components/*,*.zip
let g:ctrlp_working_path_mode='ra'
nmap <c-f> :CtrlPBuffer<cr>

"DEOPLETE
let g:deoplete#enable_at_startup=1
let g:deoplete#sources#ternjs#omit_object_prototype=0 " Do not show object.prototype suggestions
"deoplete lua support
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.lua = '\w+|[^. *\t][.:]\w*'

"ALE + ESLINT
nmap <silent> <Right> :ALENext<cr>
nmap <silent> <Left> :ALEPrevious<cr>

"NERDTREE
let NERDTreeShowHidden=1 "show .hidden files

"INDENT GUIDES
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#32312f ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#454442 ctermbg=3

"ALE
let g:ale_sign_column_always=1 "always show gutter

"PRETTIER
let g:prettier#config#arrow_parens='always'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#bracket_spacing = 'true'

"SMOOTH SCROLL
nnoremap <silent> <c-k> :call smooth_scroll#up(&scroll, 0, 2)<CR>
nnoremap <silent> <c-j> :call smooth_scroll#down(&scroll, 0, 2)<CR>

"LUA LOVE
" set love2d errorformat
set errorformat=Error:%*[^:]:\ %f:%l:%m,Error:\ %f:%l:%m,%f:%l:%m
" set love as make program
set makeprg=love\ .

"HTML
imap <silent> <C-t> </<C-X><C-O>

"SMART BUFFER DELETE
"when running :bd run :Sbd
cnoreabbrev bd Sbd

"TERMINAL
"esc mapping
tnoremap jj <C-\><C-n>
tnoremap <Esc> <C-\><C-n>
"fix colors
let g:terminal_color_0  = '#2e3436'
let g:terminal_color_1  = '#cc0000'
let g:terminal_color_2  = '#4e9a06'
let g:terminal_color_3  = '#c4a000'
let g:terminal_color_4  = '#3465a4'
let g:terminal_color_5  = '#75507b'
let g:terminal_color_6  = '#0b939b'
let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'
"no line numbers
augroup TerminalStuff
   au!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
