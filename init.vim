call plug#begin()
"COLORSCHEME
Plug 'sjl/badwolf' "colorscheme
Plug 'mhartington/oceanic-next' "colorscheme

"ESSENTIAL
"Plug 'tpope/vim-sensible' "sensible defaults
Plug 'tpope/vim-unimpaired' "use [ and ] commands
"Plug 'tpope/vim-commentary' "use gcc to comment
Plug 'tomtom/tcomment_vim' "use gcc to comment, supports PHP with HTML and CSS
Plug 'tpope/vim-surround' "add you-surround commands
Plug 'wellle/targets.vim' "better targets
Plug 'easymotion/vim-easymotion' "better line jumps
Plug 'ggandor/lightspeed.nvim' "better line jumps

"STATUSLINE
Plug 'itchyny/lightline.vim' "bottom
Plug 'mengelbrecht/lightline-bufferline' "top
"Plug '844196/lightline-badwolf.vim' "line theme

"FUZZY
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"MORE FEATURES
"Plug 'tpope/vim-sleuth' "automatically set tabwidth -- better just use tabwidth 2
"Plug 'cohama/lexima.vim' "autoclose brackets, quotes and parenthesis -- nvim autopairs is better
Plug 'windwp/nvim-autopairs' "autoclose brackets, quotes and parenthesis
Plug 'alvan/vim-closetag' "autoclose tags
Plug 'AndrewRadev/tagalong.vim' "editing both open/close tags
Plug 'tpope/vim-repeat' "more . repeats for other plugins
Plug 'wesQ3/vim-windowswap' "swap window plugin

"COSMETIC EXTRAS
Plug 'nathanaelkane/vim-indent-guides' "guidelines for indents
Plug 'itchyny/vim-cursorword' "underline word under cursor
Plug 'terryma/vim-smooth-scroll' "smooth scroll
"Plug 'karb94/neoscroll.nvim' "smooth scroll
"Plug 'psliwka/vim-smoothie' "smooth scroll
Plug 'ntpeters/vim-better-whitespace' "highlight unnessesary whitespace
"Plug 'farmergreg/vim-lastplace' "remember cursor position after closing file
Plug 'norcalli/nvim-colorizer.lua'

"SESSIONS
"Plug 'tpope/vim-obsession' "manage sessions

"FILE EXPLORER
Plug 'scrooloose/nerdtree'
Plug 'moll/vim-bbye' "buffer delete without messing up layout

"SYNTAX
"Plug 'sheerun/vim-polyglot' "many syntaxes - but collides with better-indent-support
Plug 'captbaritone/better-indent-support-for-php-with-html' "indent CSS and JS in PHP files

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
set nostartofline "remember cursor position vertiaclly

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
"Enable system clipboard
nmap <F3> :set clipboard=unnamedplus<CR>

"THEME
set number "line numbers
set cursorline "highlight line at cursor position
"matching bracets underlined instead of cursor changing
hi MatchParen cterm=underline ctermbg=none ctermfg=none
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro "disable continuation of comments
set guicursor=a:blinkon100 "cursor blinking

"COLORSCHEME
set termguicolors "add 256 color support
colorscheme OceanicNext
" change comments to italic, must come after colorscheme
highlight Comment gui=italic

"TABS
set expandtab "spaces instead of tabs
set shiftwidth=2 "one tab 2 spaces
set tabstop=2

"SEARCH
set showmatch "highlight search
set hlsearch "highlight stays after search

"WILDMENU
set wildcharm=<Tab> "Allow usage of wildmenu in mappings
set path+=** "adds recursive search to :find command

"EASYMOTION
"two characters easymotion line jumps
nmap <Space> <Plug>(easymotion-s)

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
let g:lightline.colorscheme = 'oceanicnext'

"SMOOTH SCROLL
nnoremap <silent> <c-k> :call smooth_scroll#up(10, 15, 1)<CR>
nnoremap <silent> <c-j> :call smooth_scroll#down(10, 15, 1)<CR>

"INDENT GUIDES
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#2d3d47 ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3a4b55 ctermbg=3

"BUFFER DELETE
"when running :bd run :Sbd
cnoreabbrev bd Bdelete!
cnoreabbrev bw Bwipeout!

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
"highlight both opening and closing tag, and text inside with same color
highlight! link htmlTagName htmlTag
highlight! link htmlEndTag htmlTag

"PHP
let php_var_selector_is_identifier=1 "highlight $ in PHP variable names as same color
"do not treat $ as seperate word
"autocmd FileType php setlocal iskeyword+=$

"AUTOPAIRS
"enable plugin
lua require('nvim-autopairs').setup()

"CLOSETAG
let g:closetag_filenames = '*.html,*.php' "make closetag work with php files

"COLORIZER
"enable plugin
lua require('colorizer').setup()

"unbind vsplit so lightspeed works in nerdtree
let NERDTreeMapOpenVSplit='\n'
