call plug#begin()
" COLORSCHEME
Plug 'mhartington/oceanic-next' " Colorscheme

" ESSENTIAL
Plug 'tpope/vim-unimpaired' " Use [ and ] commands
Plug 'tomtom/tcomment_vim' " Use gcc to comment, supports PHP with HTML and CSS
Plug 'tpope/vim-surround' " Add you-surround commands

" FILE EXPLORER
Plug 'scrooloose/nerdtree' " File explorer
Plug 'moll/vim-bbye' " Buffer delete without messing up layout

" STATUSLINE
Plug 'itchyny/lightline.vim' " Bottom
Plug 'mengelbrecht/lightline-bufferline' " Top

" FUZZY
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" IMPROVMENTS
Plug 'wellle/targets.vim' " Better targets
Plug 'phaazon/hop.nvim' " Better line jumps, through all splits
Plug 'tpope/vim-repeat' " More . repeats for other plugins
Plug 'wesQ3/vim-windowswap' " Swap window plugin
Plug 'windwp/nvim-autopairs' " Autoclose brackets, quotes and parenthesis
Plug 'alvan/vim-closetag' " Autoclose tags
Plug 'AndrewRadev/tagalong.vim' " Editing both open/close tags

" COSMETICS
Plug 'arnamak/stay-centered.nvim' " Always center cursor vertically
Plug 'nathanaelkane/vim-indent-guides' " Guidelines for indents
Plug 'terryma/vim-smooth-scroll' " Smooth scroll
Plug 'ntpeters/vim-better-whitespace' " Highlight unnessesary whitespace
Plug 'ethanholz/nvim-lastplace' " Remember cursor position after closing file
Plug 'norcalli/nvim-colorizer.lua' " Colorize hexdecimal values
Plug 'nvim-treesitter/nvim-treesitter' " Needed for vim-matchup then supports one letter tags
Plug 'andymass/vim-matchup' " Highlight html tags

" SYNTAX
Plug 'captbaritone/better-indent-support-for-php-with-html' " Indent mixed PHP/HTML/CSS

" COMPLETION
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" LINTING
" Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript'] } " Pretty automatic
call plug#end()

" BASICS
set hidden " Files will be hidden and not closed when buffer changes
set title " Set filename in window title tab
set scrolloff=5 " Always stay in the middle when scrolling
set splitright " Open new vertical splits on the right
set splitbelow " Open new horizontal splits on the bottom
set report=0 " Aways show how many lines has changed
set lazyredraw " Better scrolling
set nostartofline " Remember cursor position vertiaclly

" BACKUP
set nobackup " Get rid of annoying ~file
set nowb
set noswapfile

" MAP
" Default ESC
inoremap jj <ESC>
" Open nerdtree and auto resize splits
nmap  <F2> :NERDTreeFind<cr><C-w>=
" Preserve substitution flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>
" Enable system clipboard
nmap <F3> :set clipboard=unnamedplus<CR>

" THEME
set number " Line numbers
set cursorline " Highlight line at cursor position
" Matching bracets underlined instead of cursor changing
hi MatchParen cterm=underline ctermbg=none ctermfg=none
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro " Disable continuation of comments
set guicursor=a:blinkon100 " Cursor blinking

" COLORSCHEME
set termguicolors " Add 256 color support
colorscheme OceanicNext
" Change comments to italic, must come after colorscheme
highlight Comment gui=italic

" TABS
set expandtab " Spaces instead of tabs
set shiftwidth=2 " One tab 2 spaces
set tabstop=2

" SEARCH
set showmatch " Highlight search
set hlsearch " Highlight stays after search

" WILDMENU
set wildcharm=<Tab> " Allow usage of wildmenu in mappings
set path+=** " Adds recursive search to :find command

" HOP
" Two characters easymotion line jumps
nmap <Space> :HopChar2<cr>

" NERDTREE
let NERDTreeShowHidden=1 " Show .hidden files
" Then resize all splits
au VimEnter * wincmd =
" Then move to first splits
au VimEnter * wincmd l

