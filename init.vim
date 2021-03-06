call plug#begin()
"COLORSCHEME
Plug 'sjl/badwolf' "colorscheme

"ESSENTIAL
Plug 'tpope/vim-sensible' "sensible defaults
Plug 'tpope/vim-unimpaired' "use [ and ] commands
Plug 'tpope/vim-commentary' "use gcc to comment
Plug 'tpope/vim-surround' "add you-surround commands
Plug 'wellle/targets.vim' "better targets
Plug 'easymotion/vim-easymotion' "better line jumps

"STATUSLINE
Plug 'itchyny/lightline.vim' "bottom
Plug 'mengelbrecht/lightline-bufferline' "top
Plug '844196/lightline-badwolf.vim' "line theme

"FUZZY
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"MORE FEATURES
Plug 'tpope/vim-sleuth' "automatically set tabwidth
Plug 'cohama/lexima.vim' "autoclose brackets, quotes and parenthesis
Plug 'tpope/vim-repeat' "more . repeats for other plugins
Plug 'wesQ3/vim-windowswap' "swap window plugin

"COSMETIC EXTRAS
Plug 'nathanaelkane/vim-indent-guides' "guidelines for indents
Plug 'itchyny/vim-cursorword' "underline word under cursor
Plug 'terryma/vim-smooth-scroll' "smooth scroll

"SESSIONS
Plug 'tpope/vim-obsession' "manage sessions
Plug 'farmergreg/vim-lastplace' "remember cursor position vertically

"FILE EXPLORER
Plug 'scrooloose/nerdtree'
Plug 'moll/vim-bbye' "buffer delete without messing up layout

"SYNTAX
Plug 'sheerun/vim-polyglot' "many syntaxes

"COMPLETION
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

"LINTING
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': 'javascript' } "Pretty automatic javascript
call plug#end()

"BASICS
set hidden "files will be hidden and not closed when buffer changes
set title "set filename in window title tab
set scrolloff=5 "always stay in the middle when scrolling
set splitright "open new vertical splits on the right
set splitbelow "open new horizontal splits on the bottom
set report=0 "aways show how many lines has changed
set lazyredraw "better scrolling

"BACKUP
set nobackup "get rid of annoying ~file
set nowb
set noswapfile

"MAP
"Default ESC
inoremap jj <ESC>
"Open nerdtree and auto resize splits
nmap  <F2> :NERDTreeFind<cr><C-w>=
"Preserve substitution flags 
nnoremap & :&&<CR> 
xnoremap & :&&<CR> 
"Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>y  "+y
"use <C-j> for inserting new line in normal mode
nnoremap <NL> i<CR><ESC> 
 
"THEME
set number "line numbers
set cursorline "highlight line at cursor position
"matching bracets underlined instead of cursor changing
hi MatchParen cterm=underline ctermbg=none ctermfg=none
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro "disable continuation of comments
set guicursor=a:blinkon100 "cursor blinking

"COLORSCHEME
set termguicolors "add 256 color support
colorscheme badwolf
" change comments to italic, must come after colorscheme
highlight Comment gui=italic 

"SEARCH
set showmatch "highlight search
set hlsearch "highlight stays after search

"WILDMENU
set wildcharm=<Tab> "Allow usage of wildmenu in mappings
set path+=** "adds recursive search to :find command

"NETRW
let g:netrw_liststyle=3 "tree list style
autocmd FileType netrw setl bufhidden=delete "fix netrw hanging buffer bug

"EASYMOTION
"two characters easymotion line jumps
nmap <Space> <Plug>(easymotion-s)

"ENABLE PROJECT VIMRC FILE
set exrc "execute .vimrc in project location
set secure "do not allow dangerous commands

"NERDTREE
let NERDTreeShowHidden=1 "show .hidden files
"then resize all splits
au VimEnter * wincmd =
"then move to first splits
au VimEnter * wincmd l

"FZF
nmap <c-p> :Files<cr>
nmap <c-f> :Buffers<cr>
nmap <c-g> :Rg<cr>
"Make fzf use ripgrep to respect .ignore and .gitignore file
let $FZF_DEFAULT_COMMAND='rg --files --smart-case'
"Make fzf grep use rg, and rebind ctrl-a to select all results
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4.. --bind ctrl-a:select-all,ctrl-d:deselect-all'}, <bang>0)

"STATUSLINE
set noshowmode "do not show --INSERT-- in status line
set showtabline=2 "show tabline
let g:lightline#bufferline#unnamed = '[No Name]' "default
let g:lightline#bufferline#filename_modifier = ':t' "only filenames
let g:lightline = {} "must have config
let g:lightline.tabline = {'left': [['buffers']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline.colorscheme = 'badwolf'

"SMOOTH SCROLL
nnoremap <silent> <c-k> :call smooth_scroll#up(10, 15, 1)<CR>
nnoremap <silent> <c-j> :call smooth_scroll#down(10, 15, 1)<CR>

"INDENT GUIDES
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#32312f ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#454442 ctermbg=3

"BUFFER DELETE
"when running :bd run :Sbd
cnoreabbrev bd Bdelete!
cnoreabbrev bw Bwipeout!

"TERMINAL
"esc mapping (that not conflicts with fzf)
tmap jj <c-\><c-n>
tmap <c-w>h <c-\><c-n><c-w>h
tmap <c-w>l <c-\><c-n><c-w>l
tmap <c-w>j <c-\><c-n><c-w>j
tmap <c-w>k <c-\><c-n><c-w>k

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

"AUTOREAD
" Triger 'autoread' when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"COC
"Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
"Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
"Lightline integration
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
let g:lightline.active = {'left': [['mode', 'paste'], ['readonly', 'filename', 'modified', 'cocstatus', 'currentfunction']]}
let g:lightline.component_function = {'cocstatus': 'coc#status', 'currentfunction': 'CocCurrentFunction'}

"PRETTIER
let g:prettier#config#arrow_parens='always'
let g:prettier#config#trailing_comma='none'
let g:prettier#config#bracket_spacing='true'
let g:prettier#config#single_quote='true'

"HTML
"insert ending tag automatically
imap <silent> <C-t> </<C-X><C-O>

"PHP
"always use autoindent in php files
autocmd FileType php setlocal autoindent
