### Installation

Run git clone in ~ folder

    >mkdir -p ~/.config/nvim && git clone https://github.com/galanonym/nvim.git ~/.config/nvim

Open nvim, ignore no plugin errors, run

    :PlugInstall

If :echo has("python3") returns 0

    >pip3 install --user neovim 

Install tern

    >npm install -g tern

Install eslint

    >npm install -g eslint eslint-plugin-import eslint-config-airbnb-base

Install ripgrep

    >cd ~/.temp
    >wget https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
    >sudo dpkg -i ripgrep_0.8.1_amd64.deb

Configure Coc.vim

    :CocInstall coc-tsserver coc-json
    :CocConfig
    { "coc.preferences.diagnostic.enable": false } - to disable diagnostics that we have with ALE

### Bindings to remember

Obsession

    :Obsession - start session and save it to Session.vim
    :Obsession! - delete session
    :nvim -S - load session from Session.vim

RipGrep

    :Rg - search for word under cursor
    :ccl - close quickfix window
    :Rg word - find word in files
    :Rg '\$some pattern' - find pattern in files

CtrlP

    <c-p> - open CtrlP
    <c-f> - open CtrlP buffers
    <c-k> - move up when CtrlP is open
    <c-j> - move down when CtrlP is open

Prettier

    <l-p> - run prettier
    // @format - add this to top of a file to autorun on save

ALE + ESLint

    <Right> - jump to next error 
    <Left> - jump to prev error 

Smooth Scroll

    <C-j> - scroll down
    <C-k> - scroll up

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