" FZF
nmap <c-p> :Files<cr>
nmap <c-f> :Buffers<cr>
nmap <c-g> :Rg<cr>
" Make fzf use ripgrep to respect .ignore and .gitignore file
let $FZF_DEFAULT_COMMAND='rg --files --smart-case'
" Make fzf grep use rg, and rebind ctrl-a to select all results
command! -bang -nargs=* Rg call fzf#vim#grep(" rg --column --line-number --no-heading --color=always --smart-case " .shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4.. --bind ctrl-a:select-all,ctrl-d:deselect-all'}, <bang>0)

" STATUSLINE
set noshowmode " Do not show --INSERT-- in status line
set showtabline=2 " Show tabline
let g:lightline#bufferline#unnamed = '[No Name]' " Default
let g:lightline#bufferline#filename_modifier = ':t' " Only filenames
let g:lightline = {} " Must have config
let g:lightline.tabline = {'left': [['buffers']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline.colorscheme = 'oceanicnext'

" SMOOTH SCROLL
nnoremap <silent> <c-k> :call smooth_scroll#up(10, 15, 1)<CR>
nnoremap <silent> <c-j> :call smooth_scroll#down(10, 15, 1)<CR>

" INDENT GUIDES
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#2d3d47 ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3a4b55 ctermbg=3

" BUFFER DELETE
" When running :bd run :Sbd
cnoreabbrev bd Bdelete!
cnoreabbrev bw Bwipeout!

" AUTOREAD
" Triger 'autoread' when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost * echohl WarningMsg | echo " File changed on disk. Buffer reloaded."  | echohl None

" COC
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Lightline integration
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
let g:lightline.active = {'left': [['mode', 'paste'], ['readonly', 'filename', 'modified', 'cocstatus', 'currentfunction']]}
let g:lightline.component_function = {'cocstatus': 'coc#status', 'currentfunction': 'CocCurrentFunction'}

" PRETTIER (JavaScript)
let g:prettier#config#arrow_parens='always'
let g:prettier#config#trailing_comma='none'
let g:prettier#config#bracket_spacing='true'
let g:prettier#config#single_quote='true'

" HTML
" Highlight both opening and closing tag, and text inside with same color
highlight! link htmlTagName htmlTag
highlight! link htmlEndTag htmlTag

" PHP
let php_var_selector_is_identifier=1 " Highlight $ in PHP variable names as same color
" Do not treat $ as seperate word
" autocmd FileType php setlocal iskeyword+=$

" AUTOPAIRS
" Enable plugin
lua require('nvim-autopairs').setup()

" CLOSETAG
let g:closetag_filenames = '*.html,*.php' " Make closetag work with php files

" COLORIZER
" Enable plugin
lua require('colorizer').setup()

" HOP
" Enable plugin
lua require('hop').setup({keys = 'arstdhneioqwfpgjluyzxcvbkm', char2_fallback_key = '<cr>', multi_windows = true, case_insensitive = false})

" STAY CENTERED
" Enable plugin
lua require('stay-centered')

" MATCHUP
" Better tagging with treesitter, it supports short tags like <p>
lua <<EOF
require'nvim-treesitter.configs'.setup {
  matchup = {
    enable = true
  }
}
EOF
let g:matchup_matchpref = {} " Must define object first to prevent error
let g:matchup_matchpref.php = {'tagnameonly': 1} " Do not highlight tag attributes

" LASTPLACE
" Enable plugin
lua require('nvim-lastplace').setup()

" WHY I'M NOT USING

" ESSENTIAL
" tpope/vim-sensible - no longer needed in neovim
" tpope/vim-commentary - does not support mixed PHP/HTML/CSS
" easymotion/vim-easymotion - continues as phaazon/hop.nvim which supports jumps through splits
" ggandor/lightspeed - not possible to use with NERDTree, not supporting bidirectional search

" FEATURES
" tpope/vim-sleuth - usually working with 2 spaces, not needed
" cohama/lexima.vim - autoclose brackets - nvim-autopairs works better
" windwp/nvim-ts-autotag - autoclose/edit tags - does not support indented newline when writing HTML tags in PHP files, but is better when editing one letter tags, because based on treesitter

" COSMETICS
" itchyny/vim-cursorword - underline word under cursor - collides with vim-matchup

" SESSIONS
" tpope/vim-obsession - manage sessions - not using in practice

" SYNTAX
" sheerun/vim-polyglot - many syntaxes - collides with better-indent-support
