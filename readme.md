### Installation

Run git clone in ~ folder

    >mkdir -p ~/.config/nvim && git clone https://github.com/galanonym/nvim.git ~/.config/nvim

Open nvim, ignore no plugin errors, run

    :PlugInstall

Run to debug potential python problems

    :healthcheck

Install eslint

    >npm install -g eslint eslint-plugin-import eslint-config-airbnb-base

Install ripgrep

    >sudo apt install ripgrep

Configure Coc

    :CocInstall 
    coc-tsserver coc-json coc-eslint - javascript
    coc-html coc-css - html/css
    coc-phpls - php
    coc-highlight - highlight of hex colors

### Bindings to remember

Custom

    (insert) <C-t> - insert ending html tag automatically 
    <leader>y - copy to clipboard

Smooth Scroll

    <C-j> - scroll down
    <C-k> - scroll up

Obsession

    :Obsession - start session and save it to Session.vim
    :Obsession! - delete session
    :nvim -S - load session from Session.vim

FZF

    <c-p> - open FZF
    <c-f> - open FZF buffers
    <c-h> - open FZF history
    <c-k> - move up when FZF is open
    <c-j> - move down when FZF is open
    <cr> - open file
    <c-v> - open file in vertical split when FZF is open

    <c-g> - open FZF rg
    rg> 'oneWord - search for delimited word
    <c-a><cr> - select all results and open in quickfix

Coc

    ]g - jump to next error 
    [g - jump to prev error 
    gd - jump to definition
    <leader>rn - rename word in current buffer

Prettier

    <leader>p - run prettier
    // @format - add this to top of a file to autorun on save

```
{
  "plugins": {
    "es-modules": {},
    "node": {}
  },
  "libs": [
    "ecma5",
    "ecma6",
    "browser",
    "jquery"
  ],
  "ecmaVersion": 6
}
```
